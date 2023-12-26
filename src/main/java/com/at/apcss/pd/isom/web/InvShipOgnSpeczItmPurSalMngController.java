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
import com.at.apcss.pd.isom.service.InvShipOgnSpeczItmPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;

@Controller
public class InvShipOgnSpeczItmPurSalMngController extends BaseController{

	@Resource(name= "InvShipOgnSpeczItmPurSalMngService")
	private InvShipOgnSpeczItmPurSalMngService InvShipOgnSpeczItmPurSalMngService;

	//화면이동
	@RequestMapping(value = "/pd/isom/InvShipOgnSpeczItmPurSalMng.do")
	public String InvShipOgnSpeczItmPurSalMng() {
		return "apcss/pd/isom/InvShipOgnSpeczItmPurSalMng";
	}

	// 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnSpeczItmPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnSpeczItmPurSalMngList(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		try {
			resultList = InvShipOgnSpeczItmPurSalMngService.selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/pd/isom/insertInvShipOgnSpeczItmPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertInvShipOgnSpeczItmPurSalMng(@RequestBody InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		InvShipOgnSpeczItmPurSalMngVO.setSysFrstInptUserId(getUserId());
		InvShipOgnSpeczItmPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		InvShipOgnSpeczItmPurSalMngVO.setSysLastChgUserId(getUserId());
		InvShipOgnSpeczItmPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = InvShipOgnSpeczItmPurSalMngService.insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnSpeczItmPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnSpeczItmPurSalMngList(@RequestBody List<InvShipOgnSpeczItmPurSalMngVO> InvShipOgnSpeczItmPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO : InvShipOgnSpeczItmPurSalMngVOList) {
				InvShipOgnSpeczItmPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				InvShipOgnSpeczItmPurSalMngVO.setSysFrstInptUserId(getUserId());
				InvShipOgnSpeczItmPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				InvShipOgnSpeczItmPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = InvShipOgnSpeczItmPurSalMngService.multiSaveInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/isom/deleteInvShipOgnSpeczItmPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteInvShipOgnSpeczItmPurSalMng(@RequestBody InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/isom/deleteInvShipOgnSpeczItmPurSalMng >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ InvShipOgnSpeczItmPurSalMngService.deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
