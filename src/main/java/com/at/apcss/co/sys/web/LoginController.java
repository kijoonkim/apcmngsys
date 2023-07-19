package com.at.apcss.co.sys.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.sys.vo.LoginVO;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import io.swagger.v3.oas.annotations.parameters.RequestBody;

/**
 * 로그인을 처리하는 컨트롤러 클래스
 * @author SI개발부 신정철
 * @since 2023.06.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.15  신정철     	최초 생성
 *
 *  </pre>
 */
@Controller
public class LoginController extends BaseController {
	
	/** LoginService */
	@Resource(name = "loginService")
	private LoginService loginService;
	
	/*
	@RequestMapping("/login.do")
	public String doLogin(Model model, HttpSession httpSession) {
		
		return "main/login";
	}
	 */
	
	@RequestMapping("/login.do")
	public String doLoginView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession httpSession,
			ModelMap model) throws Exception {
		
		String menuId = "login";
		request.getSession().setAttribute("sysPrgrmId", menuId);
		model.addAttribute("comUiJson", String.format("{menuId:'%s'}", menuId));
		
		ComMenuVO pageVO = new ComMenuVO();
		pageVO.setMenuId(menuId);
		pageVO.setMenuNm("로그인");
		model.addAttribute("comMenuVO", pageVO);
		
		// 권한체크시 에러 페이지 이동
		String authError = request.getParameter("authError") == null ? "" : (String)request.getParameter("authError");
		if (authError != null && authError.equals("1")) {
			// return access denied
			// return .authError..
		}
		
		return "main/login";
	}
	
	@RequestMapping(value = "/actionLogin.do")
	public String actionLogin(
			@RequestBody LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession httpSession,
			ModelMap model) throws Exception {
		
		LoginVO resultVO = loginService.actionLogin(loginVO);
		
		if (resultVO != null && resultVO.getId() != null && StringUtils.hasText(resultVO.getId())) {
			// 로그인 정보를 세션에 저장
			//httpSession.setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("loginVO", resultVO);
			
			// 로그인 인증세션
			//httpSession.setAttribute("accessUser", resultVO.getId());
			request.getSession().setAttribute("accessUser", resultVO.getId());
			
			return "redirect:/actionMain.do";
		} else {
			model.addAttribute("loginMessage", message.getMessage("fail.common.login", request.getLocale()));
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value = "/actionSSOLogin.do")
	public String actionSSOLogin(HttpServletRequest request) throws Exception {
		
		String id = request.getParameter("id");
		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		
		LoginVO resultVO = loginService.actionSSOLogin(loginVO);
		
		if (resultVO != null && resultVO.getId() != null && StringUtils.hasText(resultVO.getId())) {
			// 로그인 정보를 세션에 저장
			//httpSession.setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("loginVO", resultVO);
			
			// 로그인 인증세션
			//httpSession.setAttribute("accessUser", resultVO.getId());
			request.getSession().setAttribute("accessUser", resultVO.getId());
			
			return "redirect:/actionMain.do";
		} else {
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login", request.getLocale()));
			return "redirect:/login.do";
		}
	}
	
	
	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param request
	 * @param model
	 * @return redirect url
	 * @throws Exception
	 */
	@RequestMapping(value = "/actionMain.do")
	public String actionMain(HttpServletRequest request, ModelMap model) throws Exception {
		
		logger.debug("actionMain sub");
		
		// 1. Spring Security 사용자 권한처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			logger.debug("1");
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login"));
			return "redirect:/login.do";
		}
		logger.debug("2");
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		logger.debug(EgovStringUtil.isNullToString(user.getId()));
		
		// 2. 메뉴조회
		
		// 메인 이동
		//String mainPage = Globals.MAIN_PAGE;
		String mainPage = "/main.do";
		
		if (mainPage.startsWith("/")) {
			return "forward:" + mainPage;
		} else {
			return mainPage;
		}
	}
	
	@RequestMapping(value = "/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {
		
		// 1. Security 연도
		
		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("accessUser", null);
		request.getSession().setAttribute("sysPrgrmId", null);
		
		return "redirect:/main.do";
	}
	
}
