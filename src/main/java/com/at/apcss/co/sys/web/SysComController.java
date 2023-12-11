package com.at.apcss.co.sys.web;

import java.util.Base64;
import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cryptography.EgovCryptoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.service.ComCryptoService;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.sys.vo.ComVO;
import egovframework.com.cmm.service.EgovProperties;

/**
 * System 공통사항을 처리하는 컨트롤러 클래스
 *
 * @author SI개발부 신정철
 * @since 2023.06.15
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.15  신정철     	최초 생성
 *
 *      </pre>
 */
@Controller
public class SysComController extends BaseController {

	
	public static final String ALGORITM_KEY = EgovProperties.getProperty("Globals.crypto.algoritm");
	
	/** 암호화서비스 */
    @Resource(name="comCryptoService")
    ComCryptoService comCryptoService;
    
	@Autowired
	ComLogService comLogService;

	@PostMapping(value = "/sys/actionNewTab.do", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> actionNewTab(@RequestBody ComLogVO comLogVO,
			HttpServletRequest request) throws Exception {

		String sysPrgrmId = comLogVO.getPrgrmId();

		logger.debug("############ sysPrgrmId: {}", sysPrgrmId);

		logger.debug("pre id : {}", (String) request.getSession().getAttribute(ComConstants.PROP_SYS_PRGRM_ID));
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, sysPrgrmId);

		logger.debug("@@@@@@@@@@@@ getUserId: {}", getUserId());
		logger.debug("@@@@@@@@@@@@ getPrgrmId: {}", getPrgrmId());

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/sys/actionOldTab.do", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> actionOldTab(@RequestBody ComVO comVO, HttpServletRequest request)
			throws Exception {

		String sysPrgrmId = comVO.getSysPrgrmId();
		logger.debug("############ sysPrgrmId: {}", sysPrgrmId);

		logger.debug("pre id : {}", (String) request.getSession().getAttribute(ComConstants.PROP_SYS_PRGRM_ID));
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, sysPrgrmId);

		logger.debug("@@@@@@@@@@@@ getUserId: {}", getUserId());
		logger.debug("@@@@@@@@@@@@ getPrgrmId: {}", getPrgrmId());

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/sys/insertComLog.do", consumes = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertComLog(@RequestBody ComLogVO comLogVo,
			HttpServletRequest request) throws Exception {
			String userId = getUserId();
			String userType = getUserType();
			String menuId = comLogVo.getMenuId();
			comLogVo.setUserId(userId);
			comLogVo.setUserType(userType);
			comLogVo.setUserIp(getUserIp(request));

			if (getUserId() != null) {
				comLogVo.setLgnScsYn("Y");
			}

			comLogVo.setSysFrstInptUserId(userId);
			comLogVo.setSysLastChgUserId(userId);
			comLogVo.setSysFrstInptPrgrmId(menuId);
			comLogVo.setSysLastChgPrgrmId(menuId);
			if (ComConstants.CON_YES.equals(comLogVo.getFlfmtTaskSeCd())) {
				comLogVo.setFlfmtTaskSeCd("01");
			}else {
				comLogVo.setFlfmtTaskSeCd("");
			}

		comLogService.insertMenuHstry(comLogVo);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/sys/actionCrypto", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> actionCrypto(@RequestBody ComVO comVO, HttpServletRequest request)
			throws Exception {

		String userId = ComUtil.nullToEmpty(comVO.getSysUserId());
		logger.debug("############ userId: {}", userId);
		
		String encryptedText = comCryptoService.encrypt(userId);
		
		//String encryption = Base64.getEncoder().encodeToString(cryptoService.encrypt(userId.getBytes(), ALGORITM_KEY));
		logger.debug("encryption: {}", encryptedText);
		
		//byte[] decodedBytes = Base64.getDecoder().decode(encryption);
		//String decryption = new String(cryptoService.decrypt(decodedBytes, ALGORITM_KEY));
		String decryptedText = comCryptoService.decrypt(encryptedText);
		
		logger.debug("decription: {}", decryptedText);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("userId", userId);
		resultMap.put("encryption", encryptedText);
		resultMap.put("decription", decryptedText);
		resultMap.put("salt", ALGORITM_KEY);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
}
