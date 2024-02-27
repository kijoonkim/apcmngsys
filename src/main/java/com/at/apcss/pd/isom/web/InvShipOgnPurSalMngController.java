package com.at.apcss.pd.isom.web;

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
import com.at.apcss.pd.isom.service.InvShipOgnPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;

@Controller
public class InvShipOgnPurSalMngController extends BaseController{

	@Resource(name= "InvShipOgnPurSalMngService")
	private InvShipOgnPurSalMngService invShipOgnPurSalMngService;

	//화면이동
	@RequestMapping(value = "/pd/isom/InvShipOgnPurSalMng.do")
	public String InvShipOgnPurSalMng() {
		return "apcss/pd/isom/InvShipOgnPurSalMng";
	}

	// 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnPurSalMngList(Model model, @RequestBody InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<InvShipOgnPurSalMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/pd/isom/insertInvShipOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertInvShipOgnPurSalMng(@RequestBody InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		InvShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
		InvShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		InvShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
		InvShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = invShipOgnPurSalMngService.insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnPurSalMngList01.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnPurSalMngList01(@RequestBody List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
				InvShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				InvShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				InvShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				InvShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList01(InvShipOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//매출 저장
	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnPurSalMngList02.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnPurSalMngList02(@RequestBody List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
				InvShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				InvShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				InvShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				InvShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList02(InvShipOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//매출 저장
	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnPurSalMngList03.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnPurSalMngList03(@RequestBody List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO : InvShipOgnPurSalMngVOList) {
				InvShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				InvShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				InvShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				InvShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList03(InvShipOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/isom/deleteInvShipOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteInvShipOgnPurSalMng(@RequestBody InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/isom/deleteInvShipOgnPurSalMng >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ invShipOgnPurSalMngService.deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회
	@PostMapping(value = "/pd/isom/selectRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<InvShipOgnPurSalMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnPurSalMngService.selectRawDataList(InvShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
