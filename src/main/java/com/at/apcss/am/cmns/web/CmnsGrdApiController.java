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

import com.at.apcss.am.cmns.service.CmnsGrdService;
import com.at.apcss.am.cmns.vo.CmnsGrdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class CmnsGrdApiController extends BaseController {
	
	@Resource(name = "cmnsGrdService")
	private CmnsGrdService cmnsGrdService;

	// 등급 마스터 목록 조회
	@PostMapping(value = "/am/cmns/cmnsGrds", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsGrdList(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsGrdVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsGrdService.selectCmnsGrdList(cmnsGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 등급 목록 조회
	@PostMapping(value = "/am/cmns/apcGrds", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcGrdList(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsGrdVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsGrdService.selectApcGrdList(cmnsGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
