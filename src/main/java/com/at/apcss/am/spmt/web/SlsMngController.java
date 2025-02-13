package com.at.apcss.am.spmt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.type.CollectionType;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.am.spmt.service.SlsMngService;
import com.at.apcss.am.spmt.vo.SlsMngVO;
import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.ComVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class SlsMngController extends BaseController {

	@Resource(name = "slsMngService")
	private SlsMngService slsMngService;

	@PostMapping(value = "/am/spmt/selectSlsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
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

	@PostMapping(value = "/am/spmt/deleteSlsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSlsPrfmnc(@RequestBody List<SlsMngVO> slsPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;

		try {
			for (SlsMngVO slsMngVO : slsPrfmncList) {
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

	@PostMapping(value = "/am/spmt/updateSlsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateSlsPrfmnc(@RequestBody List<SlsMngVO> slsPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;

		try {
			for (SlsMngVO slsMngVO : slsPrfmncList) {
				slsMngVO.setSysFrstInptUserId(getUserId());
				slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				slsMngVO.setSysLastChgUserId(getUserId());
				slsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			result = slsMngService.updateSlsPrfmnc(slsPrfmncList);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/spmt/selectSlsUntprc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSlsUntprc(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsMngVO> resultList = new ArrayList<>();
		try {
			resultList = slsMngService.selectSlsUntprc(slsMngVO);
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


	@PostMapping(value = "/am/spmt/deleteSlsUntprc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSlsUntprc(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result;

		try {
			slsMngVO.setSysFrstInptUserId(getUserId());
			slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsMngVO.setSysLastChgUserId(getUserId());
			slsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			result = slsMngService.deleteSlsUntprc(slsMngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/spmt/updateSlsUntprcReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateSlsUntprcReg(@RequestBody List<SlsMngVO> slsUntprcList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		for (SlsMngVO slsMngVO : slsUntprcList) {
			slsMngVO.setSysFrstInptUserId(getUserId());
			slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsMngVO.setSysLastChgUserId(getUserId());
			slsMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}
		try {
			result = slsMngService.updateSlsUntprcReg(slsUntprcList);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/spmt/selectSlsUntprcDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSlsUntprcDtl(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsMngVO> resultList = new ArrayList<>();
		try {
			resultList = slsMngService.selectSlsUntprcDtl(slsMngVO);
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

	@PostMapping(value = "/am/spmt/selectSlsCrtr.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSlsCrtr(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsMngVO> resultList = new ArrayList<>();
		try {
			resultList = slsMngService.selectSlsCrtr(slsMngVO);
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

	@PostMapping(value = "/am/spmt/selectSlsCrtrDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSlsCrtrDtl(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsMngVO> resultList = new ArrayList<>();
		try {
			resultList = slsMngService.selectSlsCrtrDtl(slsMngVO);
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

	@PostMapping(value = "/am/spmt/insertSlsCrtr.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSlsCrtr(@RequestBody List<SlsMngVO> slsCrtrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		for (SlsMngVO slsMngVO : slsCrtrList) {
			slsMngVO.setSysFrstInptUserId(getUserId());
			slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsMngVO.setSysLastChgUserId(getUserId());
			slsMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		try {
			result = slsMngService.insertSlsCrtr(slsCrtrList);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/spmt/insertSlsCrtrDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSlsCrtrDtl(@RequestBody List<SlsMngVO> slsCrtrDtlList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		for (SlsMngVO slsMngVO : slsCrtrDtlList) {
			slsMngVO.setSysFrstInptUserId(getUserId());
			slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsMngVO.setSysLastChgUserId(getUserId());
			slsMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		try {
			result = slsMngService.insertSlsCrtrDtl(slsCrtrDtlList);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, result);

		return getSuccessResponseEntity(resultMap);

	}


	@PostMapping(value = "/am/spmt/deleteSlsCrtr.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSlsCrtr(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		try {
			slsMngVO.setSysFrstInptUserId(getUserId());
			slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsMngVO.setSysLastChgUserId(getUserId());
			slsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			result = slsMngService.deleteSlsCrtr(slsMngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/spmt/deleteSlsCrtrDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSlsCrtrDtl(@RequestBody SlsMngVO slsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		try {
			slsMngVO.setSysFrstInptUserId(getUserId());
			slsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsMngVO.setSysLastChgUserId(getUserId());
			slsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			result = slsMngService.deleteSlsCrtrDtl(slsMngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}
}
