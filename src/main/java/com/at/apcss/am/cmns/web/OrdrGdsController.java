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

import com.at.apcss.am.cmns.service.OrdrGdsService;
import com.at.apcss.am.cmns.vo.OrdrGdsVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : OrdrGdsController.java
 * @Description : 상품 정보관리에 대한 Controller 클래스
 * @author 하민우
 * @since 2023.09.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.11  하민우        최초 생성
 * </pre>
 */
@Controller
public class OrdrGdsController extends BaseController {

	@Resource(name = "ordrGdsService")
	private OrdrGdsService ordrGdsService;

	@PostMapping(value = "/am/cmns/selectOrdrGdsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOrdrGdsList(@RequestBody OrdrGdsVO ordrGdsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrGdsVO> resultList = new ArrayList<>();
		
		try {
			resultList = ordrGdsService.selectOrdrGdsList(ordrGdsVO);
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

	@PostMapping(value = "/am/cmns/multiOrdrGdsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiOrdrGdsList(@RequestBody List<OrdrGdsVO> ordrGdsList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrGdsVO> resultList = new ArrayList<>();
		
		try {
			for ( OrdrGdsVO ordrGds : ordrGdsList ) {
				ordrGds.setSysFrstInptUserId(getUserId());
				ordrGds.setSysFrstInptPrgrmId(getPrgrmId());
				ordrGds.setSysLastChgUserId(getUserId());
				ordrGds.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = ordrGdsService.multiOrdrGdsList(ordrGdsList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
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
	
	@PostMapping(value = "/am/cmns/deleteOrdrGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteOrdrGds(@RequestBody OrdrGdsVO ordrGdsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrGdsVO> resultList = new ArrayList<>();
		
		try {
			ordrGdsVO.setSysFrstInptUserId(getUserId());
			ordrGdsVO.setSysFrstInptPrgrmId(getPrgrmId());
			ordrGdsVO.setSysLastChgUserId(getUserId());
			ordrGdsVO.setSysLastChgPrgrmId(getPrgrmId());
			HashMap<String, Object> rtnObj = ordrGdsService.updateOrdrGdsForDelY(ordrGdsVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
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
