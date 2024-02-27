package com.at.apcss.pd.pcom.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalYMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;

@Controller
public class PrdcrCrclOgnSpItmPurSalYMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnSpItmPurSalYMngService")
	private PrdcrCrclOgnSpItmPurSalYMngService PrdcrCrclOgnSpItmPurSalYMngService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnSpItmPurSalYMng.do")
	public String PrdcrCrclOgnSpItmPurSalYMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnSpItmPurSalYMng";
	}

	// 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnSpItmPurSalYMngList(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnSpItmPurSalYMngService.selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//등록
	@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnSpItmPurSalYMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnSpItmPurSalYMng(@RequestBody PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		PrdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgUserId(getUserId());
		PrdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnSpItmPurSalYMngService.insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalYMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnSpItmPurSalYMngList(@RequestBody List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO : PrdcrCrclOgnSpItmPurSalYMngVOList) {
				PrdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptUserId(getUserId());
				PrdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrdcrCrclOgnSpItmPurSalYMngService.multiSavePrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcom/deletePrdcrCrclOgnSpItmPurSalYMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnSpItmPurSalYMng(@RequestBody PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pcom/deletePrdcrCrclOgnSpItmPurSalYMng >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ PrdcrCrclOgnSpItmPurSalYMngService.deletePrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnSpItmPurSalYMngService.selectRawDataList(PrdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
