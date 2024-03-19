package com.at.apcss.pd.pcorm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluFndsMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;

@Controller
public class PrdcrCrclOgnVluFndsMngController extends BaseController{

	@Resource(name= "prdcrCrclOgnVluFndsMngService")
	private PrdcrCrclOgnVluFndsMngService prdcrCrclOgnVluFndsMngService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/PrdcrCrclOgnVluFndsMng.do")
	public String PrdcrCrclOgnVluFndsMng() {
		return "apcss/pd/pcorm/PrdcrCrclOgnVluFndsMng";
	}

	// 평가지표 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScoreList1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScoreList1(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScoreList1(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 가감점 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScoreList2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScoreList2(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScoreList2(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 평가지표,가감점 리스트 저장
	@PostMapping(value = "/pd/pcorm/multiSaveActvtnFundList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveActvtnFundList(@RequestBody List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO : PrdcrCrclOgnVluFndsMngVOList) {
				PrdcrCrclOgnVluFndsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrCrclOgnVluFndsMngVO.setSysFrstInptUserId(getUserId());
				PrdcrCrclOgnVluFndsMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrCrclOgnVluFndsMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnVluFndsMngService.multiSaveActvtnFundList(PrdcrCrclOgnVluFndsMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 최종점수 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScrRsltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrRsltList(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			resultList = prdcrCrclOgnVluFndsMngService.selectScrRsltList(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 최종점수 리스트 저장
	@PostMapping(value = "/pd/pcorm/multiSaveScrRsltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveScrRsltList(@RequestBody List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO : PrdcrCrclOgnVluFndsMngVOList) {
				PrdcrCrclOgnVluFndsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrCrclOgnVluFndsMngVO.setSysFrstInptUserId(getUserId());
				PrdcrCrclOgnVluFndsMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrCrclOgnVluFndsMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnVluFndsMngService.multiSaveScrRsltList(PrdcrCrclOgnVluFndsMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}






	// 산출식 관리 팝업 - 산출식 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectComputWayList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComputWayList(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectComputWayList(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 산출식 관리 팝업 - 산출식 리스트 저장
	@PostMapping(value = "/pd/pcorm/multiSaveComputWayList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveComputWayList(@RequestBody List<PrdcrCrclOgnVluFndsMngVO> PrdcrCrclOgnVluFndsMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO : PrdcrCrclOgnVluFndsMngVOList) {
				PrdcrCrclOgnVluFndsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrCrclOgnVluFndsMngVO.setSysFrstInptUserId(getUserId());
				PrdcrCrclOgnVluFndsMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrCrclOgnVluFndsMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnVluFndsMngService.multiSaveComputWayList(PrdcrCrclOgnVluFndsMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//활성화자금 로우데이터 조회
	@PostMapping(value = "/pd/pcorm/selectScrDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrDataList(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScrDataList(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//활성화자금 기준 로우데이터 조회
	@PostMapping(value = "/pd/pcorm/selectRtDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRtDataList(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectRtDataList(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	/* 사용자용 화면 조회 */

	//사용자용 화면 평가지표 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScrUserGrid01.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrUserGrid01(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScrUserGrid01(PrdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//사용자용 화면 가감점 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScrUserGrid02.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrUserGrid02(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScrUserGrid02(PrdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//사용자용 화면 통합조직 선정여부 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScrUserGrid03.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrUserGrid03(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScrUserGrid03(PrdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//사용자용 화면 출자출하조직 선정여부 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScrUserGrid04.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrUserGrid04(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScrUserGrid04(PrdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//사용자용 화면 출자출하조직 선정여부 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectScrUserGrid05.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScrUserGrid05(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO PrdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScrUserGrid05(PrdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
