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

import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
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
public class CmnsGdsController extends BaseController {

	@Resource(name = "cmnsGdsService")
	private CmnsGdsService cmnsGdsService;


	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsGdsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsGdsList(@RequestBody CmnsGdsVO cmnsGdsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsGdsVO> resultList = new ArrayList<>();
		try {
			resultList = cmnsGdsService.selectCmnsGdsList(cmnsGdsVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/insertCmnsGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCmnsGds(@RequestBody List<CmnsGdsVO> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			for ( CmnsGdsVO cmnsGdsVO : insertList ) {
				cmnsGdsVO.setSysFrstInptUserId(getUserId());
				cmnsGdsVO.setSysFrstInptPrgrmId(getPrgrmId());
				cmnsGdsVO.setSysLastChgUserId(getUserId());
				cmnsGdsVO.setSysLastChgPrgrmId(getPrgrmId());
				insertedCnt += cmnsGdsService.insertCmnsGds(cmnsGdsVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/updateCmnsGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateCmnsGds(@RequestBody List<CmnsGdsVO> updateList, HttpServletRequest request) throws Exception {

		int updatedCnt = 0;
		try {
			for ( CmnsGdsVO cmnsGdsVO : updateList ) {
				cmnsGdsVO.setSysLastChgUserId(getUserId());
				cmnsGdsVO.setSysLastChgPrgrmId(getPrgrmId());
				updatedCnt += cmnsGdsService.updateCmnsGds(cmnsGdsVO);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteCmnsGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCmnsGds(@RequestBody CmnsGdsVO cmnsGdsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = cmnsGdsService.deleteCmnsGds(cmnsGdsVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
