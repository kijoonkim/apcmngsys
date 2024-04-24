package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.sort.vo.SortBffaGrdVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class CmnsItemApiController extends BaseController {
	
	@Resource(name = "cmnsItemService")
	private CmnsItemService cmnsItemService;
	
	// APC 품목 목록 조회
	@PostMapping(value = "/am/cmns/apcItems", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcCmnsItemList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();
		
		try {
			resultList = cmnsItemService.selectApcCmnsItemList(cmnsItemVO);
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
	// APC기준정보 품목 업데이트
	@PostMapping(value = "/am/cmns/updateItemList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateItemList(@RequestBody List<CmnsItemVO> cmnsItemList, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			for (CmnsItemVO cmnsItemVO : cmnsItemList) {
				cmnsItemVO.setSysLastChgPrgrmId(getPrgrmId());
				cmnsItemVO.setSysLastChgUserId(getUserId());
			}
			
			HashMap<String, Object> rtnObj = cmnsItemService.updateItemList(cmnsItemList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/cmns/apcBffaType", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcBffaTypeList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComCdVO> resultList = new ArrayList<>();

		try {
			resultList = cmnsItemService.selectApcBffaTypeList(cmnsItemVO);
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
	@PostMapping(value = "/am/cmns/apcBffaTypeList", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcBffaGrdDtlList(@RequestBody SortBffaGrdVO sortBffaGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SortBffaGrdVO> resultList = new ArrayList<>();

		try {
			resultList = cmnsItemService.selectApcBffaGrdDtlList(sortBffaGrdVO);
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
}
