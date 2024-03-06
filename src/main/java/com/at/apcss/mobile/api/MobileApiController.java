package com.at.apcss.mobile.api;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;
import com.at.apcss.am.wrhs.mapper.RawMtrWrhsMapper;
import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.menu.vo.ComApcJsonVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.service.LoginService;
import com.at.apcss.co.sys.vo.LoginVO;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;
import com.at.apcss.mobile.service.MobileApiService;
import com.at.apcss.mobile.vo.ElementFile;
import com.at.apcss.mobile.vo.FacilityMngVO;
import com.at.apcss.mobile.vo.WarehouseInfoVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.jwt.config.EgovJwtTokenUtil;
import io.jsonwebtoken.ExpiredJwtException;


/**
 * 모바일 API 호출을 위한 Controller
 * @author joon
 * @since 2023.11.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.22  joon       최초 생성
 * </pre>
 */

@Controller
@RequestMapping("/api/mobile")
public class MobileApiController extends BaseController{
	
	@Resource(name= "mobileApiService")
	private MobileApiService mobileApiService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Resource(name="spmtCmndService")
	protected SpmtCmndService spmtCmndService;
	
	@Autowired
	private RawMtrWrhsMapper rawMtrWrhsMapper;
	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;
	
	/** LoginService */
	@Resource(name = "loginService")
	private LoginService loginService;

	/** ApcInfoService */
	@Resource(name = "apcInfoService")
	private ApcInfoService apcInfoService;
	
	@Resource(name = "comUserService")
	private ComUserService comUserService;

	@Autowired
	private ComLogService comLogService;

	/** JWT */
	@Autowired
    private EgovJwtTokenUtil jwtTokenUtil;
	
	@PostMapping(value = "/authenticate.do")
	@ResponseBody
	public JSONObject authenticate(
			@RequestBody LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
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

		if (resultVO != null && StringUtils.hasText(resultVO.getId())) {

			// 010. 계정잠김여부
			if (ComConstants.CON_YES.equals(resultVO.getLckYn())) {		// 잠금상태
				//실패 이력저장
				comLogVo.setPrslType("L3");
				comLogService.insertMenuHstry(comLogVo);
				
				JSONObject resultJson = new JSONObject();
				resultJson.put("success", false);
				resultJson.put("code", ComConstants.ERR_USER_LOCKED);
				resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
				return resultJson;
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

				JSONObject resultJson = new JSONObject();
				resultJson.put("success", false);
				resultJson.put("code", loginCode);
				resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
				return resultJson;
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
			
			JSONObject resultData = new JSONObject();

			List<ApcInfoVO> apcInfoList = apcInfoService.selectApcMngList(apcInfoVO);
			for ( ApcInfoVO apc : apcInfoList ) {

				ComApcJsonVO comApcJsonVO = new ComApcJsonVO();
				BeanUtils.copyProperties(apc, comApcJsonVO);

				if (StringUtils.hasText(resultVO.getApcCd())
						&& resultVO.getApcCd().equals(apc.getApcCd())) {
					resultData.put("apcVO", comApcJsonVO);
				}

				comApcList.add(objMapper.writeValueAsString(comApcJsonVO));
				logger.debug(objMapper.writeValueAsString(comApcJsonVO));

			}

			if (comApcList != null && !comApcList.isEmpty()) {
				resultData.put("comApcList", comApcList);
			} else {
				resultData.put("comApcList", null);
			}

			// 로그인 정보를 세션에 저장
			//resultMap.put("loginVO", resultVO);
			
			//토큰을 생성한다.
			egovframework.com.cmm.LoginVO cmmLoginVO = new egovframework.com.cmm.LoginVO();
			cmmLoginVO.setId(resultVO.getUserId());
			final String accessToken = jwtTokenUtil.generateToken(cmmLoginVO);
			resultData.put("accessToken", accessToken);
			
			String refreshToken = UUID.randomUUID().toString();
			Date expDate = new Date(System.currentTimeMillis() + 24 * 60 * 60 * 90);	//90일
			
			resultData.put("refreshToken", refreshToken);
			
			Map<String, Object> storedRefreshToken =  mobileApiService.findRefreshToken(resultVO.getUserId());
			if(storedRefreshToken != null)
				mobileApiService.delRefreshToken(resultVO.getUserId());
			
			//리프레시 토큰 저장
			Map<String, Object> refreshTokenMap = new HashMap<String, Object>();
			refreshTokenMap.put("USER_ID", resultVO.getUserId());
			refreshTokenMap.put("TOKEN", refreshToken);
			refreshTokenMap.put("EXPIRY_DATE", expDate);
			
			mobileApiService.addRefreshToken(refreshTokenMap);
			
			// 로그인 인증세션
			resultData.put("userId", resultVO.getId());
			resultData.put("userName", resultVO.getName());
			resultData.put("apcCd", resultVO.getApcCd());
			resultData.put("apcNm", resultVO.getApcNm());

			//로그인 이력
			comLogVo.setUserType(userType);
			comLogVo.setPrslType("L1");
			comLogService.insertMenuHstry(comLogVo);

			JSONObject resultJson = new JSONObject();
			resultJson.put("success", true);
			resultJson.put("message", "성공");
			resultJson.put("data", resultData);
			
			return resultJson;
		} else {

			if (resultVO != null) {
				if (ComConstants.ERR_LOGIN_FAILED.equals(resultVO.getLgnRslt())) {
					// fail count 증가

				}
			}

			//실패 이력저장
			comLogVo.setPrslType("L3");
			comLogService.insertMenuHstry(comLogVo);
			
			JSONObject resultJson = new JSONObject();
			resultJson.put("success", false);
			resultJson.put("code", ComConstants.ERR_LOGIN_FAILED);
			resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
			
			return resultJson;
		}
	}
	
	@PostMapping(value = "/refreshToken.do")
	@ResponseBody
	public JSONObject refreshToken(
			@RequestBody LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model) throws Exception {
		
		ComUserVO userDetails = comUserService.selectComUser(loginVO.getUserId());
		
		if(userDetails != null) {
			Map<String, Object> storedRefreshToken =  mobileApiService.findRefreshToken(userDetails.getUserId());
			if(storedRefreshToken != null) {
				if(!storedRefreshToken.get("TOKEN").toString().equals(loginVO.getRefreshToken())) {
					JSONObject resultJson = new JSONObject();
					resultJson.put("success", false);
					resultJson.put("code", ComConstants.ERR_LOGIN_FAILED);
					resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
					
					return resultJson;
				} else if(isRefreshTokenExpired(storedRefreshToken)) {
					mobileApiService.delRefreshToken(userDetails.getUserId());
					
					JSONObject resultJson = new JSONObject();
					resultJson.put("success", false);
					resultJson.put("code", ComConstants.ERR_LOGIN_FAILED);
					resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
					
					return resultJson;
				} else {
					//새로운 accessToken을 생성한다.
					egovframework.com.cmm.LoginVO cmmLoginVO = new egovframework.com.cmm.LoginVO();
					cmmLoginVO.setId(userDetails.getUserId());
					final String accessToken = jwtTokenUtil.generateToken(cmmLoginVO);
					
					JSONObject resultData = new JSONObject();
					resultData.put("accessToken", accessToken);
					
					JSONObject resultJson = new JSONObject();
					resultJson.put("success", true);
					resultJson.put("message", "성공");
					resultJson.put("data", resultData);
					
					return resultJson;
				}
			} else {
				JSONObject resultJson = new JSONObject();
				resultJson.put("success", false);
				resultJson.put("code", ComConstants.ERR_LOGIN_FAILED);
				resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
				
				return resultJson;
			}
		} else {
			JSONObject resultJson = new JSONObject();
			resultJson.put("success", false);
			resultJson.put("code", ComConstants.ERR_LOGIN_FAILED);
			resultJson.put("message", messageSource.getMessage("fail.common.login", request.getLocale()));
			
			return resultJson;
		}
	}
	
	private boolean isRefreshTokenExpired(Map<String, Object> token) {
		return isDateExpired((Date)token.get("EXPIRY_DATE"));
	}
	
	private boolean isDateExpired(Date target) {
		return target.before(new Date(System.currentTimeMillis()));
	}

}
