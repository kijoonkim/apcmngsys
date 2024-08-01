package com.at.apcss.am.sort.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class SortMngApiController  extends BaseController {

	@Resource(name = "sortMngService")
	private SortMngService sortMngService;
	

	@PostMapping(value = "/api/mobile/am/sort/insertSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmnc(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
//			sortMngVO.setSysFrstInptUserId(getUserId());
//			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
//			sortMngVO.setSysLastChgUserId(getUserId());
//			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());
//
//			sortMngVO.setNeedsInptRegYn(ComConstants.CON_YES);	// 투입실적 자동등록

			HashMap<String, Object> rtnObj = sortMngService.insertSortPrfmnc(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, sortMngVO);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/api/mobile/am/sort/updateSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSortPrfmnc(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
//			sortMngVO.setSysFrstInptUserId(getUserId());
//			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
//			sortMngVO.setSysLastChgUserId(getUserId());
//			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());
//
//			sortMngVO.setNeedsInptRegYn(ComConstants.CON_YES);	// 투입실적 자동등록

			HashMap<String, Object> rtnObj = sortMngService.updateSortPrfmnc(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, sortMngVO);
		return getSuccessResponseEntity(resultMap);
	}
}
