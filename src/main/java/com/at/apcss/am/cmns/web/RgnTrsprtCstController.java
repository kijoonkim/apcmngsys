package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class RgnTrsprtCstController extends BaseController {

	// 지역별운임비
	@Resource(name = "rgnTrsprtCstService")
	private RgnTrsprtCstService rgnTrsprtCstService;

	// APC 환경설정 - 지역별 운임비 목록 조회
	@PostMapping(value = "/am/cmns/selectRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("selectRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RgnTrsprtCstVO> resultList = new ArrayList<>();
		try {

			resultList = rgnTrsprtCstService.selectRgnTrsprtCstList(rgnTrsprtCstVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// 원물운임비용등록팝업 - 지역별 운임비 조회
	@PostMapping(value = "/am/cmns/selectRawMtrTrsprtCst.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrTrsprtCst(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("selectRawMtrTrsprtCst 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		RgnTrsprtCstVO resultVO = new RgnTrsprtCstVO();
		try {
			resultVO = rgnTrsprtCstService.selectRawMtrTrsprtCst(rgnTrsprtCstVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = rgnTrsprtCstService.deleteRgnTrsprtCst(rgnTrsprtCstVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/multiRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiRgnTrsprtCstList(@RequestBody List<RgnTrsprtCstVO> vhclList, HttpServletRequest request) throws Exception {
		logger.debug("multiRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RgnTrsprtCstVO> updateList = new ArrayList<RgnTrsprtCstVO>();
		try {
			for (RgnTrsprtCstVO rgnTrsprtCstVO : vhclList) {
				rgnTrsprtCstVO.setSysFrstInptUserId(getUserId());
				rgnTrsprtCstVO.setSysFrstInptPrgrmId(getPrgrmId());
				rgnTrsprtCstVO.setSysLastChgUserId(getUserId());
				rgnTrsprtCstVO.setSysLastChgPrgrmId(getPrgrmId());
				updateList.add(rgnTrsprtCstVO);
			}

			HashMap<String, Object> rtnObj = rgnTrsprtCstService.multiRgnTrsprtCst(updateList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
}
