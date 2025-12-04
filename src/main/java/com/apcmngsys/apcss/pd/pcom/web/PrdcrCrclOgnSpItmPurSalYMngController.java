package com.apcmngsys.apcss.pd.pcom.web;

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

import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.controller.BaseController;
import com.apcmngsys.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalYMngService;
import com.apcmngsys.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;

@Controller
public class PrdcrCrclOgnSpItmPurSalYMngController extends BaseController{

	@Resource(name= "prdcrCrclOgnSpItmPurSalYMngService")
	private PrdcrCrclOgnSpItmPurSalYMngService prdcrCrclOgnSpItmPurSalYMngService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnSpItmPurSalYMng.do")
	public String PrdcrCrclOgnSpItmPurSalYMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnSpItmPurSalYMng";
	}

	// 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnSpItmPurSalYMngList(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnSpItmPurSalYMngService.selectPrdcrCrclOgnSpItmPurSalYMngList(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//등록
	@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnSpItmPurSalYMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnSpItmPurSalYMng(@RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();

		// validation check

		// audit 항목
		prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptUserId(getUserId());
		prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgUserId(getUserId());
		prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = prdcrCrclOgnSpItmPurSalYMngService.insertPrdcrCrclOgnSpItmPurSalYMng(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalYMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnSpItmPurSalYMngList(@RequestBody List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO : PrdcrCrclOgnSpItmPurSalYMngVOList) {
				prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnSpItmPurSalYMngService.multiSavePrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcom/deletePrdcrCrclOgnSpItmPurSalYMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnSpItmPurSalYMng(@RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception {
		int result = 0;
		try {
			result = prdcrCrclOgnSpItmPurSalYMngService.deletePrdcrCrclOgnSpItmPurSalYMng(prdcrCrclOgnSpItmPurSalYMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 통합조직 전문품목 매입매출 로우데이터 조회 2024년
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnSpItmPurSalYMngService.selectRawDataList(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 통합조직 전문품목 매입매출 로우데이터 조회 2025년
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngRawDataList2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList2025(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnSpItmPurSalYMngService.selectRawDataList2025(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 통합조직 전문품목 매입매출 rawdata 목록
	 * @param model
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/pd/pcom/selectUoMajorItemPrchsSlsRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoMajorItemPrchsSlsRawDataList(
				Model model,
				@RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO,
				HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		try {
			resultList = prdcrCrclOgnSpItmPurSalYMngService.selectUoMajorItemPrchsSlsRawDataList(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	/**
	 *
	 * @param model
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/pd/pcom/selectUoMajorItemPrchsSlsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoMajorItemPrchsSlsList(
				Model model,
				@RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO,
				HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		PrdcrCrclOgnSpItmPurSalYMngVO result = new PrdcrCrclOgnSpItmPurSalYMngVO();
		try {
			resultList = prdcrCrclOgnSpItmPurSalYMngService.selectUoMajorItemPrchsSlsList(prdcrCrclOgnSpItmPurSalYMngVO);
			result = prdcrCrclOgnSpItmPurSalYMngService.selectTempSaveUoPst(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	// 개발서버 신규화면 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnSpItmPurSalYMngListNew(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();
		PrdcrCrclOgnSpItmPurSalYMngVO result = new PrdcrCrclOgnSpItmPurSalYMngVO();
		try {
			 resultList = prdcrCrclOgnSpItmPurSalYMngService.selectPrdcrCrclOgnSpItmPurSalYMngListNew(prdcrCrclOgnSpItmPurSalYMngVO);
			 result = prdcrCrclOgnSpItmPurSalYMngService.selectTempSaveUoPst(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 통합조직 전문품목 매입매출 목록 조회 (육성 -> 승인)
	 * @param model
	 * @param prdcrCrclOgnSpItmPurSalYMngVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/pd/pcom/selectUoMajorItemListForUpbrToAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoMajorItemListForUpbrToAprv(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList;
		PrdcrCrclOgnSpItmPurSalYMngVO result;
		try {
			resultList = prdcrCrclOgnSpItmPurSalYMngService.selectUoMajorItemListForUpbrToAprv(prdcrCrclOgnSpItmPurSalYMngVO);
			result = prdcrCrclOgnSpItmPurSalYMngService.selectTempSaveUoPst(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result == null ? new PrdcrCrclOgnSpItmPurSalYMngVO() : result);
		return getSuccessResponseEntity(resultMap);
	}

	// 개발서버 신규화면 등록
	@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalYMngListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnSpItmPurSalYMngListNew(@RequestBody List<PrdcrCrclOgnSpItmPurSalYMngVO> PrdcrCrclOgnSpItmPurSalYMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO : PrdcrCrclOgnSpItmPurSalYMngVOList) {
				prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnSpItmPurSalYMngService.multiSavePrdcrCrclOgnSpItmPurSalYMngListNew(PrdcrCrclOgnSpItmPurSalYMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcom/selectPruoMajorItemPrchsSlsHldIsoTrmtTypeIndctList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPruoMajorItemPrchsSlsHldIsoTrmtTypeIndctList (Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();

		try {
			resultList = prdcrCrclOgnSpItmPurSalYMngService.selectPruoMajorItemPrchsSlsHldIsoTrmtTypeIndctList(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcom/selectPruoMajorItemPrchsSlsHldIsoTrmtTypeIndctRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPruoMajorItemPrchsSlsHldIsoTrmtTypeIndctRawDataList (Model model, @RequestBody PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<PrdcrCrclOgnSpItmPurSalYMngVO> resultList = new ArrayList<>();

		try {
			resultList = prdcrCrclOgnSpItmPurSalYMngService.selectPruoMajorItemPrchsSlsHldIsoTrmtTypeIndctRawDataList(prdcrCrclOgnSpItmPurSalYMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
