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

import com.at.apcss.am.cmns.service.GdsService;
import com.at.apcss.am.cmns.vo.GdsVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CnptController.java
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
public class GdsController extends BaseController {

	@Resource(name = "gdsService")
	private GdsService gdsService;


	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectGdsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGdsList(@RequestBody GdsVO gdsVO, HttpServletRequest request) throws Exception {
		logger.debug("selectGdsList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GdsVO> resultList = new ArrayList<>();
		try {
			resultList = gdsService.selectGdsList(gdsVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/insertGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertGds(@RequestBody List<GdsVO> insertList, HttpServletRequest request) throws Exception {
		logger.debug("insertGds 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			for (GdsVO gdsVO : insertList) {
				gdsVO.setSysLastChgPrgrmId(getUserId());
				gdsVO.setSysLastChgUserId(getPrgrmId());
				gdsVO.setSysFrstInptPrgrmId(getUserId());
				gdsVO.setSysFrstInptUserId(getPrgrmId());
				insertedCnt += gdsService.insertGds(gdsVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/updateGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateGds(@RequestBody List<GdsVO> updateList, HttpServletRequest request) throws Exception {
		logger.debug("updateGds 호출 <><><><> ");

		logger.debug("size >>>>  {} ", updateList.size());
		int updatedCnt = 0;
		try {
			for (GdsVO gdsVO : updateList) {
				gdsVO.setSysLastChgPrgrmId(getPrgrmId());
				gdsVO.setSysLastChgUserId(getUserId());
				updatedCnt += gdsService.updateGds(gdsVO);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePltBx(@RequestBody GdsVO gdsVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteGds 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = gdsService.deleteGds(gdsVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
