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
import com.at.apcss.pd.bsm.service.BrnoNumMngService;
import com.at.apcss.pd.bsm.vo.BrnoNumMngVO;

@Controller
public class BrnoNumMngController extends BaseController{

	@Resource(name= "BrnoNumMngService")
	private BrnoNumMngService BrnoNumMngService;

	//화면이동
	@RequestMapping(value = "/pd/bsm/BrnoNumMng.do")
	public String BrnoNumMng() {
		return "apcss/pd/bsm/BrnoNumMng";
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectBrnoNumMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoNumMng(Model model, @RequestBody BrnoNumMngVO BrnoNumMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoNumMngVO> resultList = new ArrayList<>();

		try {
			BrnoNumMngVO result = BrnoNumMngService.selectBrnoNumMng(BrnoNumMngVO);
			resultList.add(result);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/bsm/selectBrnoNumMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoNumMngList(Model model, @RequestBody BrnoNumMngVO BrnoNumMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoNumMngVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoNumMngService.selectBrnoNumMngList(BrnoNumMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/bsm/multiSaveBrnoNumMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveUoList(@RequestBody List<BrnoNumMngVO> BrnoNumMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (BrnoNumMngVO BrnoNumMngVO : BrnoNumMngVOList) {
				BrnoNumMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				BrnoNumMngVO.setSysFrstInptUserId(getUserId());
				BrnoNumMngVO.setSysLastChgPrgrmId(getPrgrmId());
				BrnoNumMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = BrnoNumMngService.multiSaveBrnoNumMngList(BrnoNumMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/bsm/deleteBrnoNumMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBrnoNumMng(@RequestBody BrnoNumMngVO BrnoNumMngVO, HttpServletRequest request) throws Exception {

		BrnoNumMngVO.setSysLastChgPrgrmId(getPrgrmId());
		BrnoNumMngVO.setSysLastChgUserId(getUserId());

		int result = 0;
		try {
			result = BrnoNumMngService.deleteBrnoNumMng(BrnoNumMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 리스트 조회
	@PostMapping(value = "/pd/bsm/selectBrnoNumMngRowDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoNumMngRowDataList(Model model, @RequestBody BrnoNumMngVO BrnoNumMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BrnoNumMngVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoNumMngService.selectBrnoNumMngRowDataList(BrnoNumMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
