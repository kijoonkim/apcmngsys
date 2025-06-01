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
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnPurSalMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnPurSalMngVO;

@Controller
public class PrdcrCrclOgnPurSalMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnPurSalMngService")
	private PrdcrCrclOgnPurSalMngService prdcrCrclOgnPurSalMngService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnPurSalMng.do")
	public String PrdcrCrclOgnPurSalMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnPurSalMng";
	}

	// 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnPurSalMngList(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnPurSalMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnPurSalMngService.selectPrdcrCrclOgnPurSalMngList(prdcrCrclOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnPurSalMng(@RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();

		// validation check

		// audit 항목
		prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
		prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
		prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = prdcrCrclOgnPurSalMngService.insertPrdcrCrclOgnPurSalMng01(prdcrCrclOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//매입 저장
	@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList01.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnPurSalMngList01(@RequestBody List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngVOList) {
				prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList01(prdcrCrclOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//매출 저장
	@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList02.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnPurSalMngList02(@RequestBody List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngVOList) {
				prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList02(prdcrCrclOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//매출 저장
	@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList03.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnPurSalMngList03(@RequestBody List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngVOList) {
				prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList03(prdcrCrclOgnPurSalMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcom/deletePrdcrCrclOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnPurSalMng(@RequestBody PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pcom/deletePrdcrCrclOgnPurSalMng >>> 호출 >>> ");

		int result = 0;
		try {
			result = prdcrCrclOgnPurSalMngService.deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnPurSalMngRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnPurSalMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnPurSalMngService.selectRawDataList(prdcrCrclOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 로우데이터 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnPurSalMngRawDataList2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList2025(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnPurSalMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnPurSalMngService.selectRawDataList2025(prdcrCrclOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 통합조직 총 매입매출 Raw Data 목록 조회
	 * @param model
	 * @param prdcrCrclOgnPurSalMngVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/pd/pcom/selectUoTotalPurchaseRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoTotalPurchaseRawDataList(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnPurSalMngVO> resultList;
		try {
			resultList = prdcrCrclOgnPurSalMngService.selectUoTotalPurchaseRawDataList(prdcrCrclOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcom/selectUoTotalPurchaseSaleList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoTotalPurchaseSaleList(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnPurSalMngVO> resultPrchsList;
		List<PrdcrCrclOgnPurSalMngVO> resultSlsList;
		PrdcrCrclOgnPurSalMngVO result;

		try {
			//매입 리스트
			resultPrchsList = prdcrCrclOgnPurSalMngService.selectUoTotalPurchaseList(prdcrCrclOgnPurSalMngVO);
			//매출 리스트
			resultSlsList = prdcrCrclOgnPurSalMngService.selectUoTotalSaleList(prdcrCrclOgnPurSalMngVO);
			//임시저장 정보
			result = prdcrCrclOgnPurSalMngService.selectTempSaveUoAps(prdcrCrclOgnPurSalMngVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultPrchsList", resultPrchsList);
		resultMap.put("resultSlsList", resultSlsList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}


	// 매입, 매출 리스트 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnPurSalMngPrchsSlsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnPurSalMngListNew(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnPurSalMngVO> resultPrchsList = new ArrayList<>();
		List<PrdcrCrclOgnPurSalMngVO> resultSlsList = new ArrayList<>();
		PrdcrCrclOgnPurSalMngVO result = new PrdcrCrclOgnPurSalMngVO();
		try {
			//매입 리스트
			resultPrchsList = prdcrCrclOgnPurSalMngService.selectPrdcrCrclOgnPurSalMngPrchsList(prdcrCrclOgnPurSalMngVO);
			//매출 리스트
			resultSlsList = prdcrCrclOgnPurSalMngService.selectPrdcrCrclOgnPurSalMngSlsList(prdcrCrclOgnPurSalMngVO);
			//임시저장 정보
			result = prdcrCrclOgnPurSalMngService.selectTempSaveUoAps(prdcrCrclOgnPurSalMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultPrchsList", resultPrchsList);
		resultMap.put("resultSlsList", resultSlsList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

}
