package com.at.apcss.am.cmns.web;

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

import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class StdGrdApiController extends BaseController {

	@Resource(name = "stdGrdService")
	private StdGrdService stdGrdService;

	// APC 등급 목록 조회
	@PostMapping(value = "/am/cmns/apcGrds", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcGrdList(@RequestBody StdGrdVO stdGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdVO> resultList = new ArrayList<>();

		try {

			resultList = stdGrdService.selectStdGrdList(stdGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 표준등급종류 조회
	@PostMapping(value = "/am/cmns/apcStdGrds", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStdGrdList(@RequestBody StdGrdVO stdGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdVO> resultList = new ArrayList<>();

		try {
			resultList = stdGrdService.selectStdGrdList(stdGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 표준등급 상세 조회
	@PostMapping(value = "/am/cmns/apcStdGrdDtls", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStdGrdDtlList(@RequestBody StdGrdDtlVO stdGrdDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdDtlVO> resultList = new ArrayList<>();

		try {
			resultList = stdGrdService.selectStdGrdDtlList(stdGrdDtlVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 표준등급 상세 조회
	@PostMapping(value = "/am/cmns/apcStdGrdJgmts", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStdGrdJgmtList(@RequestBody StdGrdJgmtVO stdGrdJgmtVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdJgmtVO> resultList = new ArrayList<>();

		try {
			resultList = stdGrdService.selectStdGrdJgmtList(stdGrdJgmtVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

}
