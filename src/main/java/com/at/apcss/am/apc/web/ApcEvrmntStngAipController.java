package com.at.apcss.am.apc.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

@RestController
public class ApcEvrmntStngAipController extends BaseController {

	// APC 환경설정
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	// 사용자
	@Resource(name = "comUserService")
	private ComUserService comUserService;

	// 공통코드
	@Resource(name = "comCdService")
	private ComCdService comCdSerivce;

	// APC 환경설정 - APC 정보 조회
	@PostMapping(value = "/am/apc/selectApcInfo", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcInfo(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		logger.debug("selectApcInfo 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ApcEvrmntStngVO resultVO = new ApcEvrmntStngVO();
		try {
			resultVO = apcEvrmntStngService.selectApcInfo(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}


	// APC 환경설정 - 사용자 목록 조회
	@PostMapping(value = "/am/apc/selectApcUserList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcUserList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {
		logger.debug("selectApcInfo 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		try {
			resultList = apcEvrmntStngService.selectApcUserList(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 사용자 정보 등록
	@PostMapping(value = "/am/apc/updateComUserList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComUserList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {
		logger.debug("updateComUserList 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {

			for (ComUserVO comUserVO : comUserList) {
				comUserVO.setSysLastChgPrgrmId(getUserId());
				comUserVO.setSysLastChgUserId(getPrgrmId());
				result += comUserService.updateComUser(comUserVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 설비, 장비 목록 조회
	@PostMapping(value = "/am/apc/selectRsrcList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRsrcList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("selectApcInfo 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		try {
			resultList = apcEvrmntStngService.selectRsrcList(comCdVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 설비 등록
	@PostMapping(value = "/am/apc/insertRsrcList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertRsrcList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("insertFcltList 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysFrstInptPrgrmId(getPrgrmId());
				comCdVO.setSysFrstInptUserId(getUserId());
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
				result =+ comCdSerivce.insertComCdDtl(comCdVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 설비 변경
	@PostMapping(value = "/am/apc/updateRsrcList", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateRsrcList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("updateFcltList 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
				result =+ comCdSerivce.updateComCdDtl(comCdVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 설비 삭제
	@PostMapping(value = "/am/apc/deleteRsrc", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteRsrc(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteFcltList 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			result = +comCdSerivce.deleteComCdDtl(comCdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}


	// APC 환경설정 - 품목
}
