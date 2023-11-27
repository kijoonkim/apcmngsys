package com.at.apcss.pd.bsm.web;

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
import com.at.apcss.pd.bsm.service.PrdcrCrclOgnMngService;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnMngVO;
import com.at.apcss.pd.bsm.vo.UoListVO;

@Controller
public class PrdcrCrclOgnMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnMngService")
	private PrdcrCrclOgnMngService PrdcrCrclOgnMngService;

	//화면이동
	@RequestMapping(value = "/pd/bsm/PrdcrCrclOgnMng.do")
	public String PrdcrCrclOgnMng() {
		return "apcss/pd/bsm/PrdcrCrclOgnMng";
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectPrdcrCrclOgnMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnMngList(Model model, @RequestBody PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnMngVO> resultList = new ArrayList<>();

		try {
			resultList = PrdcrCrclOgnMngService.selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/pd/bsm/insertPrdcrCrclOgnMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnMng(@RequestBody PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		PrdcrCrclOgnMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnMngVO.setSysLastChgUserId(getUserId());
		PrdcrCrclOgnMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnMngService.insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//저장
	@PostMapping(value = "/pd/bsm/updatePrdcrCrclOgnMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updatePrdcrCrclOgnMng(@RequestBody PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		PrdcrCrclOgnMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnMngVO.setSysLastChgUserId(getUserId());
		PrdcrCrclOgnMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnMngService.updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}



	// 통합조직 리스트 조회
	@PostMapping(value = "/pd/bsm/selectUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoList(Model model, @RequestBody UoListVO uoListVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<UoListVO> resultList = new ArrayList<>();

		try {
			resultList = PrdcrCrclOgnMngService.selectUoList(uoListVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/bsm/multiSaveUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveUoList(@RequestBody List<UoListVO> UoListVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (UoListVO uoListVO : UoListVOList) {
				uoListVO.setSysFrstInptPrgrmId(getPrgrmId());
				uoListVO.setSysFrstInptUserId(getUserId());
				uoListVO.setSysLastChgPrgrmId(getPrgrmId());
				uoListVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrdcrCrclOgnMngService.multiSaveUoList(UoListVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/bsm/deleteUo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteUo(@RequestBody UoListVO uoListVO, HttpServletRequest request) throws Exception {

		int result = 0;
		try {
			result =+ PrdcrCrclOgnMngService.deleteUo(uoListVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	/*
	@PostMapping(value = "/pd/bsm/multiSavePrdcrCrclOgnMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnMngList(@RequestBody List<PrdcrCrclOgnMngVO> PrdcrCrclOgnMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO : PrdcrCrclOgnMngVOList) {
				PrdcrCrclOgnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrCrclOgnMngVO.setSysFrstInptUserId(getUserId());
				PrdcrCrclOgnMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrCrclOgnMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrdcrCrclOgnMngService.multiSavePrdcrCrclOgnMngList(PrdcrCrclOgnMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}
	*/

	/*
	@PostMapping(value = "/pd/bsm/deletePrdcrCrclOgnMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnMng(@RequestBody PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/bsm/deletePrdcrCrclOgnMng >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ PrdcrCrclOgnMngService.deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}
	*/

}
