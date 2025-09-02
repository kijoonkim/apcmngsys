package com.at.apcss.pd.pcom.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.pd.pcom.vo.PruoRegVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnOnlnWhlslMrktService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnOnlnWhlslMrktVO;

@Controller
public class PrdcrCrclOgnOnlnWhlslMrktController extends BaseController{

	@Resource(name= "PrdcrCrclOgnOnlnWhlslMrktService")
	private PrdcrCrclOgnOnlnWhlslMrktService PrdcrCrclOgnOnlnWhlslMrktService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnOnlnWhlslMrkt.do")
	public String PrdcrCrclOgnOnlnWhlslMrkt() {
		return "apcss/pd/pcom/PrdcrCrclOgnOnlnWhlslMrkt";
	}

	//온라인도매시장 정보 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrkt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnOnlnWhlslMrkt(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrkt.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		PrdcrCrclOgnOnlnWhlslMrktVO result = new PrdcrCrclOgnOnlnWhlslMrktVO();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = new ArrayList<>();
		try {
			//온라인도매시장 판매목표
			result = PrdcrCrclOgnOnlnWhlslMrktService.selectPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO);
			//온라인도매시장 출하실적
			resultList = PrdcrCrclOgnOnlnWhlslMrktService.selectOnlnDtlList(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조직 리스트 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrktUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnOnlnWhlslMrktUoList(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrktUoList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnOnlnWhlslMrktService.selectPrdcrCrclOgnOnlnWhlslMrktUoList(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//온라인도매시장 판매목표 저장
	@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnOnlnWhlslMrkt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnOnlnWhlslMrkt(@RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pcom/insertPrdcrCrclOgnOnlnWhlslMrkt.do >>> 호출 >>> ");

		PrdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgPrgrmId(getPrgrmId());
		PrdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgUserId(getUserId());

		int result = 0;

		try {
			result = PrdcrCrclOgnOnlnWhlslMrktService.insertPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	// 조직,품목 콤보 리스트 조회
	@PostMapping(value = "/pd/pcom/selectOnlnComboList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectOnlnComboList(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/pcom/selectOnlnComboList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultOgnzList = new ArrayList<>();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultItemList = new ArrayList<>();
		try {
			resultOgnzList = PrdcrCrclOgnOnlnWhlslMrktService.selectOgnzList(PrdcrCrclOgnOnlnWhlslMrktVO);
			resultItemList = PrdcrCrclOgnOnlnWhlslMrktService.selectItemList(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultOgnzList", resultOgnzList);
		resultMap.put("resultItemList", resultItemList);
		return getSuccessResponseEntity(resultMap);
	}

	//온라인도매시장 출하실적 저장
	@PostMapping(value = "/pd/pcom/multiSaveOnlnDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveOnlnDtl(@RequestBody List<PrdcrCrclOgnOnlnWhlslMrktVO> PrdcrCrclOgnOnlnWhlslMrktVOList, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pcom/multiSaveOnlnDtl.do >>> 호출 >>> ");

		int resultCnt = 0;

		try {
			for (PrdcrCrclOgnOnlnWhlslMrktVO prdcrCrclOgnOnlnWhlslMrktVO : PrdcrCrclOgnOnlnWhlslMrktVOList) {
				prdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgUserId(getUserId());
			}
			resultCnt = PrdcrCrclOgnOnlnWhlslMrktService.multiSaveOnlnDtl(PrdcrCrclOgnOnlnWhlslMrktVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultCnt", resultCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//온라인도매시장 출하실적 저장
	@PostMapping(value = "/pd/pcom/deleteOnlnDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteOnlnDtl(@RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pcom/multiSaveOnlnDtl.do >>> 호출 >>> ");

		int resultCnt = 0;

		try {
			PrdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptUserId(getUserId());
			PrdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgPrgrmId(getPrgrmId());
			PrdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgUserId(getUserId());

			resultCnt = PrdcrCrclOgnOnlnWhlslMrktService.deleteOnlnDtl(PrdcrCrclOgnOnlnWhlslMrktVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultCnt", resultCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//온라인도매시장 판매목표 로우데이터 조회
	@PostMapping(value = "/pd/pcom/selectRawDataOnln.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataOnln(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/pcom/selectRawDataOnln.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = new ArrayList<>();
		try {
			//온라인도매시장 판매목표
			resultList = PrdcrCrclOgnOnlnWhlslMrktService.selectRawDataOnln(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//온라인도매시장 출하실적 로우데이터 조회
	@PostMapping(value = "/pd/pcom/selectRawDataOnlnDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataOnlnDtl(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/pcom/selectRawDataOnlnDtl.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = new ArrayList<>();
		try {
			//온라인도매시장 출하실적
			resultList = PrdcrCrclOgnOnlnWhlslMrktService.selectRawDataOnlnDtl(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 생산유통통합조직 등록 마스터 목록 조회
	@PostMapping(value = "/pd/pcom/selectPruoRegMst.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPruoRegMst(Model model, @RequestBody PruoRegVO pruoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PruoRegVO> resultList = new ArrayList<>();
		try {
			resultList = PrdcrCrclOgnOnlnWhlslMrktService.selectPruoRegMst(pruoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 생산유통통합조직 등록 상세 조회
	@PostMapping(value = "/pd/pcom/selectPruoRegDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPruoRegDtl(Model model, @RequestBody PruoRegVO pruoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		PruoRegVO resultVO = new PruoRegVO();
		try {
			resultVO = PrdcrCrclOgnOnlnWhlslMrktService.selectPruoRegDtl(pruoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);
		return getSuccessResponseEntity(resultMap);
	}

}
