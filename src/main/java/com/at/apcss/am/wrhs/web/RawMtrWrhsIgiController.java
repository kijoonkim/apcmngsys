package com.at.apcss.am.wrhs.web;


import com.at.apcss.am.wrhs.service.RawMtrWrhsIgiService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrWrhsIgiController.java
 * @Description : 검수 대한 Controller 클래스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
@Controller
public class RawMtrWrhsIgiController extends BaseController {
	
	@Resource(name = "rawMtrWrhsIgiService")
	private RawMtrWrhsIgiService rawMtrWrhsIgiService;

	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsIgiList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsIgiList(@RequestBody RawMtrWrhsIgiVO rawMtrWrhsIgiVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<RawMtrWrhsIgiVO> resultList;
		try {
			resultList = rawMtrWrhsIgiService.selectRawMtrWrhsIgiList(rawMtrWrhsIgiVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
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

	@PostMapping(value = "/am/wrhs/multiRawMtrWrhsIgiList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiRawMtrWrhsIgiList(@RequestBody List<RawMtrWrhsIgiVO> rawMtrWrhsIgiList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (RawMtrWrhsIgiVO rawMtrWrhsIgiVO : rawMtrWrhsIgiList) {

				rawMtrWrhsIgiVO.setSysFrstInptUserId(getUserId());
				rawMtrWrhsIgiVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrWrhsIgiVO.setSysLastChgUserId(getUserId());
				rawMtrWrhsIgiVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiRawMtrWrhsIgiList(rawMtrWrhsIgiList);
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

	@PostMapping(value = "/am/wrhs/deleteRawMtrWrhsIgi.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsIgi(@RequestBody RawMtrWrhsIgiVO rawMtrWrhsIgiVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsIgiVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsIgiVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsIgiVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsIgiVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteRawMtrWrhsIgi(rawMtrWrhsIgiVO);
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
