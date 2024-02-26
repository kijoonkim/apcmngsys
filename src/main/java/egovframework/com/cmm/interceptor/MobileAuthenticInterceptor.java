package egovframework.com.cmm.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;
import com.at.apcss.mobile.service.MobileApiService;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.jwt.config.EgovJwtTokenUtil;
import io.jsonwebtoken.ExpiredJwtException;

/**
 * 인증여부 체크 인터셉터
 * @author 모바일 개발 김기
 * @since 2023.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2023.12.11  김기준          최초 생성
 *  </pre>
 */

public class MobileAuthenticInterceptor extends HandlerInterceptorAdapter {

	private final Logger log = LoggerFactory.getLogger(MobileAuthenticInterceptor.class);
	
	@Resource(name= "mobileApiService")
	private MobileApiService mobileApiService;
	
	/** LoginService */
	@Resource(name = "loginService")
	private LoginService loginService;

	/** ApcInfoService */
	@Resource(name = "apcInfoService")
	private ApcInfoService apcInfoService;
	
	@Resource(name = "comUserService")
	private ComUserService comUserService;

	/** JWT */
	@Autowired
    private EgovJwtTokenUtil jwtTokenUtil;
	
	/**
	 * Header에 Authorization 값으로 전달된 토큰 값을 검증한다. 
	 * AccessToken이 만료된 경우 RefreshToken을 TB_REFRESHTOKEN 테이블에서 값을 조회하여 유효성 검증하고 이상 없으면 AccessToken을 발급한다.
	 * RefreshToken이 만료된 경우 로그인 인증을 재요청한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String userId = null;
		String jwtToken = getTokenFromRequest(request);
		if (jwtToken != null) {
			
			try {
				userId = jwtTokenUtil.getUsernameFromToken(jwtToken);
			} catch (IllegalArgumentException e) {
				System.out.println("Unable to get JWT Token");
				ModelAndView modelAndView = new ModelAndView("result");
				JSONObject json = new JSONObject();
				json.put("STATUS", "error");
				json.put("CODE", "9999");
				json.put("MESSAGE", "Unable to get JWT Token");
				modelAndView.addObject("result", json);
				throw new ModelAndViewDefiningException(modelAndView);
				//return false;
			} catch (ExpiredJwtException e) {
				System.out.println("JWT Token has expired");
				ModelAndView modelAndView = new ModelAndView("result");
				JSONObject json = new JSONObject();
				json.put("STATUS", "error");
				json.put("CODE", "9999");
				json.put("MESSAGE", "JWT Token has expired");
				modelAndView.addObject("result", json);
				throw new ModelAndViewDefiningException(modelAndView);
			}
		} else {
			System.out.println("Unable to get JWT Token");
			ModelAndView modelAndView = new ModelAndView("result");
			JSONObject json = new JSONObject();
			json.put("STATUS", "error");
			json.put("CODE", "9999");
			json.put("MESSAGE", "Unable to get JWT Token");
			modelAndView.addObject("result", json);
			throw new ModelAndViewDefiningException(modelAndView);
			
			//return false;
		}
		
		if (userId != null) {
			ComUserVO userDetails = comUserService.selectComUser(userId);
			if ( userDetails != null) {
				Map<String, Object> storedRefreshToken;
				try {
					storedRefreshToken = mobileApiService.findRefreshToken(userId);
					egovframework.com.cmm.LoginVO cmmLoginVO = new egovframework.com.cmm.LoginVO();
					cmmLoginVO.setId(userId);
					if (storedRefreshToken != null && !isRefreshTokenExpired(storedRefreshToken) && jwtTokenUtil.validateToken(jwtToken, cmmLoginVO)) {
						return true;
					}else {
						ModelAndView modelAndView = new ModelAndView("result");
						JSONObject json = new JSONObject();
						json.put("STATUS", "error");
						json.put("CODE", "9999");
						json.put("MESSAGE", "JWT Token has expired");
						modelAndView.addObject("result", json);
						throw new ModelAndViewDefiningException(modelAndView);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					ModelAndView modelAndView = new ModelAndView("result");
					JSONObject json = new JSONObject();
					json.put("STATUS", "error");
					json.put("CODE", "9999");
					json.put("MESSAGE", "UNAUTHORIZED");
					modelAndView.addObject("result", json);
					throw new ModelAndViewDefiningException(modelAndView);
				}
			}
		}
		
		return true;
	}
	
	private String getTokenFromRequest(HttpServletRequest request) {
		final String requestTokenHeader = request.getHeader("Authorization");
		//siteID 값을 구한다.
		if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {
			return requestTokenHeader.substring(7);
		}else
			return null;
	}
	
	private boolean isRefreshTokenExpired(Map<String, Object> token) {
		return isDateExpired((Date)token.get("EXPIRY_DATE"));
	}
	
	private boolean isDateExpired(Date target) {
		return target.before(new Date(System.currentTimeMillis()));
	}
}
