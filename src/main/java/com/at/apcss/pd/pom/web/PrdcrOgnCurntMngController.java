package com.at.apcss.pd.pom.web;

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
import com.at.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;

@Controller
public class PrdcrOgnCurntMngController extends BaseController{

	@Resource(name= "PrdcrOgnCurntMngService")
	private PrdcrOgnCurntMngService PrdcrOgnCurntMngService;

	//화면이동
	@RequestMapping(value = "/pd/pom/PrdcrOgnCurntMng.do")
	public String PrdcrOgnCurntMng() {
		return "apcss/pd/pom/PrdcrOgnCurntMng";
	}

	// 조회
	@PostMapping(value = "/pd/pom/selectPrdcrOgnCurntMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnCurntMngList(Model model, @RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrOgnCurntMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnCurntMngService.selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 농가 리스트 조회
	@PostMapping(value = "/pd/pom/selectPrdcrOgnCurntMngDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnCurntMngDtlList(Model model, @RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrOgnCurntMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnCurntMngService.selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/pd/pom/insertPrdcrOgnCurntMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPrdcrOgnCurntMng(@RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		PrdcrOgnCurntMngVO.setSysFrstInptUserId(getUserId());
		PrdcrOgnCurntMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrOgnCurntMngVO.setSysLastChgUserId(getUserId());
		PrdcrOgnCurntMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrOgnCurntMngService.insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/pom/multiSavePrdcrOgnCurntMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrdcrOgnCurntMngList(@RequestBody List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO : PrdcrOgnCurntMngVOList) {
				PrdcrOgnCurntMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				PrdcrOgnCurntMngVO.setSysFrstInptUserId(getUserId());
				PrdcrOgnCurntMngVO.setSysLastChgPrgrmId(getPrgrmId());
				PrdcrOgnCurntMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrdcrOgnCurntMngService.multiSavePrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//농가 리스트 선택 데이터 삭제
	@PostMapping(value = "/pd/pom/deletePrdcrOgnCurntMngDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrOgnCurntMngDtl(@RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pom/deletePrdcrOgnCurntMng >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ PrdcrOgnCurntMngService.deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	//생산자 조직 등록
	@PostMapping(value = "/pd/pom/multiSaveTbEvFrmhsApoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveTbEvFrmhsApoList(@RequestBody List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (TbEvFrmhsApoVO tbEvFrmhsApoVO : tbEvFrmhsApoVOList) {
				tbEvFrmhsApoVO.setSysFrstInptPrgrmId(getPrgrmId());
				tbEvFrmhsApoVO.setSysFrstInptUserId(getUserId());
				tbEvFrmhsApoVO.setSysLastChgPrgrmId(getPrgrmId());
				tbEvFrmhsApoVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrdcrOgnCurntMngService.multiSaveTbEvFrmhsApoList(tbEvFrmhsApoVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 생산자조직 리스트 조회
	@PostMapping(value = "/pd/pom/selectTbEvFrmhsApoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTbEvFrmhsApoList(Model model, @RequestBody TbEvFrmhsApoVO tbEvFrmhsApoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TbEvFrmhsApoVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnCurntMngService.selectTbEvFrmhsApoList(tbEvFrmhsApoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//생산자조직 삭제
	@PostMapping(value = "/pd/pom/deleteTbEvFrmhsApo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteTbEvFrmhsApo(@RequestBody TbEvFrmhsApoVO tbEvFrmhsApoVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/pom/deleteTbEvFrmhsApo >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ PrdcrOgnCurntMngService.deleteTbEvFrmhsApo(tbEvFrmhsApoVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}
}
