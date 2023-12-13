package egovframework.com.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.at.apcss.co.constants.ComConstants;

/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식
 * @since 2011.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.07.01  서준식          최초 생성
 *  2011.09.07  서준식          인증이 필요없는 URL을 패스하는 로직 추가
 *  </pre>
 */

public class HttpInterceptor extends HandlerInterceptorAdapter {

	private final Logger log = LoggerFactory.getLogger(HttpInterceptor.class);
	
	/**
	 * method checker
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String httpMethod = request.getMethod();
	    
	    if (HttpMethod.GET.matches(httpMethod) || HttpMethod.POST.matches(httpMethod)) {
	    	return true;
	    } else {
	    	response.sendError(HttpStatus.METHOD_NOT_ALLOWED.value());
	    	return false;
	    }
	}
}
