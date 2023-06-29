package com.at.apcss.co.cd.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class ComCdApiController extends BaseController {

	@Resource(name = "comCdService")
	private ComCdService comCdService;


	@PostMapping(value = "/co/cd/comCds", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComCdList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComCdVO> resultList;
		logger.debug("pagingYn >>>>  {}", comCdVO.getPagingYn());
		try {
			resultList = comCdService.selectComCdList(comCdVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/cd/comCdDtls", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComCdDtlList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComCdVO> resultList;

		try {
			resultList = comCdService.selectComCdDtlList(comCdVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/cd/comBoCdDtls", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComBoCdDtlList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/comBoCdDtls >>> 호출 >>> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComCdVO> resultList;

		try {
			resultList = comCdService.selectComBoCdDtlList(comCdVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 등록
	@PostMapping(value = "/co/cd/insertComCdList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComCdList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/insertComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysFrstInptPrgrmId("CO_006_001");
				comCdVO.setSysFrstInptUserId("admin");
				comCdVO.setSysLastChgPrgrmId("CO_006_001");
				comCdVO.setSysLastChgUserId("admin");
				result =+ comCdService.insertComCd(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	// 공통코드 수정
	@PostMapping(value = "/co/cd/updateComCdList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComCdList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/updateComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysLastChgPrgrmId("CO_006_001");
				comCdVO.setSysLastChgUserId("admin");
				result =+ comCdService.updateComCd(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 삭제
	@PostMapping(value = "/co/cd/deleteComCdList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComCdList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/deleteComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				result =+ comCdService.deleteComCd(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 등록
	@PostMapping(value = "/co/cd/insertComCdDtlList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/insertComCdDtlList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysFrstInptPrgrmId("CO_006_001");
				comCdVO.setSysFrstInptUserId("admin");
				comCdVO.setSysLastChgPrgrmId("CO_006_001");
				comCdVO.setSysLastChgUserId("admin");
				result =+ comCdService.insertComCdDtl(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 수정
	@PostMapping(value = "/co/cd/updateComCdDtlList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/updateComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysLastChgPrgrmId("CO_006_001");
				comCdVO.setSysLastChgUserId("admin");
				result =+ comCdService.updateComCdDtl(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 삭제
	@PostMapping(value = "/co/cd/deleteComCdDtlList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/deleteComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				result =+ comCdService.deleteComCdDtl(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	// 공통코드 중복 체크
	@PostMapping(value = "/co/cd/duplicateCheckCdId", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> duplicateCheckCdId(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/duplicateCheckCdId >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			result = comCdService.duplicateCheckCdId(comCdVO);
		}catch(Exception e){
			return getErrorResponseEntity(e);
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 중복 체크
	@PostMapping(value = "/co/cd/duplicateCheckCdIdDtl", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> duplicateCheckCdIdDtl(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/duplicateCheckCdId >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			result = comCdService.duplicateCheckCdIdDtl(comCdVO);
		}catch(Exception e){
			return getErrorResponseEntity(e);
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}
}
