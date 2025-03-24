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
import com.at.apcss.pd.bsm.service.BrnoMngService;
import com.at.apcss.pd.bsm.vo.BrnoMngVO;

@Controller
public class BrnoMngController extends BaseController{

	@Resource(name= "BrnoMngService")
	private BrnoMngService BrnoMngService;

	//화면이동
	@RequestMapping(value = "/pd/bsm/BrnoMng.do")
	public String BrnoMng() {
		return "apcss/pd/bsm/BrnoMng";
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectBrnoMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoMng(Model model, @RequestBody BrnoMngVO BrnoMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoMngVO> resultList = new ArrayList<>();

		try {
			BrnoMngVO result = BrnoMngService.selectBrnoMng(BrnoMngVO);
			resultList.add(result);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectBrnoMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoMngList(Model model, @RequestBody BrnoMngVO BrnoMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoMngVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoMngService.selectBrnoMngList(BrnoMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectDtlBrnoMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDtlBrnoMngList(Model model, @RequestBody BrnoMngVO BrnoMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoMngVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoMngService.selectDtlBrnoMngList(BrnoMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/bsm/multiSaveBrnoMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveUoList(@RequestBody List<BrnoMngVO> BrnoMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (BrnoMngVO brnoMngVO : BrnoMngVOList) {
				brnoMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				brnoMngVO.setSysFrstInptUserId(getUserId());
				brnoMngVO.setSysLastChgPrgrmId(getPrgrmId());
				brnoMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = BrnoMngService.multiSaveBrnoMngList(BrnoMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/bsm/deleteBrnoMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBrnoMng(@RequestBody BrnoMngVO BrnoMngVO, HttpServletRequest request) throws Exception {

		int result = 0;

		BrnoMngVO.setDelYn("Y");
		BrnoMngVO.setSysLastChgPrgrmId(getPrgrmId());
		BrnoMngVO.setSysLastChgUserId(getUserId());

		try {
			result = BrnoMngService.deleteBrnoMng(BrnoMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 리스트 조회
	@PostMapping(value = "/pd/bsm/selectBrnoMngRowDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoMngRowDataList(Model model, @RequestBody BrnoMngVO BrnoMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoMngVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoMngService.selectBrnoMngRowDataList(BrnoMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
