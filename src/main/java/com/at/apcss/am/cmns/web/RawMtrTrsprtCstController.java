package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.RawMtrTrsprtCstService;
import com.at.apcss.am.cmns.vo.RawMtrTrsprtCstVO;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class RawMtrTrsprtCstController extends BaseController {

	// 원물운임비용등록
	@Resource(name = "rawMtrTrsprtCstService")
	private RawMtrTrsprtCstService rawMtrTrsprtCstService;

	// 원물운임비용등록 - 원물운임비용 목록 조회
	@PostMapping(value = "/am/cmns/selectRawMtrTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrTrsprtCstList(@RequestBody RawMtrTrsprtCstVO RawMtrTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("selectRawMtrTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrTrsprtCstVO> resultList = new ArrayList<>();
		try {
			resultList = rawMtrTrsprtCstService.selectRawMtrTrsprtCstList(RawMtrTrsprtCstVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물운임비용등록 - 원물운임비용 등록
	@PostMapping(value = "/am/cmns/insertRawMtrTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrTrsprtCstList(@RequestBody List<RawMtrTrsprtCstVO> rawMtrTrsprtCstList, HttpServletRequest request) throws Exception {
		logger.debug("insertRawMtrTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int inserted = 0;

		try {
			for (RawMtrTrsprtCstVO RawMtrTrsprtCstVO : rawMtrTrsprtCstList) {
				RawMtrTrsprtCstVO.setSysFrstInptPrgrmId(getPrgrmId());
				RawMtrTrsprtCstVO.setSysFrstInptUserId(getUserId());
				RawMtrTrsprtCstVO.setSysLastChgPrgrmId(getPrgrmId());
				RawMtrTrsprtCstVO.setSysLastChgUserId(getUserId());
				inserted =+ rawMtrTrsprtCstService.insertRawMtrTrsprtCst(RawMtrTrsprtCstVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, inserted);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물운임비용등록 - 원물운임비용 수정
	@PostMapping(value = "/am/cmns/updateRawMtrTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateRawMtrTrsprtCstList(@RequestBody List<RawMtrTrsprtCstVO> rawMtrTrsprtCstList, HttpServletRequest request) throws Exception {
		logger.debug("updateRawMtrTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int updated = 0;

		try {
			for (RawMtrTrsprtCstVO RawMtrTrsprtCstVO : rawMtrTrsprtCstList) {
				RawMtrTrsprtCstVO.setSysFrstInptPrgrmId(getPrgrmId());
				RawMtrTrsprtCstVO.setSysFrstInptUserId(getUserId());
				RawMtrTrsprtCstVO.setSysLastChgPrgrmId(getPrgrmId());
				RawMtrTrsprtCstVO.setSysLastChgUserId(getUserId());
				updated =+ rawMtrTrsprtCstService.updateRawMtrTrsprtCst(RawMtrTrsprtCstVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updated);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물운임비용등록 - 원물운임비용 삭제
	@PostMapping(value = "/am/cmns/deleteRawMtrTrsprtCst.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrTrsprtCst(@RequestBody RawMtrTrsprtCstVO RawMtrTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteRawMtrTrsprtCst 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result += rawMtrTrsprtCstService.deleteRawMtrTrsprtCst(RawMtrTrsprtCstVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물운임비용등록 - 원물운임비용 등록
	@PostMapping(value = "/am/cmns/multiTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiTrsprtCstList(@RequestBody List<RawMtrTrsprtCstVO> trsprtCstList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int inserted = 0;

		try {
			for (RawMtrTrsprtCstVO RawMtrTrsprtCstVO : trsprtCstList) {
				RawMtrTrsprtCstVO.setSysFrstInptPrgrmId(getPrgrmId());
				RawMtrTrsprtCstVO.setSysFrstInptUserId(getUserId());
				RawMtrTrsprtCstVO.setSysLastChgPrgrmId(getPrgrmId());
				RawMtrTrsprtCstVO.setSysLastChgUserId(getUserId());
				logger.debug("호출 ");
			}
			inserted = rawMtrTrsprtCstService.multiTrsprtCstList(trsprtCstList);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, inserted);

		return getSuccessResponseEntity(resultMap);
	}
}
