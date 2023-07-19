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

import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class CmnsSpcfctApiController extends BaseController {
	
	@Resource(name = "cmnsSpcfctService")
	private CmnsSpcfctService cmnsSpcfctService;

	// 규격 마스터 목록 조회
	@PostMapping(value = "/am/cmns/cmnsSpcfcts", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsSpcfctList(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsSpcfctVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsSpcfctService.selectCmnsSpcfctList(cmnsSpcfctVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 규격 목록 조회
	@PostMapping(value = "/am/cmns/apcSpcfcts", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcSpcfctList(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsSpcfctVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsSpcfctService.selectApcSpcfctList(cmnsSpcfctVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
