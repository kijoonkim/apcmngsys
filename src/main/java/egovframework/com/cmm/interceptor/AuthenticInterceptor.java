package egovframework.com.cmm.interceptor;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.ComSysService;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.sys.vo.LoginVO;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

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
 *  2014.06.11  이기하          인증이 필요없는 URL을 패스하는 로직 삭제(xml로 대체)
 *  </pre>
 */

public class AuthenticInterceptor extends WebContentInterceptor {

	private final Logger log = LoggerFactory.getLogger(CustomAuthenticInterceptor.class);

	@Resource(name = "comSysService")
	private ComSysService comSysService;	
	
	/**
	 * 세션에 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {

		// set program id
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, request.getHeader(ComConstants.PROP_SYS_PRGRM_ID));

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		/*
		log.debug("getRequestURL {}", request.getRequestURL());
		log.debug("getRequestURI {}", request.getRequestURI());
		log.debug("getMethod {}", request.getMethod());
		log.debug("getContentType {}", request.getContentType());
		 */		
		
		boolean isRtnJson = false;
		String uri = ComUtil.nullToEmpty(request.getRequestURI());
		log.debug("uri {}", uri);
		if (	"POST".equals(request.getMethod())
				&& (uri.contains("/select")
				|| uri.contains("/insert")
				|| uri.contains("/update")
				|| uri.contains("/delete")
				|| uri.contains("/multi"))) {
			isRtnJson = true;
		}
		
		if (loginVO.getId() != null) {

			log.debug("AuthenticInterceptor sessionID "+loginVO.getId());
			log.debug("AuthenticInterceptor ================== ");

			boolean isValidSession = true;
			
			// 세션id 만료여부 조회
			String jsseionId = request.getSession().getId();
			log.debug("jsseionId {}", jsseionId);
			try {
				isValidSession = comSysService.checkSessionValid(jsseionId);
				
				if (!isValidSession) {
					throw new ModelAndViewDefiningException(getModelAndView(isRtnJson));
				}
				
			} catch (Exception e) {
				throw new ModelAndViewDefiningException(getModelAndView(isRtnJson));
			}
			
			return isValidSession;
			
		} else {

			log.debug("AuthenticInterceptor Fail!!!!!!!!!!!!================== ");
//			ModelAndView modelAndView = new ModelAndView("redirect:/uat/uia/egovLoginUsr.do");
//			ModelAndView modelAndView = new ModelAndView("redirect:http://localhost:3000/login");
            //ModelAndView modelAndView = new ModelAndView("redirect:/login.do");
            
			//throw new ModelAndViewDefiningException(modelAndView);
			throw new ModelAndViewDefiningException(getModelAndView(isRtnJson));
		}
	}
	
	private ModelAndView getModelAndView(boolean isRtnJson) {
		ModelAndView modelAndView = new ModelAndView("redirect:/login.do");
		if (isRtnJson) {
			modelAndView = new ModelAndView("redirect:/accessDenied");
		}
		return modelAndView;
	}

}
