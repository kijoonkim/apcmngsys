package com.at.apcss.co.sys.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.menu.vo.ComApcJsonVO;
import com.at.apcss.co.menu.vo.ComMenuVO;
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
public class LoginController extends BaseController {

	/** LoginService */
	@Resource(name = "loginService")
	private LoginService loginService;

	/** ApcInfoService */
	@Resource(name = "apcInfoService")
	private ApcInfoService apcInfoService;

	@Autowired
	ComLogService comLogService;


	@GetMapping("/login.do")
	public String doLoginView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession httpSession,
			ModelMap model) throws Exception {

		String menuId = "login";
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);
		model.addAttribute("comUiJson", String.format("{menuId:'%s'}", menuId));

		ComMenuVO pageVO = new ComMenuVO();
		pageVO.setMenuId(menuId);
		pageVO.setMenuNm("로그인");
		model.addAttribute("comMenuVO", pageVO);
		//model.addAttribute("comApcList", null);

		// 권한체크시 에러 페이지 이동
		String authError = request.getParameter("authError") == null ? "" : (String)request.getParameter("authError");
		if (authError != null && authError.equals("1")) {
			// return access denied
			// return .authError..
		}

		model.addAttribute("loginCode", null);
		model.addAttribute("loginMessage", null);

		return "main/login";
	}

	@PostMapping(value = "/actionLogin.do")
	public String actionLogin(
			@RequestBody LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession httpSession,
			ModelMap model) throws Exception {

		LoginVO resultVO = loginService.actionLogin(loginVO);

		//로그인 이력 저장
				ComLogVO comLogVo = new ComLogVO();
				String userId = loginVO.getId();
				String menuId ="login";
				comLogVo.setUserId(userId);
				comLogVo.setUserIp(getUserIp(request));
				comLogVo.setMenuId(menuId);

				if (getUserId() != null) {
					comLogVo.setLgnScsYn("Y");
				}

				comLogVo.setSysFrstInptUserId(userId);
				comLogVo.setSysLastChgUserId(userId);
				comLogVo.setSysFrstInptPrgrmId(menuId);
				comLogVo.setSysLastChgPrgrmId(menuId);
//				comLogVo.setPrslType("L1");

//				comLogService.insertMenuHstry(comLogVo);

		//반환은 받았는데 ID가 없다 >
		if (resultVO != null && StringUtils.hasText(resultVO.getId())) {
			// 010. 계정잠김여부
			if (ComConstants.CON_YES.equals(resultVO.getLckYn())) {		// 잠금상태
				model.addAttribute("loginCode", ComConstants.ERR_USER_LOCKED);
				model.addAttribute("loginMessage",messageSource.getMessage("fail.common.login.lck", request.getLocale()));
				//실패 이력저장
				comLogVo.setPrslType("L3");
				comLogService.insertMenuHstry(comLogVo);
				return "main/login";
			}

			if (!ComConstants.CON_USER_STTS_VALID.equals(resultVO.getUserStts())) {

				String loginCode = ComConstants.CON_BLANK;

				if (ComConstants.CON_USER_STTS_STANDBY.equals(resultVO.getUserStts())) {	// 승인대기
					loginCode = ComConstants.ERR_USER_UNRECEIVED;

				} else if (ComConstants.CON_USER_STTS_DORMANCY.equals(resultVO.getUserStts())) {	// 휴면
					loginCode = ComConstants.ERR_USER_DORMANCY;
				} else if (ComConstants.CON_USER_STTS_UNUSED.equals(resultVO.getUserStts())) {	// 휴면
					loginCode = ComConstants.ERR_USER_UNUSED;
				} else {
					loginCode = ComConstants.ERR_USER_INVALID;
				}
				//실패 이력저장
				comLogVo.setPrslType("L3");
				comLogService.insertMenuHstry(comLogVo);

				model.addAttribute("loginCode", loginCode);
				model.addAttribute("loginMessage", null);
				return "main/login";
			}


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

				if (StringUtils.hasText(resultVO.getApcCd())
						&& resultVO.getApcCd().equals(apc.getApcCd())) {
					request.getSession().setAttribute("apcVO", comApcJsonVO);
				}

				comApcList.add(objMapper.writeValueAsString(comApcJsonVO));
				logger.debug(objMapper.writeValueAsString(comApcJsonVO));

			}

			if (comApcList != null && !comApcList.isEmpty()) {
				request.getSession().setAttribute("comApcList", comApcList);
			} else {
				request.getSession().setAttribute("comApcList", null);
			}

			// 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);

			// 세션정보 db insert

			// 로그인 인증세션
			request.getSession().setAttribute("accessUser", resultVO.getId());

			model.addAttribute("loginCode", null);
			model.addAttribute("loginMessage", null);
			//로그인 이력
			comLogVo.setApcCd(resultVO.getApcCd());
			comLogVo.setUserNm(resultVO.getName());
			comLogVo.setUserType(userType);
			comLogVo.setPrslType("L1");
			comLogService.insertMenuHstry(comLogVo);
			loginService.updateResetFailCount(resultVO);

			return "redirect:/actionMain.do";
		} else {

			if (resultVO != null) {
				if (ComConstants.ERR_LOGIN_FAILED.equals(resultVO.getLgnRslt())) {
					LoginVO loginVo = loginService.selectUser(loginVO.getId());
					if(loginVo.getLckYn().equals("N")){
						loginService.updateFailCount(loginVO);
						if(loginVo.getLgnFailNmtm() == 4){
							loginService.updateUserLck(loginVo);
						}
					}

					model.addAttribute("loginCode", ComConstants.ERR_LOGIN_FAILED);
					model.addAttribute("loginMessage", messageSource.getMessage("fail.common.login", request.getLocale()));
				}else if(ComConstants.ERR_USER_NONE.equals(resultVO.getLgnRslt())){
					//계정이없을때 분기점
					model.addAttribute("loginCode",ComConstants.ERR_USER_NONE);
					model.addAttribute("loginMessage", messageSource.getMessage("fail.common.login.notFound",request.getLocale()));

				}
			}


			//실패 이력저장
			comLogVo.setPrslType("L3");
			comLogService.insertMenuHstry(comLogVo);
			//return "redirect:/login.do";
			return "main/login";
		}
	}

	@GetMapping(value = "/actionSSOLogin.do")
	public String actionSSOLogin(HttpServletRequest request) throws Exception {

		String id = request.getParameter("id");
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
				logger.error("@@@@ SSO 사용자 정보 : {}", userData);
				
				request.getSession().setAttribute(ComConstants.SYS_SSO_TOKEN, pniToken);
			}	
		} else {
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
	@GetMapping(value = "/actionMain.do")
	public String actionMain(HttpServletRequest request, ModelMap model) throws Exception {

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
		String mainPage = "/main.do";

		if (mainPage.startsWith("/")) {
			return "forward:" + mainPage;
		} else {
			return mainPage;
		}
	}

	@GetMapping(value = "/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		//로그인 이력 저장
		ComLogVO comLogVo = new ComLogVO();
		String userId = getUserId();
		String menuId ="logout";
		comLogVo.setUserId(userId);
		comLogVo.setUserIp(getUserIp(request));
		comLogVo.setMenuId(menuId);

		if (getUserId() != null) {
			comLogVo.setLgnScsYn("Y");
		}

		comLogVo.setSysFrstInptUserId(userId);
		comLogVo.setSysLastChgUserId(userId);
		comLogVo.setSysFrstInptPrgrmId(menuId);
		comLogVo.setSysLastChgPrgrmId(menuId);

		comLogVo.setPrslType("L2");
		try{
			LoginVO loginVo =(LoginVO) request.getSession().getAttribute("loginVO");
			comLogVo.setUserNm(loginVo.getName());
			comLogVo.setUserType(loginVo.getUserType());
			comLogVo.setApcCd(loginVo.getApcCd());
		}catch (Exception e){
			return "redirect:/main.do";
		}


		comLogService.insertMenuHstry(comLogVo);

		// 1. Security 연도
		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("accessUser", null);
		request.getSession().setAttribute("sysPrgrmId", null);
		request.getSession().setAttribute("comApcList", null);

		return "redirect:/main.do";
	}
}