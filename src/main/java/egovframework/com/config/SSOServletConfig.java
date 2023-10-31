package egovframework.com.config;

import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ubintis.app.AppService;

/**
 * @ClassName : SSOServletConfig.java
 * @Description : SSO 설정
 *
 * @author : 신정철
 * @since  : 2023.10.31
 * @version : 1.0
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일              수정자               수정내용
 *  -------------  ------------   ---------------------
 *   2023.10.30    신정철               최초 생성
 * </pre>
 *
 */
@Configuration
public class SSOServletConfig {
	
	@Bean
	public ServletRegistrationBean ssoServiceRegistration() {

		ServletRegistrationBean registrationBean = new ServletRegistrationBean( new AppService() );
		registrationBean.addUrlMappings( "/SSOService.do" );

		return registrationBean;
	}
}
