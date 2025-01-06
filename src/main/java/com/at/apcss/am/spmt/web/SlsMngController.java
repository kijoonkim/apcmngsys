package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.spmt.service.SlsMngService;
import com.at.apcss.am.spmt.vo.SlsMngVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.ComVO;

@Controller
public class SlsMngController extends BaseController{

	@Resource(name= "slsMngService")
	private SlsMngService slsMngService;
	
	@PostMapping(value = "/am/spmt/selectSlsPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSlsPrfmncList(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {		
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsMngVO> resultList = new ArrayList<>();
		try {
			resultList = slsMngService.selectSlsPrfmnc(slsMngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/spmt/deleteSlsPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSlsPrfmnc(@RequestBody List<SlsMngVO> slsPrfmncList, HttpServletRequest request) throws Exception {		
				
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		
		try {
			for ( SlsMngVO slsMngVO : slsPrfmncList ) {
				slsMngVO.setSysFrstInptUserId(getUserId());
				slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				slsMngVO.setSysLastChgUserId(getUserId());
				slsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			result = slsMngService.deleteSlsPrfmnc(slsPrfmncList);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/spmt/updateSlsUntprc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSlsUntprc(@RequestBody List<SlsMngVO> slsPrfmncList, HttpServletRequest request) throws Exception {		
				
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		
		try {
			for ( SlsMngVO slsMngVO : slsPrfmncList ) {
				slsMngVO.setSysFrstInptUserId(getUserId());
				slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				slsMngVO.setSysLastChgUserId(getUserId());
				slsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			result = slsMngService.updateSlsUntprc(slsPrfmncList);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);
	}
}
