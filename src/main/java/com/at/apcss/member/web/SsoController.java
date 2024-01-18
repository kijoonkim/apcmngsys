package com.at.apcss.member.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.vo.ComApcJsonVO;
import com.at.apcss.co.menu.vo.ComMenuJsonVO;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.sys.vo.LoginVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ubintis.api.ApiUserService;
import com.ubintis.common.util.AddressUtil;
import com.ubintis.common.util.StrUtil;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
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
public class SsoController extends BaseController {

	/** LoginService */
	@Resource(name = "loginService")
	private LoginService loginService;

	/** ApcInfoService */
	@Resource(name = "apcInfoService")
	private ApcInfoService apcInfoService;

	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService;


	@GetMapping(value = "/actionSSOLoginApc.do")
	public String actionSSOLoginApc(HttpServletRequest request) throws Exception {

		// String id = request.getParameter("id");
		String id = ComConstants.CON_BLANK;
		String pniToken = StrUtil.NVL(request.getParameter(ComConstants.SYS_SSO_TOKEN));

		if (ComConstants.CON_BLANK.equals(pniToken)) {
			pniToken = StrUtil.NVL(request.getSession().getAttribute(ComConstants.SYS_SSO_TOKEN));
		}

		if (StringUtils.hasText(pniToken)) {
			String localIp = AddressUtil.getClientIp(request);
			ApiUserService apiUserService = new ApiUserService();
			String errorCode = apiUserService.executeUserData(pniToken, localIp);

			if (StringUtils.hasText(errorCode)) {
				logger.error("@@@@ SSO 에이전트 오류 : {}", errorCode);
				return "redirect:/login.do";
			} else {
				String userData = apiUserService.getUserData();

				if (StringUtils.hasText(userData)) {

					logger.error("@@@@ SSO 사용자 정보 : {}", userData);
					try {
				        JSONParser jsonParser = new JSONParser();
				        Object objUser = jsonParser.parse(userData);
						JSONObject jsonObj = (JSONObject) objUser;

						id = (String)jsonObj.get("user_id");
						request.getSession().setAttribute(ComConstants.SYS_SSO_TOKEN, pniToken);

					} catch (Exception e) {
						insertSysErrorLog(String.format("sso error: %s / %s", userData, e.getMessage()));
						return "redirect:/login.do";
					}
				}
			}
		} else {
			logger.error("@@@@ SSO 토큰정보 없음");
			insertSysErrorLog("SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		if (!StringUtils.hasText(id)) {
			logger.error("@@@@ SSO 토큰정보 없음");
			insertSysErrorLog("SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);

		LoginVO resultVO = loginService.actionSSOLogin(loginVO);

		if (resultVO != null && resultVO.getId() != null && StringUtils.hasText(resultVO.getId())) {

			ApcInfoVO apcInfoVO = new ApcInfoVO();

			List<String> comApcList = new ArrayList<>();
			ObjectMapper objMapper = new ObjectMapper();

			// 로그인 사용자가 시스템관리자, AT관리자 일 경우 APC리스트를 세션에 저장
			String userType = resultVO.getUserType();
			if (ComConstants.CON_USER_TYPE_SYS.equals(userType)
					|| ComConstants.CON_USER_TYPE_AT.equals(userType)) {
				resultVO.setApcAdminType(userType);
			} else {
				apcInfoVO.setApcCd(resultVO.getApcCd());
			}

			List<ApcInfoVO> apcInfoList = apcInfoService.selectApcMngList(apcInfoVO);
			for ( ApcInfoVO apc : apcInfoList ) {
				ComApcJsonVO comApcJsonVO = new ComApcJsonVO();
				BeanUtils.copyProperties(apc, comApcJsonVO);
				comApcList.add(objMapper.writeValueAsString(comApcJsonVO));

				if (StringUtils.hasText(resultVO.getApcCd())
						&& resultVO.getApcCd().equals(apc.getApcCd())) {
					request.getSession().setAttribute("apcVO", comApcJsonVO);
				}
			}

			if (comApcList != null && !comApcList.isEmpty()) {
				request.getSession().setAttribute("comApcList", objMapper.writeValueAsString(comApcList));
			} else {
				request.getSession().setAttribute("comApcList", null);
			}

			// 로그인 정보를 세션에 저장
			//httpSession.setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("loginVO", resultVO);

			// 로그인 인증세션
			//httpSession.setAttribute("accessUser", resultVO.getId());
			request.getSession().setAttribute("accessUser", resultVO.getId());

			setSessionInfo(request);

			return "redirect:/actionMainApc.do";
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
	@GetMapping(value = "/actionMainApc.do")
	public String actionMainApc(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Spring Security 사용자 권한처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			logger.debug("1");
			insertSysErrorLog("actionMainApc 로그인정보 없음");
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login"));
			return "redirect:/login.do";
		}

		//LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		// 2. 메뉴조회

		// 메인 이동
		//String mainPage = Globals.MAIN_PAGE;
		String mainPage = "/mainApc.do";

		if (mainPage.startsWith("/")) {
			return "forward:" + mainPage;
		} else {
			return mainPage;
		}
	}

	@GetMapping(value = "/actionLogoutApc.do")
	public String actionLogoutApc(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Security 연도

		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("accessUser", null);
		request.getSession().setAttribute("sysPrgrmId", null);
		request.getSession().setAttribute("comApcList", null);

		return "redirect:/mainApc.do";
	}



	@GetMapping("/mainApc.do")
	public String mainApc(Model model, HttpServletRequest request) {

		List<String> menuList = new ArrayList<>();
		try {

			LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

			String menuId = "main";
			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			comUiJsonVO.setMenuId(menuId);
			ObjectMapper objMapper = new ObjectMapper();
			String comUiJsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", comUiJsonString);

			ComMenuVO pageVO = new ComMenuVO();
			pageVO.setMenuId(menuId);
			pageVO.setMenuNm("메인페이지");
			model.addAttribute("comMenuVO", pageVO);

			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);

			ComAuthrtMenuVO paramVO = new ComAuthrtMenuVO();
			paramVO.setUserId(loginVO.getUserId());


			List<ComAuthrtMenuVO> resultList = comAuthrtService.selectTopMenuTreeList(paramVO);
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComAuthrtMenuVO rslt : resultList ) {

					if (ComConstants.CON_YES.equals(rslt.getUseYn())) {
						ComMenuJsonVO menu = new ComMenuJsonVO();
						menu.setId(rslt.getMenuId());
						menu.setPid(rslt.getUpMenuId());
						menu.setOrder(rslt.getIndctSeq());
						menu.setText(rslt.getMenuNm());
						//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						ObjectMapper mapper = new ObjectMapper();
						String jsonString = mapper.writeValueAsString(menu);

						menuList.add(jsonString);
					}
				}
			}
			/*
			List<ComMenuVO> resultList = comMenuService.selectTopMenuList(new ComMenuVO());
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComMenuVO rslt : resultList ) {

					ComMenuJsonVO menu = new ComMenuJsonVO();
					menu.setId(rslt.getMenuId());
					menu.setPid(rslt.getUpMenuId());
					menu.setOrder(rslt.getIndctSeq());
					menu.setText(rslt.getMenuNm());
					//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					ObjectMapper mapper = new ObjectMapper();
					String jsonString = mapper.writeValueAsString(menu);
					System.out.println(jsonString);
					menuList.add(jsonString);
				}
			}
			 */


		} catch (Exception e) {
			return "redirect:/login.do";
		}

		model.addAttribute("topMenuList", menuList);

		model.addAttribute("pMenuIdParam", "FM");
		model.addAttribute("pMenuNmParam", "생산농가관리");

		model.addAttribute("reportDbName", getReportDbName());
		model.addAttribute("reportUrl", getReportUrl());
		model.addAttribute("reportType", getReportType());
		model.addAttribute("reportPath", getReportPath());

		//model.addAttribute("comApcList", request.getSession().getAttribute("comApcList"));

		return "member/mainApc";
	}



	@GetMapping(value = "/actionSSOLoginApcIns.do")
	public String actionSSOLoginApcIns(HttpServletRequest request) throws Exception {

		// String id = request.getParameter("id");
		String id = ComConstants.CON_BLANK;
		String pniToken = StrUtil.NVL(request.getParameter(ComConstants.SYS_SSO_TOKEN));

		if (ComConstants.CON_BLANK.equals(pniToken)) {
			pniToken = StrUtil.NVL(request.getSession().getAttribute(ComConstants.SYS_SSO_TOKEN));
		}

		if (StringUtils.hasText(pniToken)) {
			String localIp = AddressUtil.getClientIp(request);
			ApiUserService apiUserService = new ApiUserService();
			String errorCode = apiUserService.executeUserData(pniToken, localIp);

			if (StringUtils.hasText(errorCode)) {
				logger.error("@@@@ SSO 에이전트 오류 : {}", errorCode);
				insertSysErrorLog("actionSSOLoginApcIns SSO 에이전트 오류");
				return "redirect:/login.do";
			} else {
				String userData = apiUserService.getUserData();

				if (StringUtils.hasText(userData)) {

					logger.error("@@@@ SSO 사용자 정보 : {}", userData);
					try {
				        JSONParser jsonParser = new JSONParser();
				        Object objUser = jsonParser.parse(userData);
						JSONObject jsonObj = (JSONObject) objUser;

						id = (String)jsonObj.get("user_id");
						request.getSession().setAttribute(ComConstants.SYS_SSO_TOKEN, pniToken);

					} catch (Exception e) {
						insertSysErrorLog(String.format("sso error: %s / %s", userData, e.getMessage()));
						return "redirect:/login.do";
					}
				}
			}
		} else {
			logger.error("@@@@ SSO 토큰정보 없음");
			insertSysErrorLog("actionSSOLoginApcIns SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		if (!StringUtils.hasText(id)) {
			logger.error("@@@@ SSO 토큰정보 없음");
			insertSysErrorLog("actionSSOLoginApcIns 로그인id 없음");
			return "redirect:/login.do";
		}



		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);

		LoginVO resultVO = loginService.actionSSOLogin(loginVO);

		if (resultVO != null && resultVO.getId() != null && StringUtils.hasText(resultVO.getId())) {

			ApcInfoVO apcInfoVO = new ApcInfoVO();

			List<String> comApcList = new ArrayList<>();
			ObjectMapper objMapper = new ObjectMapper();

			// 로그인 사용자가 시스템관리자, AT관리자 일 경우 APC리스트를 세션에 저장
			String userType = resultVO.getUserType();
			if (ComConstants.CON_USER_TYPE_SYS.equals(userType)
					|| ComConstants.CON_USER_TYPE_AT.equals(userType)) {
				resultVO.setApcAdminType(userType);
			} else {
				apcInfoVO.setApcCd(resultVO.getApcCd());
			}

			List<ApcInfoVO> apcInfoList = apcInfoService.selectApcMngList(apcInfoVO);
			for ( ApcInfoVO apc : apcInfoList ) {
				ComApcJsonVO comApcJsonVO = new ComApcJsonVO();
				BeanUtils.copyProperties(apc, comApcJsonVO);
				comApcList.add(objMapper.writeValueAsString(comApcJsonVO));

				if (StringUtils.hasText(resultVO.getApcCd())
						&& resultVO.getApcCd().equals(apc.getApcCd())) {
					request.getSession().setAttribute("apcVO", comApcJsonVO);
				}
			}

			if (comApcList != null && !comApcList.isEmpty()) {
				request.getSession().setAttribute("comApcList", objMapper.writeValueAsString(comApcList));
			} else {
				request.getSession().setAttribute("comApcList", null);
			}

			// 로그인 정보를 세션에 저장
			//httpSession.setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("loginVO", resultVO);

			// 로그인 인증세션
			//httpSession.setAttribute("accessUser", resultVO.getId());
			request.getSession().setAttribute("accessUser", resultVO.getId());

			setSessionInfo(request);

			return "redirect:/actionMainApcIns.do";
		} else {
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login", request.getLocale()));
			insertSysErrorLog("actionSSOLoginApcIns 로그인 실패");
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
	@GetMapping(value = "/actionMainApcIns.do")
	public String actionMainApcIns(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Spring Security 사용자 권한처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			logger.debug("1");
			insertSysErrorLog("actionMainApcIns 로그인 정보 없음");
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login"));
			return "redirect:/login.do";
		}

		//LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		// 2. 메뉴조회

		// 메인 이동
		//String mainPage = Globals.MAIN_PAGE;
		String mainPage = "/mainApcIns.do";

		if (mainPage.startsWith("/")) {
			return "forward:" + mainPage;
		} else {
			return mainPage;
		}
	}

	@GetMapping(value = "/actionLogoutApcIns.do")
	public String actionLogoutIns(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Security 연도

		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("accessUser", null);
		request.getSession().setAttribute("sysPrgrmId", null);
		request.getSession().setAttribute("comApcList", null);

		return "redirect:/mainApcIns.do";
	}



	@GetMapping("/mainApcIns.do")
	public String mainApcIns(Model model, HttpServletRequest request) {

		List<String> menuList = new ArrayList<>();
		try {

			LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

			String menuId = "main";
			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			comUiJsonVO.setMenuId(menuId);
			ObjectMapper objMapper = new ObjectMapper();
			String comUiJsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", comUiJsonString);

			ComMenuVO pageVO = new ComMenuVO();
			pageVO.setMenuId(menuId);
			pageVO.setMenuNm("메인페이지");
			model.addAttribute("comMenuVO", pageVO);

			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);

			ComAuthrtMenuVO paramVO = new ComAuthrtMenuVO();
			paramVO.setUserId(loginVO.getUserId());


			List<ComAuthrtMenuVO> resultList = comAuthrtService.selectTopMenuTreeList(paramVO);
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComAuthrtMenuVO rslt : resultList ) {

					if (ComConstants.CON_YES.equals(rslt.getUseYn())) {
						ComMenuJsonVO menu = new ComMenuJsonVO();
						menu.setId(rslt.getMenuId());
						menu.setPid(rslt.getUpMenuId());
						menu.setOrder(rslt.getIndctSeq());
						menu.setText(rslt.getMenuNm());
						//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						ObjectMapper mapper = new ObjectMapper();
						String jsonString = mapper.writeValueAsString(menu);
						System.out.println(jsonString);
						menuList.add(jsonString);
					}
				}
			}
			/*
			List<ComMenuVO> resultList = comMenuService.selectTopMenuList(new ComMenuVO());
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComMenuVO rslt : resultList ) {

					ComMenuJsonVO menu = new ComMenuJsonVO();
					menu.setId(rslt.getMenuId());
					menu.setPid(rslt.getUpMenuId());
					menu.setOrder(rslt.getIndctSeq());
					menu.setText(rslt.getMenuNm());
					//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					ObjectMapper mapper = new ObjectMapper();
					String jsonString = mapper.writeValueAsString(menu);
					System.out.println(jsonString);
					menuList.add(jsonString);
				}
			}
			 */


		} catch (Exception e) {
			return "redirect:/login.do";
		}

		model.addAttribute("topMenuList", menuList);

		model.addAttribute("pMenuIdParam", "PD");
		model.addAttribute("pMenuNmParam", "생산유통통합조직등록");

		model.addAttribute("reportDbName", getReportDbName());
		model.addAttribute("reportUrl", getReportUrl());
		model.addAttribute("reportType", getReportType());
		model.addAttribute("reportPath", getReportPath());

		//model.addAttribute("comApcList", request.getSession().getAttribute("comApcList"));

		return "member/mainApcIns";
	}


	@GetMapping(value = "/actionSSOLoginApcInsReq.do")
	public String actionSSOLoginApcInsReq(HttpServletRequest request) throws Exception {

		// String id = request.getParameter("id");
		String id = ComConstants.CON_BLANK;
		String pniToken = StrUtil.NVL(request.getParameter(ComConstants.SYS_SSO_TOKEN));

		if (ComConstants.CON_BLANK.equals(pniToken)) {
			pniToken = StrUtil.NVL(request.getSession().getAttribute(ComConstants.SYS_SSO_TOKEN));
		}

		if (StringUtils.hasText(pniToken)) {
			String localIp = AddressUtil.getClientIp(request);
			ApiUserService apiUserService = new ApiUserService();
			String errorCode = apiUserService.executeUserData(pniToken, localIp);

			if (StringUtils.hasText(errorCode)) {
				logger.error("@@@@ SSO 에이전트 오류 : {}", errorCode);
				return "redirect:/login.do";
			} else {
				String userData = apiUserService.getUserData();

				if (StringUtils.hasText(userData)) {

					logger.error("@@@@ SSO 사용자 정보 : {}", userData);
					try {
				        JSONParser jsonParser = new JSONParser();
				        Object objUser = jsonParser.parse(userData);
						JSONObject jsonObj = (JSONObject) objUser;

						id = (String)jsonObj.get("user_id");
						request.getSession().setAttribute(ComConstants.SYS_SSO_TOKEN, pniToken);

					} catch (Exception e) {
						insertSysErrorLog(String.format("sso error: %s / %s", userData, e.getMessage()));
						return "redirect:/login.do";
					}
				}
			}
		} else {
			logger.error("@@@@ SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		if (!StringUtils.hasText(id)) {
			logger.error("@@@@ SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);

		LoginVO resultVO = loginService.actionSSOLogin(loginVO);

		if (resultVO != null && resultVO.getId() != null && StringUtils.hasText(resultVO.getId())) {

			ApcInfoVO apcInfoVO = new ApcInfoVO();

			List<String> comApcList = new ArrayList<>();
			ObjectMapper objMapper = new ObjectMapper();

			// 로그인 사용자가 시스템관리자, AT관리자 일 경우 APC리스트를 세션에 저장
			String userType = resultVO.getUserType();
			if (ComConstants.CON_USER_TYPE_SYS.equals(userType)
					|| ComConstants.CON_USER_TYPE_AT.equals(userType)) {
				resultVO.setApcAdminType(userType);
			} else {
				apcInfoVO.setApcCd(resultVO.getApcCd());
			}

			List<ApcInfoVO> apcInfoList = apcInfoService.selectApcMngList(apcInfoVO);
			for ( ApcInfoVO apc : apcInfoList ) {
				ComApcJsonVO comApcJsonVO = new ComApcJsonVO();
				BeanUtils.copyProperties(apc, comApcJsonVO);
				comApcList.add(objMapper.writeValueAsString(comApcJsonVO));

				if (StringUtils.hasText(resultVO.getApcCd())
						&& resultVO.getApcCd().equals(apc.getApcCd())) {
					request.getSession().setAttribute("apcVO", comApcJsonVO);
				}
			}

			if (comApcList != null && !comApcList.isEmpty()) {
				request.getSession().setAttribute("comApcList", objMapper.writeValueAsString(comApcList));
			} else {
				request.getSession().setAttribute("comApcList", null);
			}

			// 로그인 정보를 세션에 저장
			//httpSession.setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("loginVO", resultVO);

			// 로그인 인증세션
			//httpSession.setAttribute("accessUser", resultVO.getId());
			request.getSession().setAttribute("accessUser", resultVO.getId());

			setSessionInfo(request);

			return "redirect:/actionMainApcInsReq.do";
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
	@GetMapping(value = "/actionMainApcInsReq.do")
	public String actionMainApcInsReq(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Spring Security 사용자 권한처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			logger.debug("1");
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login"));
			return "redirect:/login.do";
		}

		//LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		// 2. 메뉴조회

		// 메인 이동
		//String mainPage = Globals.MAIN_PAGE;
		String mainPage = "/mainApcInsReq.do";

		if (mainPage.startsWith("/")) {
			return "forward:" + mainPage;
		} else {
			return mainPage;
		}
	}

	@GetMapping(value = "/actionLogoutApcInsReq.do")
	public String actionLogoutInsReq(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Security 연도

		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("accessUser", null);
		request.getSession().setAttribute("sysPrgrmId", null);
		request.getSession().setAttribute("comApcList", null);

		return "redirect:/mainApcInsReq.do";
	}



	@GetMapping("/mainApcInsReq.do")
	public String mainApcInsReq(Model model, HttpServletRequest request) {

		List<String> menuList = new ArrayList<>();
		try {

			LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

			String menuId = "main";
			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			comUiJsonVO.setMenuId(menuId);
			ObjectMapper objMapper = new ObjectMapper();
			String comUiJsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", comUiJsonString);

			ComMenuVO pageVO = new ComMenuVO();
			pageVO.setMenuId(menuId);
			pageVO.setMenuNm("메인페이지");
			model.addAttribute("comMenuVO", pageVO);

			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);

			ComAuthrtMenuVO paramVO = new ComAuthrtMenuVO();
			paramVO.setUserId(loginVO.getUserId());


			List<ComAuthrtMenuVO> resultList = comAuthrtService.selectTopMenuTreeList(paramVO);
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComAuthrtMenuVO rslt : resultList ) {

					if (ComConstants.CON_YES.equals(rslt.getUseYn())) {
						ComMenuJsonVO menu = new ComMenuJsonVO();
						menu.setId(rslt.getMenuId());
						menu.setPid(rslt.getUpMenuId());
						menu.setOrder(rslt.getIndctSeq());
						menu.setText(rslt.getMenuNm());
						//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						ObjectMapper mapper = new ObjectMapper();
						String jsonString = mapper.writeValueAsString(menu);

						menuList.add(jsonString);
					}
				}
			}
			/*
			List<ComMenuVO> resultList = comMenuService.selectTopMenuList(new ComMenuVO());
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComMenuVO rslt : resultList ) {

					ComMenuJsonVO menu = new ComMenuJsonVO();
					menu.setId(rslt.getMenuId());
					menu.setPid(rslt.getUpMenuId());
					menu.setOrder(rslt.getIndctSeq());
					menu.setText(rslt.getMenuNm());
					//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					ObjectMapper mapper = new ObjectMapper();
					String jsonString = mapper.writeValueAsString(menu);
					System.out.println(jsonString);
					menuList.add(jsonString);
				}
			}
			 */


		} catch (Exception e) {
			return "redirect:/login.do";
		}

		model.addAttribute("topMenuList", menuList);

		model.addAttribute("pMenuIdParam", "CS");
		model.addAttribute("pMenuNmParam", "APC전수조사");


		model.addAttribute("reportDbName", getReportDbName());
		model.addAttribute("reportUrl", getReportUrl());
		model.addAttribute("reportType", getReportType());
		model.addAttribute("reportPath", getReportPath());

		//model.addAttribute("comApcList", request.getSession().getAttribute("comApcList"));

		return "member/mainApcInsReq";
	}



	@GetMapping(value = "/actionSSOLoginApcPt.do")
	public String actionSSOLoginApcPt(HttpServletRequest request) throws Exception {

		// String id = request.getParameter("id");
		String id = ComConstants.CON_BLANK;
		String pniToken = StrUtil.NVL(request.getParameter(ComConstants.SYS_SSO_TOKEN));

		if (ComConstants.CON_BLANK.equals(pniToken)) {
			pniToken = StrUtil.NVL(request.getSession().getAttribute(ComConstants.SYS_SSO_TOKEN));
		}

		if (StringUtils.hasText(pniToken)) {
			String localIp = AddressUtil.getClientIp(request);
			ApiUserService apiUserService = new ApiUserService();
			String errorCode = apiUserService.executeUserData(pniToken, localIp);

			if (StringUtils.hasText(errorCode)) {
				logger.error("@@@@ SSO 에이전트 오류 : {}", errorCode);
				return "redirect:/login.do";
			} else {
				String userData = apiUserService.getUserData();

				if (StringUtils.hasText(userData)) {

					logger.error("@@@@ SSO 사용자 정보 : {}", userData);
					try {
				        JSONParser jsonParser = new JSONParser();
				        Object objUser = jsonParser.parse(userData);
						JSONObject jsonObj = (JSONObject) objUser;

						id = (String)jsonObj.get("user_id");
						request.getSession().setAttribute(ComConstants.SYS_SSO_TOKEN, pniToken);

					} catch (Exception e) {
						insertSysErrorLog(String.format("sso error: %s / %s", userData, e.getMessage()));
						return "redirect:/login.do";
					}
				}
			}
		} else {
			logger.error("@@@@ SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		if (!StringUtils.hasText(id)) {
			logger.error("@@@@ SSO 토큰정보 없음");
			return "redirect:/login.do";
		}

		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);

		LoginVO resultVO = loginService.actionSSOLogin(loginVO);

		if (resultVO != null && resultVO.getId() != null && StringUtils.hasText(resultVO.getId())) {

			ApcInfoVO apcInfoVO = new ApcInfoVO();

			List<String> comApcList = new ArrayList<>();
			ObjectMapper objMapper = new ObjectMapper();

			// 로그인 사용자가 시스템관리자, AT관리자 일 경우 APC리스트를 세션에 저장
			String userType = resultVO.getUserType();
			if (ComConstants.CON_USER_TYPE_SYS.equals(userType)
					|| ComConstants.CON_USER_TYPE_AT.equals(userType)) {
				resultVO.setApcAdminType(userType);
			} else {
				apcInfoVO.setApcCd(resultVO.getApcCd());
			}

			List<ApcInfoVO> apcInfoList = apcInfoService.selectApcMngList(apcInfoVO);
			for ( ApcInfoVO apc : apcInfoList ) {
				ComApcJsonVO comApcJsonVO = new ComApcJsonVO();
				BeanUtils.copyProperties(apc, comApcJsonVO);
				comApcList.add(objMapper.writeValueAsString(comApcJsonVO));

				if (StringUtils.hasText(resultVO.getApcCd())
						&& resultVO.getApcCd().equals(apc.getApcCd())) {
					request.getSession().setAttribute("apcVO", comApcJsonVO);
				}
			}

			if (comApcList != null && !comApcList.isEmpty()) {
				request.getSession().setAttribute("comApcList", objMapper.writeValueAsString(comApcList));
			} else {
				request.getSession().setAttribute("comApcList", null);
			}

			// 로그인 정보를 세션에 저장
			//httpSession.setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("loginVO", resultVO);

			// 로그인 인증세션
			//httpSession.setAttribute("accessUser", resultVO.getId());
			request.getSession().setAttribute("accessUser", resultVO.getId());

			setSessionInfo(request);

			return "redirect:/actionMainApcPt.do";
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
	@GetMapping(value = "/actionMainApcPt.do")
	public String actionMainApcPt(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Spring Security 사용자 권한처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			logger.debug("1");
			//model.addAttribute("loginMessage", message.getMessage("fail.common.login"));
			return "redirect:/login.do";
		}

		//LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		// 2. 메뉴조회

		// 메인 이동
		//String mainPage = Globals.MAIN_PAGE;
		String mainPage = "/mainApcPt.do";

		if (mainPage.startsWith("/")) {
			return "forward:" + mainPage;
		} else {
			return mainPage;
		}
	}

	@GetMapping(value = "/actionLogoutApcPt.do")
	public String actionLogoutPt(HttpServletRequest request, ModelMap model) throws Exception {

		// 1. Security 연도

		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("accessUser", null);
		request.getSession().setAttribute("sysPrgrmId", null);
		request.getSession().setAttribute("comApcList", null);

		return "redirect:/mainApcPt.do";
	}



	@GetMapping("/mainApcPt.do")
	public String mainApcPt(Model model, HttpServletRequest request) {

		List<String> menuList = new ArrayList<>();
		try {

			LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

			String menuId = "main";
			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			comUiJsonVO.setMenuId(menuId);
			ObjectMapper objMapper = new ObjectMapper();
			String comUiJsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", comUiJsonString);

			ComMenuVO pageVO = new ComMenuVO();
			pageVO.setMenuId(menuId);
			pageVO.setMenuNm("메인페이지");
			model.addAttribute("comMenuVO", pageVO);

			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);

			ComAuthrtMenuVO paramVO = new ComAuthrtMenuVO();
			paramVO.setUserId(loginVO.getUserId());


			List<ComAuthrtMenuVO> resultList = comAuthrtService.selectTopMenuTreeList(paramVO);
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComAuthrtMenuVO rslt : resultList ) {

					if (ComConstants.CON_YES.equals(rslt.getUseYn())) {
						ComMenuJsonVO menu = new ComMenuJsonVO();
						menu.setId(rslt.getMenuId());
						menu.setPid(rslt.getUpMenuId());
						menu.setOrder(rslt.getIndctSeq());
						menu.setText(rslt.getMenuNm());
						//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
						menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
						ObjectMapper mapper = new ObjectMapper();
						String jsonString = mapper.writeValueAsString(menu);
						System.out.println(jsonString);
						menuList.add(jsonString);
					}
				}
			}
			/*
			List<ComMenuVO> resultList = comMenuService.selectTopMenuList(new ComMenuVO());
			if (resultList != null && !resultList.isEmpty()) {
				for ( ComMenuVO rslt : resultList ) {

					ComMenuJsonVO menu = new ComMenuJsonVO();
					menu.setId(rslt.getMenuId());
					menu.setPid(rslt.getUpMenuId());
					menu.setOrder(rslt.getIndctSeq());
					menu.setText(rslt.getMenuNm());
					//menu.setLink(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setTopMenuNm(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					menu.setUrl(rslt.getPageUrl() == null ? ComConstants.CON_BLANK : rslt.getPageUrl());
					menu.setValue(rslt.getUpMenuNm() == null ? ComConstants.CON_BLANK : rslt.getUpMenuNm());
					ObjectMapper mapper = new ObjectMapper();
					String jsonString = mapper.writeValueAsString(menu);
					System.out.println(jsonString);
					menuList.add(jsonString);
				}
			}
			 */


		} catch (Exception e) {
			return "redirect:/login.do";
		}

		model.addAttribute("topMenuList", menuList);

		model.addAttribute("pMenuIdParam", "PT");
		model.addAttribute("pMenuNmParam", "서비스포털");


		model.addAttribute("reportDbName", getReportDbName());
		model.addAttribute("reportUrl", getReportUrl());
		model.addAttribute("reportType", getReportType());
		model.addAttribute("reportPath", getReportPath());

		//model.addAttribute("comApcList", request.getSession().getAttribute("comApcList"));

		return "member/mainApcPt";
	}



}
