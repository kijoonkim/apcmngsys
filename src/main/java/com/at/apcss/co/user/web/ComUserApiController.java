package com.at.apcss.co.user.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.service.ApcLinkService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.mobile.service.MobileApiService;
import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.jwt.config.EgovJwtTokenUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

/**
 * 일반 로그인을 처리하는 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2009.03.06  박지욱     최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@RestController
public class ComUserApiController extends BaseController {

	@Resource(name = "comUserService")
	private ComUserService comUserService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	@Resource(name= "mobileApiService")
	private MobileApiService mobileApiService;

	// APC 환경설정
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	@Resource(name = "apcLinkService")
	private ApcLinkService apcLinkService;

	/** JWT */
	@Autowired
    private EgovJwtTokenUtil jwtTokenUtil;
	@PostMapping(value = "/co/user/selectComUser.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUser(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		logger.debug("comUser info {} {}", comUserVO.getUserId(), comUserVO.getUserNm());

		ComUserVO resultVO;

		try {
			resultVO = comUserService.selectComUser(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);

	}

	@GetMapping(value = "/co/user/users/{id}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> selectUserById(@PathVariable String id, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ComUserVO resultVO;

		try {
			resultVO = comUserService.selectComUser(id);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/users", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUserList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();

		logger.debug("param info {}", comUserVO.toString());

		try {
			resultList = comUserService.selectComUserList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/updateComUserAprv", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComUserAprv(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {
		logger.debug("updateComUserAprv 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			result = comUserService.updateComUserAprv(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// APC관리자승인등록 승인
	@PostMapping(value = "/co/user/updateUserStts", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUserStts(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO comUser : comUserList ) {
				comUser.setSysFrstInptPrgrmId(getPrgrmId());
				comUser.setSysFrstInptUserId(getUserId());
				comUser.setSysLastChgPrgrmId(getPrgrmId());
				comUser.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = comUserService.updateUserSttsList(comUserList);

			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/compareComUserAprv.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateComUserList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {
		logger.debug("compareComUserAprv.do 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO comUser : comUserList ) {
				comUser.setSysFrstInptPrgrmId(getPrgrmId());
				comUser.setSysFrstInptUserId(getUserId());
				comUser.setSysLastChgPrgrmId(getPrgrmId());
				comUser.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = comUserService.updateComUserList(comUserList);

			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}


	/*
	 * 비밀번호 초기화
	 */
	@PostMapping(value = "/co/user/updComUserPwd.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updComUserPwd(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updComUserPwd=========start====");
		comUserVO.setSysLastChgUserId(getUserId());
		comUserVO.setSysLastChgPrgrmId(getPrgrmId());

		String enpassword = EgovFileScrty.encryptPassword(comUserVO.getUserId(), comUserVO.getUserId());
		comUserVO.setPswd(enpassword);

		int updatedCnt = 0;

		try {
			updatedCnt = comUserService.updComUserPwd(comUserVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updComUserPwd======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	@GetMapping(value = "/co/user/getApcAgtStats.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	@ResponseBody
	public JSONObject getApcAgtStats(HttpServletRequest request) throws Exception {
		 JSONObject resultJson = new JSONObject();

		 try {
			  //APC에이전트상태 업데이트 SP호출
			  mobileApiService.callSpApcAgtStatsUpdate();

			  Map<String, Object> result = mobileApiService.getApcAgtStats();
			  resultJson.put("result", result);
		 } catch(Exception e) {
			  throw new RuntimeException(e);
		 }

		 return resultJson;
	}
	@PostMapping(value = "/co/user/selectApcEvrmntStngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcEvrmntStngs(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcEvrmntStngVO> resultList = new ArrayList<>();
		try {
			resultList = apcEvrmntStngService.selectApcEvrmntStngList(apcEvrmntStngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put("resultList", resultList);
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	@GetMapping("/co/user/getCountAllPrdcr.do")
	@ResponseBody
	public JSONObject getCountAllPrdcr(HttpServletRequest request) throws Exception {
		JSONObject resultJson = new JSONObject();

		try {
			resultJson.put("result", mobileApiService.getCountAllPrdcr());
		} catch(Exception e) {
			throw new RuntimeException(e);
		}

		return resultJson;
	}
	@GetMapping("/co/user/getStatsForOneYearBySearchYmd.do")
	@ResponseBody
	public JSONObject getStatsForOneYearBySearchYmd(HttpServletRequest request) throws IOException {
		JSONObject resultJson = new JSONObject();
		try {
			Map<String, Object> result = mobileApiService.getStatsForOneYearBySearchYmd();
			resultJson.put("success", true);
			resultJson.put("message", "성공");
			resultJson.put("result", result);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return resultJson;
	}
	@PostMapping(value = "/co/user/selectApcLinkTrsmMatSttsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcLinkTrsmMatSttsList(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<ApcLinkVO> resultList = new ArrayList<>();

		try {
			resultList = apcLinkService.selectApcLinkTrsmMatSttsList(apcLinkVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	// APC 연계기기 상태 update : 취소
	@PostMapping(value = "/co/user/updateLinkTrsmReqCncl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateLinkTrsmReqCncl(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			apcLinkVO.setLinkStts(AmConstants.CON_LINK_STTS_REQ_CNCL);

			HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	// APC 연계기기 상태 update : 요청
	@PostMapping(value = "/co/user/updateLinkTrsmReq.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateLinkTrsmReq(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			apcLinkVO.setLinkStts(AmConstants.CON_LINK_STTS_REQ_DONE);

			HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
}