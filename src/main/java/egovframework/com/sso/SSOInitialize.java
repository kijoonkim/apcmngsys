package egovframework.com.sso;


import java.io.File;
import java.security.Security;
import java.util.HashMap;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import com.ubintis.api.ApiLogService;
import com.ubintis.cert.CertificateLoad;
import com.ubintis.cert.bouncycastle.jce.provider.BouncyCastleProvider;
import com.ubintis.common.util.StrUtil;
import com.ubintis.framework.bean.AgentBean;
import com.ubintis.framework.bean.IntgrtyBean;
import com.ubintis.framework.config.AgentConfig;
import com.ubintis.framework.config.IntgrtyConfig;
import com.ubintis.framework.log.LoggerFactory;
import com.ubintis.sso.agt.cs.Crypto;
import com.ubintis.sso.agt.cs.key.KeyStorage;
import com.ubintis.sso.agt.ia.key.KeyExchange;
import com.ubintis.sso.agt.pt.SelfTestAgent;

@Component( "ssoInitialize" )
public class SSOInitialize {

	private final static Logger LOGGER = Logger.getLogger( LoggerFactory.LogName );
	
	private static final String BC = com.ubintis.cert.bouncycastle.jce.provider.BouncyCastleProvider.PROVIDER_NAME;
	
	@Autowired
	Environment env;
	
	@PostConstruct
	private void init() {
		
		if( Security.getProvider( BC ) == null ) {
			Security.addProvider( new BouncyCastleProvider() );
		}

		StringBuffer sbLog = new StringBuffer();

		sbLog.append( "\n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "### \n" );
		sbLog.append( "### Pass-Ni SSO Agent for JAVA Initialization\n" );
		sbLog.append( "### Copyright (c) UbiNtisLab Co., Ltd. All rights reserved.\n" );
		sbLog.append( "### \n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "### \n" );

		String errorMsg = "";
		
		String agent_id = "";
		String agent_version = "4.0";
		
		Crypto crypto = new Crypto();

		/*
		 * 1. Agent Properties File Load
		 */
		
		//String webinfPath = System.getProperty( "spring.webinf.path" );
		String webinfPath = env.getProperty("spring.webinf.path");
//		String webinfPath = servletContext.getRealPath( "/WEB-INF" );
		
		AgentConfig agentConfig = AgentConfig.getInstance( webinfPath );
		AgentBean agentBean = agentConfig.getAgentBean();
		
		sbLog.append( "### " + webinfPath + "\n" );

		if( agentConfig.getStatus() && agentBean != null ) {
			agent_id = StrUtil.NVL( agentBean.getAgent_id() );
			agent_version = StrUtil.NVL( agentBean.getAgent_version(), "4.0" );
			
			sbLog.append( "### AGENT ID : " + agent_id + " [" + agentBean.getAgent_domain() + "]\n" );
			sbLog.append( "### \n" );
			
			/*
			 * 2. Logger Factory Create
			 */
			LoggerFactory loggerFactory = LoggerFactory.getInstance();

			if( loggerFactory.getStatus() ) {

				/*
				 * 3. Pass-Ni Crypto Initialize
				 */
				sbLog.append( "### " + crypto.getCryptoVersion() + " [" + crypto.getJNIVersion() + "]\n" );

				if( crypto.cryptoInitialize() ) {
					sbLog.append( "### Pass-Ni Crypto Initialize : Success\n" );
					
					/*
					 * 4. Certificate Verification
					 */
					String certFilePath = agentBean.getCert_file_path() + File.separator;
					String certFileServerName = agentBean.getCert_file_server_name();
					String certFileAgentName = agentBean.getCert_file_agent_name();
					String certPniType = StrUtil.NVL( agentBean.getCert_pni_type(), "1" );

					CertificateLoad certificateLoad = new CertificateLoad();

					certificateLoad.loadCertFile( certFilePath, certFileServerName, certFileAgentName, certPniType, agent_id );
					
					if( certificateLoad.getStatus() ) {
						sbLog.append( "### Certificate File Load : Success\n" );
						
						sbLog.append( "### \n" );
						
						sbLog.append( "### Logger Factory Create : Success\n" );
						
						/*
						 * 5. Properties Data Decrypt
						 */
						agentConfig.decryptProperties();
						
						if( agentConfig.getStatus() ) {
							sbLog.append( "### Agent Config Properties Load : Success\n" );
							
							/*
							 * 6. Intgrty Properties File Load
							 */
							if( IntgrtyConfig.getInstance().getStatus() ) {
								sbLog.append( "### Intgrty Config Properties Load : Success\n" );
								
								/*
								 * 7. Server to Agent Key Exchange
								 */
								KeyExchange keyExchange = new KeyExchange();
								keyExchange.execute();
								
								if( keyExchange.getStatus() ) {
									sbLog.append( "### Server - Agent Key Exchange : Success\n" );
									
								} else {
									errorMsg = "Server - Agent Key Exchange : Fail [" + keyExchange.getErrorCode()+ "]";
								}
								
							} else {
								errorMsg = "Intgrty Config Properties Load : Fail";
							}
							
						} else {
							errorMsg = "Agent Config Properties Decrypt : Fail";
						}
						
					} else {
						errorMsg = "Certificate File Load : Fail [" + certificateLoad.getErrorCode() + "]";
					}

				} else {
					errorMsg = "Pass-Ni Crypto Initialize : Fail [" + crypto.getErrRet() + "]";
				}

			} else {
				errorMsg = "Logger Factory Create : Fail";
			}

		} else {
			errorMsg = "Agent Config Properties Load : Fail";
		}
		
		if( !"".equals( errorMsg ) ) {
			sbLog.append( "### " + errorMsg + "\n" );
		}
		
		sbLog.append( "### \n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "### \n" );
		
		ApiLogService apiLogService = new ApiLogService();
		
		if( "".equals( errorMsg ) ) {
			apiLogService.startLog( true );
			
			SelfTestAgent selfTestAgent = new SelfTestAgent();
			
			HashMap<String, String> testMap = selfTestAgent.execute();
			
			String cryptoTestYn = StrUtil.NVL( testMap.get( "cryptoTest" ) );
			
			if( "Y".equals( cryptoTestYn ) ) {
				sbLog.append( "### Pass-Ni Crypto Self Test : Success\n" );

			} else {
				sbLog.append( "### Pass-Ni Crypto Self Test : Fail [" + selfTestAgent.getCryptoErrRet() + "]\n" );
			}
			
			String intgrtyAgentConfigTestYn = StrUtil.NVL( testMap.get( IntgrtyBean.INTGRTY_AGENT_CONFIG ) );
			
			if( "Y".equals( intgrtyAgentConfigTestYn ) ) {
				sbLog.append( "### Agent Config File Integrity Test : Success\n" );
				
			} else {
				sbLog.append( "### Agent Config File Integrity Test : Fail\n" );
			}
			
			String intgrtyAgentModuleYn = StrUtil.NVL( testMap.get( IntgrtyBean.INTGRTY_AGENT_MODULE ) );
			
			if( "Y".equals( intgrtyAgentModuleYn ) ) {
				sbLog.append( "### Agent Module Integrity Test : Success\n" );
				
			} else {
				sbLog.append( "### Agent Module Integrity Test : Fail\n" );
			}
			
			String intgrtyPassniCryptoYn = StrUtil.NVL( testMap.get( IntgrtyBean.INTGRTY_PASSNI_CRYPTO ) );
			
			if( "Y".equals( intgrtyPassniCryptoYn ) ) {
				sbLog.append( "### Passni Crypto Integrity Test : Success\n" );
				
			} else {
				sbLog.append( "### Passni Crypto Integrity Test : Fail\n" );
			}
			
			sbLog.append( "### \n" );
			sbLog.append( "################################################################################\n" );
			sbLog.append( "### \n" );
			
			sbLog.append( "### Product : Pass-Ni SSO v4.0\n" );
			sbLog.append( "### Appliation : Pass-Ni SSO Agent for JAVA v" + agent_version + "\n" );
			sbLog.append( "### \n" );
			sbLog.append( "### Initialization Success\n" );
		
		} else {
			apiLogService.startLog( false );
			
			sbLog.append( "### Product : Pass-Ni SSO v4.0\n" );
			sbLog.append( "### Appliation : Pass-Ni SSO Agent for JAVA v" + agent_version + "\n" );
			sbLog.append( "### \n" );
			sbLog.append( "### Initialization Fail\n" );
		}

		sbLog.append( "### \n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "\n" );

		LOGGER.info( sbLog.toString() );
	}
	
	@PreDestroy
	public void destroy() {
		
		ApiLogService apiLogService = new ApiLogService();
		apiLogService.stopLog();
		
		Security.removeProvider( BC );
		
		StringBuffer sbLog = new StringBuffer();
		
		sbLog.append( "\n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "### \n" );
		sbLog.append( "### Pass-Ni SSO Agent for JAVA Destroyed\n" );
		sbLog.append( "### Copyright (c) UbiNtisLab Co., Ltd. All rights reserved.\n" );
		sbLog.append( "### \n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "### \n" );
		
		Crypto crypto = new Crypto();
		
		if( crypto.cryptoFinalize() ) {
			sbLog.append( "### Pass-Ni Crypto Finalize : Success\n" );
			
		} else {
			sbLog.append( "### Pass-Ni Crypto Finalize : Fail\n" );
		}
		
		try {
			KeyStorage.getInstance().destroy();
			sbLog.append( "### Key Storage Destroyed : Success\n" );
		} catch( Exception e ) {
			sbLog.append( "### Key Storage Destroyed : fail\n" );
		}
		
		sbLog.append( "### \n" );
		
//		sbLog.append( "### Logger Factory Destroyed : Success\n" );
		
		try {
			AgentConfig.getInstance().destroy();
			sbLog.append( "### Agent Config Properties Unload : Success\n" );
		} catch( Exception e ) {
			sbLog.append( "### Agent Config Properties Unload : fail\n" );
		}
		
		try {
			IntgrtyConfig.getInstance().destroy();
			sbLog.append( "### Intgrty Config Properties Unload : Success\n" );
		} catch( Exception e ) {
			sbLog.append( "### Intgrty Config Properties Unload : fail\n" );
		}	
		
		sbLog.append( "### \n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "################################################################################\n" );
		sbLog.append( "\n" );
		
		LOGGER.info( sbLog.toString() );
	}
}
