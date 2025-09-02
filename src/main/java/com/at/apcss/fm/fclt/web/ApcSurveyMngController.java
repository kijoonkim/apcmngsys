package com.at.apcss.fm.fclt.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.ApcSurveyMngService;
import com.at.apcss.fm.fclt.service.FcltOperInfoService;
import com.at.apcss.fm.fclt.vo.ApcSurveyMstVO;
import com.at.apcss.fm.fclt.vo.FcltApcVO;
import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


/**
 * @Class Name : ApcSurveyMngController.java
 * @Description : APC전수조사 관리에 대한 Controller 클래스
 * @author
 * @since 2025.05.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  	----------  ---------------------------
 * 2025.05.12	신정철       최초 생성
 * </pre>
 */
@Controller
public class ApcSurveyMngController extends BaseController {

	// 운영자개요
	@Resource(name= "apcSurveyMngService")
	private ApcSurveyMngService apcSurveyMngService;

	// 운영자개요 등록
	@PostMapping(value = "/fm/fclt/insertOperOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertOperOgnz(@RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		fcltOperInfoVO.setSysFrstInptUserId(getUserId());
		fcltOperInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOperInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		try {
			HashMap<String, Object> rtnObj = apcSurveyMngService.insertOperOgnz(fcltOperInfoVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/fclt/insertCheckApcSurvey.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCheckApcSurvey(@RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		try {
			HashMap<String, Object> rtnObj = apcSurveyMngService.insertCheckApcSurvey(fcltOperInfoVO.getCrtrYr());
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC전수조사마스터 목록 조회
	@PostMapping(value = "/fm/fclt/selectApcSurveyMasterList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcSurveyMasterList (@RequestBody ApcSurveyMstVO apcSurveyMstVO , HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		List<ApcSurveyMstVO> resultList = new ArrayList<>();

		try {
			resultList = apcSurveyMngService.selectApcSurveyMasterList(apcSurveyMstVO);
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	// APC전수조사 운영자정보 조회
	@PostMapping(value = "/fm/fclt/selectOperPrsnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectOperPrsnInfoList (@RequestBody FcltOperInfoVO fcltOperInfoVO , HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		List<FcltOperInfoVO> resultList = new ArrayList<>();

		try {
			resultList = apcSurveyMngService.selectOperPrsnInfoList(fcltOperInfoVO);
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	// APC전수조사마스터 수정
	@PostMapping(value = "/fm/fclt/updateApcCmsuMst.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateApcCmsuMst(@RequestBody List<ApcSurveyMstVO> apcSurveyMstList, HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		for (ApcSurveyMstVO apcSurveyMstVO:apcSurveyMstList) {
			apcSurveyMstVO.setSysFrstInptUserId(getUserId());
			apcSurveyMstVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcSurveyMstVO.setSysLastChgUserId(getUserId());
			apcSurveyMstVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		try {
			HashMap<String, Object> rtnObj = apcSurveyMngService.updateApcCmsuMst(apcSurveyMstList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC전수조사 운영자정보 수정
	@PostMapping(value = "/fm/fclt/updateOperPrsnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateOperPrsnInfo(@RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		fcltOperInfoVO.setSysFrstInptUserId(getUserId());
		fcltOperInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOperInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		try {
			HashMap<String, Object> rtnObj = apcSurveyMngService.updateOperPrsnInfo(fcltOperInfoVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/fclt/selectApcCmsuCrtrYr.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcCmsuCrtrYr(HttpServletRequest request) throws Exception{

		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		List<ApcSurveyMstVO> resultList = new ArrayList<>();

		try {
			resultList = apcSurveyMngService.selectApcCmsuCrtrYr();
		}  catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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
}