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
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnPurSalMngList(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngList(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 매입, 매출 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnPurSalMngPrchsSlsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnPurSalMngPrchsSlsList(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultPrchsList = new ArrayList<>();
		List<InvShipOgnPurSalMngVO> resultSlsList = new ArrayList<>();
		try {
			 resultPrchsList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngPrchsList(invShipOgnPurSalMngVO);
			 resultSlsList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngSlsList(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultPrchsList", resultPrchsList);
		resultMap.put("resultSlsList", resultSlsList);
		return getSuccessResponseEntity(resultMap);
	}

	// 매입, 매출 조회 (출자출하조직 자체 품목 조회로 변경)
	@PostMapping(value = "/pd/isom/selectInvShipOgnPurSalMngPrchsSlsListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnPurSalMngPrchsSlsListNew(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultPrchsList = new ArrayList<>();
		List<InvShipOgnPurSalMngVO> resultSlsList = new ArrayList<>();
		InvShipOgnPurSalMngVO result = new InvShipOgnPurSalMngVO();
		try {
			 resultPrchsList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngPrchsListNew(invShipOgnPurSalMngVO);
			 resultSlsList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngSlsListNew(invShipOgnPurSalMngVO);
			 result = invShipOgnPurSalMngService.selectTempSaveIsoAps(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultPrchsList", resultPrchsList);
		resultMap.put("resultSlsList", resultSlsList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/isom/selectIsoTotalPurchaseSaleList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoTotalPurchaseList(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultPrchsList = new ArrayList<>();
		List<InvShipOgnPurSalMngVO> resultSlsList = new ArrayList<>();
		InvShipOgnPurSalMngVO result = new InvShipOgnPurSalMngVO();
		try {
			//resultPrchsList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngPrchsListNew(invShipOgnPurSalMngVO);
			resultPrchsList = invShipOgnPurSalMngService.selectIsoTotalPurchaseList(invShipOgnPurSalMngVO);
			//resultSlsList = invShipOgnPurSalMngService.selectInvShipOgnPurSalMngSlsListNew(invShipOgnPurSalMngVO);
			resultSlsList = invShipOgnPurSalMngService.selectIsoTotalSaleList(invShipOgnPurSalMngVO);
			result = invShipOgnPurSalMngService.selectTempSaveIsoAps(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultPrchsList", resultPrchsList);
		resultMap.put("resultSlsList", resultSlsList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	//등록
	@PostMapping(value = "/pd/isom/insertInvShipOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertInvShipOgnPurSalMng(@RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();

		// validation check

		// audit 항목
		invShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
		invShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		invShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
		invShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = invShipOgnPurSalMngService.insertInvShipOgnPurSalMng01(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnPurSalMngList01.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnPurSalMngList01(@RequestBody List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngVOList) {
				invShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				invShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				invShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList01(invShipOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//매출 저장
	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnPurSalMngList02.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnPurSalMngList02(@RequestBody List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngVOList) {
				invShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				invShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				invShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList02(invShipOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//매출 저장
	@PostMapping(value = "/pd/isom/multiSaveInvShipOgnPurSalMngList03.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnPurSalMngList03(@RequestBody List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngVOList) {
				invShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				invShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				invShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList03(invShipOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/isom/deleteInvShipOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteInvShipOgnPurSalMng(@RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception {
		int result = 0;
		try {
			result = invShipOgnPurSalMngService.deleteInvShipOgnPurSalMng(invShipOgnPurSalMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnPurSalMngRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultList;
		try {
			 resultList = invShipOgnPurSalMngService.selectRawDataList(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnPurSalMngRawDataList2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList2025(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultList;
		try {
			 resultList = invShipOgnPurSalMngService.selectRawDataList2025(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	// 로우데이터 조회
	@PostMapping(value = "/pd/isom/selectIsoTotalPurchaseSaleRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoTotalPurchaseSaleRawDataList(Model model, @RequestBody InvShipOgnPurSalMngVO invShipOgnPurSalMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnPurSalMngVO> resultList;

		try {
			resultList = invShipOgnPurSalMngService.selectIsoTotalPurchaseSaleRawDataList(invShipOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
