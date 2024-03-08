package com.at.apcss.am.wrhs.web;

import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.wrhs.service.RawMtrWrhsMngService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsMngVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : WrhsMngController.java
 * @Description : 입고에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class RawMtrWrhsMngController extends BaseController {
	
	@Resource(name = "rawMtrWrhsMngService")
	private RawMtrWrhsMngService rawMtrWrhsMngService;

	@PostMapping(value = "/am/wrhs/insertRawMtrRePrcs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrRePrcs(@RequestBody RawMtrWrhsMngVO rawMtrWrhsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsMngVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsMngVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsMngService.insertRawMtrRePrcs(rawMtrWrhsMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/deleteRawMtrPrcs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrPrcs(@RequestBody RawMtrWrhsMngVO rawMtrWrhsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsMngVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsMngVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsMngService.deleteRawMtrPrcs(rawMtrWrhsMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/wrhs/deleteRawMtrPrcsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrPrcsList(@RequestBody RawMtrWrhsMngVO rawMtrWrhsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			rawMtrWrhsMngVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsMngVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsMngService.deleteRawMtrPrcsList(rawMtrWrhsMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/am/wrhs/insertRawMtrWrhsSmmry.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrWrhsSmmry(@RequestBody RawMtrWrhsMngVO rawMtrWrhsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsMngVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsMngVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsMngService.insertRawMtrWrhsSmmry(rawMtrWrhsMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/am/wrhs/deleteRawMtrWrhsSmmry.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsSmmry(@RequestBody RawMtrWrhsMngVO rawMtrWrhsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsMngVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsMngVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsMngService.deleteRawMtrWrhsSmmry(rawMtrWrhsMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
}
