package com.at.apcss.am.trnsf.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.trnsf.service.InvntrMngService;
import com.at.apcss.am.trnsf.vo.InvntrMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class InvntrMngController extends BaseController {

	@Resource
	(name="invntrMngService")
	private InvntrMngService invntrMngService;
	
	@PostMapping(value = "/am/trnsf/selectInvntrCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrCrtr (@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = invntrMngService.selectInvntrCrtr(invntrMngVO);
		resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/trnsf/insertInvntrCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertInvntrCrtr (@RequestBody List<InvntrMngVO> invntrCrtrList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		try {
			for( InvntrMngVO invntrMngVO : invntrCrtrList) {
				invntrMngVO.setSysFrstInptUserId(getUserId());
				invntrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			result =invntrMngService.insertInvntrCrtr(invntrCrtrList);
		}catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST,result);
		
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/deleteInvntrCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteInvntrCrtr (@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		try {
			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			result =invntrMngService.deleteInvntrCrtr(invntrMngVO);
		}catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST,result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/selectInvntrCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrCrtrDtl (@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = invntrMngService.selectInvntrCrtrDtl(invntrMngVO);
		resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/insertInvntrCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertInvntrCrtrDtl (@RequestBody List<InvntrMngVO> invntrCrtrList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		try {
			for( InvntrMngVO invntrMngVO : invntrCrtrList) {
				invntrMngVO.setSysFrstInptUserId(getUserId());
				invntrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			result =invntrMngService.insertInvntrCrtrDtl(invntrCrtrList);
		}catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST,result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/deleteInvntrCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteInvntrCrtrDtl (@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		try {
			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			result =invntrMngService.deleteInvntrCrtrDtl(invntrMngVO);
		}catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST,result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/selectInvntrApcBss.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrApcBss (@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = invntrMngService.selectInvntrApcBss(invntrMngVO);
		resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/insertInvntrApcBss.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertInvntrApcBss (@RequestBody List<InvntrMngVO> bssInvntrList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		try {
			for( InvntrMngVO invntrMngVO : bssInvntrList) {
				invntrMngVO.setSysFrstInptUserId(getUserId());
				invntrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			result =invntrMngService.insertInvntrApcBss(bssInvntrList);
		}catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST,result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/deleteInvntrApcBss.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteInvntrApcBss (@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;
		try {
			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			result =invntrMngService.deleteInvntrApcBss(invntrMngVO);
		}catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST,result);

		return getSuccessResponseEntity(resultMap);
	}

}
