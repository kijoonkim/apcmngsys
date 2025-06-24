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
	private InvShipOgnSpeczItmPurSalMngService invShipOgnSpeczItmPurSalMngService;

	//화면이동
	@RequestMapping(value = "/pd/isom/InvShipOgnSpeczItmPurSalMng.do")
	public String invShipOgnSpeczItmPurSalMng() {
		return "apcss/pd/isom/InvShipOgnSpeczItmPurSalMng";
	}

	// 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnSpeczItmPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnSpeczItmPurSalMngList(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnSpeczItmPurSalMngService.selectInvShipOgnSpeczItmPurSalMngList(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//등록
	@PostMapping(value = "/pd/isom/insertInvShipOgnSpeczItmPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertInvShipOgnSpeczItmPurSalMng(@RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();

		// validation check

		// audit 항목
		invShipOgnSpeczItmPurSalMngVO.setSysFrstInptUserId(getUserId());
		invShipOgnSpeczItmPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		invShipOgnSpeczItmPurSalMngVO.setSysLastChgUserId(getUserId());
		invShipOgnSpeczItmPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = invShipOgnSpeczItmPurSalMngService.insertInvShipOgnSpeczItmPurSalMng(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnSpeczItmPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnSpeczItmPurSalMngList(@RequestBody List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO : invShipOgnSpeczItmPurSalMngVOList) {
				invShipOgnSpeczItmPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invShipOgnSpeczItmPurSalMngVO.setSysFrstInptUserId(getUserId());
				invShipOgnSpeczItmPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				invShipOgnSpeczItmPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnSpeczItmPurSalMngService.multiSaveInvShipOgnSpeczItmPurSalMngList(invShipOgnSpeczItmPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/isom/deleteInvShipOgnSpeczItmPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteInvShipOgnSpeczItmPurSalMng(@RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception {

		int result = 0;
		try {
			result = invShipOgnSpeczItmPurSalMngService.deleteInvShipOgnSpeczItmPurSalMng(invShipOgnSpeczItmPurSalMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회 2024년
	@PostMapping(value = "/pd/isom/selectInvShipOgnSpeczItmPurSalMngRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnSpeczItmPurSalMngService.selectRawDataList(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회 2025년
	@PostMapping(value = "/pd/isom/selectInvShipOgnSpeczItmPurSalMngRawDataList2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList2025(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnSpeczItmPurSalMngService.selectRawDataList2025(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	/**
	 * 출자출하조직 전문품목 매입매출 rawdata 목록조회
	 * @param model
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/pd/isom/selectIsoMajorItemPurchaseRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoMajorItemPurchaseRawDataList(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnSpeczItmPurSalMngService.selectIsoMajorItemPurchaseRawDataList(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 출자출하조직 전문품목 매입매출 목록 조회
	@PostMapping(value = "/pd/isom/selectIsoMajorItemPurchaseList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoMajorItemPurchaseList(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		InvShipOgnSpeczItmPurSalMngVO result = new InvShipOgnSpeczItmPurSalMngVO();
		try {
			resultList = invShipOgnSpeczItmPurSalMngService.selectIsoMajorItemPurchaseList(invShipOgnSpeczItmPurSalMngVO);
			result = invShipOgnSpeczItmPurSalMngService.selectTempSaveIsoPst(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	// 출자출하조직 전문품목 매입매출 조회 2025년
	@PostMapping(value = "/pd/isom/selectInvShipOgnSpeczItmPurSalMngListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnSpeczItmPurSalMngListNew(Model model, @RequestBody InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnSpeczItmPurSalMngVO> resultList = new ArrayList<>();
		InvShipOgnSpeczItmPurSalMngVO result = new InvShipOgnSpeczItmPurSalMngVO();
		try {
			resultList = invShipOgnSpeczItmPurSalMngService.selectInvShipOgnSpeczItmPurSalMngListNew(invShipOgnSpeczItmPurSalMngVO);
			result = invShipOgnSpeczItmPurSalMngService.selectTempSaveIsoPst(invShipOgnSpeczItmPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	// 출자출하조직 전문품목 매입매출 리스트 저장 2025년
	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnSpeczItmPurSalMngListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnSpeczItmPurSalMngListNew(@RequestBody List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO : invShipOgnSpeczItmPurSalMngVOList) {
				invShipOgnSpeczItmPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invShipOgnSpeczItmPurSalMngVO.setSysFrstInptUserId(getUserId());
				invShipOgnSpeczItmPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				invShipOgnSpeczItmPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnSpeczItmPurSalMngService.multiSaveInvShipOgnSpeczItmPurSalMngListNew(invShipOgnSpeczItmPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

}
