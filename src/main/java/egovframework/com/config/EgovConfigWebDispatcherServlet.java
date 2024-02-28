package egovframework.com.config;

import java.util.List;
import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import egovframework.com.cmm.interceptor.AuthenticInterceptor;
import egovframework.com.cmm.interceptor.CustomAuthenticInterceptor;
import egovframework.com.cmm.interceptor.HttpInterceptor;
import egovframework.com.cmm.interceptor.MobileAuthenticInterceptor;
import egovframework.com.cmm.service.EgovProperties;

/**
 * @ClassName : EgovConfigWebDispatcherServlet.java
 * @Description : DispatcherServlet 설정
 *
 * @author : 윤주호
 * @since  : 2021. 7. 20
 * @version : 1.0
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일              수정자               수정내용
 *  -------------  ------------   ---------------------
 *   2021. 7. 20    윤주호               최초 생성
 * </pre>
 *
 */
@Configuration
@ComponentScan(basePackages = {"egovframework", "com"}, excludeFilters = {
	@ComponentScan.Filter(type = FilterType.ANNOTATION, value = Service.class),
	@ComponentScan.Filter(type = FilterType.ANNOTATION, value = Repository.class),
	@ComponentScan.Filter(type = FilterType.ANNOTATION, value = Configuration.class)
})
public class EgovConfigWebDispatcherServlet implements WebMvcConfigurer {

	final static String RESOLVER_DEFAULT_ERROR_VIEW = "cmm/error/egovError";

	final static int URL_BASED_VIEW_RESOLVER_ORDER = 1;
	final static String URL_BASED_VIEW_RESOLVER_PREFIX = "/WEB-INF/jsp/";
	final static String URL_BASED_VIEW_RESOLVER_SUFFIX = ".jsp";

	//private final String[] CORS_ORIGIN_SERVER_URLS = {"http://127.0.0.1:3000", "http://localhost:3000"};
	public static final String CORS_ORIGIN_SERVER_URL = EgovProperties.getProperty("Globals.Allow.Origin");
	// =====================================================================
	// RequestMappingHandlerMapping 설정
	// =====================================================================
	// -------------------------------------------------------------
	// RequestMappingHandlerMapping 설정 - Interceptor 추가
	// -------------------------------------------------------------
	
	@Bean
	public MobileAuthenticInterceptor mobileAuthenticInterceptor() {
	    return new MobileAuthenticInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//registry.addInterceptor(new AuthenticInterceptor())
		registry.addInterceptor(authenticInterceptor())
			.addPathPatterns(
//				"/cop/com/*.do",
//				"/cop/bbs/*Master*.do",
				"/**/*.do",
				"/main.do",
				"/actionMain.do",
				"/uat/uia/*.do")
			.excludePathPatterns(
				"/uat/uia/actionLogin.do",
				"/uat/uia/actionLoginAPI.do",
				"/uat/uia/actionLoginJWT.do",
				"/uat/uia/egovLoginUsr.do",
				"/uat/uia/egovLoginUsrAPI.do",
				"/uat/uia/actionLogoutAPI.do",
				"/actionLogin.do",
				"/actionSSOLogin.do",
				"/actionSSOLoginApc.do",
				"/actionSSOLoginApcIns.do",
				"/actionSSOLoginApcInsReq.do",
				"/actionLogout.do",
				"/login.do",
				"/saveExcel.do",
				"/am/spmt/getSpmtDoc.do",
				"/fm/popup/jusoPopup.do",
				"/report/**",
				"/api/mobile/*.do"
				);
		registry.addInterceptor(new CustomAuthenticInterceptor())
			.addPathPatterns(
				"/**/*.do",
				"/saveExcel.do")
			.excludePathPatterns(
				"/uat/uia/**",
				"/saveExcel.do",
				"/report/**",
				"/api/mobile/*.do");
		registry.addInterceptor(mobileAuthenticInterceptor())
			.addPathPatterns(
				"/api/mobile/*.do")
			.excludePathPatterns(
				"/api/mobile/authenticate.do",
				"/api/mobile/refreshToken.do");
		registry.addInterceptor(new HttpInterceptor())
			.addPathPatterns(
					"/**");
	}

	@Bean
	public AuthenticInterceptor authenticInterceptor() {
		return new AuthenticInterceptor();
	}

	// -------------------------------------------------------------
	// RequestMappingHandlerMapping 설정 View Controller 추가
	// -------------------------------------------------------------
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/cmmn/validator.do")
			.setViewName("cmmn/validator");
		//registry.addViewController("/").setViewName("forward:/index.html");
		registry.addViewController("/").setViewName("forward:/main.do");
	}

	// -------------------------------------------------------------
	// HandlerExceptionResolver 설정
	// -------------------------------------------------------------
	@Override
	public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
		SimpleMappingExceptionResolver simpleMappingExceptionResolver = new SimpleMappingExceptionResolver();

		simpleMappingExceptionResolver.setDefaultErrorView(RESOLVER_DEFAULT_ERROR_VIEW);

		Properties mappings = new Properties();
		mappings.setProperty("org.springframework.dao.DataAccessException", "cmm/error/dataAccessFailure");
		mappings.setProperty("org.springframework.transaction.TransactionException", "cmm/error/transactionFailure");
		mappings.setProperty("org.egovframe.rte.fdl.cmmn.exception.EgovBizException", "cmm/error/egovError");
		mappings.setProperty("org.springframework.security.AccessDeniedException", "cmm/error/accessDenied");

		simpleMappingExceptionResolver.setExceptionMappings(mappings);

		exceptionResolvers.add(simpleMappingExceptionResolver);
	}

	// -------------------------------------------------------------
	// View Resolver 설정
	// -------------------------------------------------------------
	/*
	 * @Bean public UrlBasedViewResolver urlBasedViewResolver() {
	 * UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
	 * urlBasedViewResolver.setOrder(URL_BASED_VIEW_RESOLVER_ORDER);
	 * urlBasedViewResolver.setViewClass(JstlView.class);
	 * urlBasedViewResolver.setPrefix(URL_BASED_VIEW_RESOLVER_PREFIX);
	 * urlBasedViewResolver.setSuffix(URL_BASED_VIEW_RESOLVER_SUFFIX); return
	 * urlBasedViewResolver; }
	 */

	// -------------------------------------------------------------
	// CORS 설정 추가
	// -------------------------------------------------------------
//	@Override
//	public void addCorsMappings(CorsRegistry registry) {
//		registry.addMapping("*.do").allowedOrigins(CORS_ORIGIN_SERVER_URLS);
//	}
	/*
	@Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins(CORS_ORIGIN_SERVER_URL)
                //.allowedOrigins("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                //.allowedMethods("GET", "POST")
                .allowedHeaders("Authorization", "Content-Type")
                .exposedHeaders("Custom-Header")
                .allowCredentials(true)
                .maxAge(3600);
    }
    */
}
