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
	@PostMapping(value = "/am/cmns/updateRawMtrTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateRawMtrTrsprtCstList(@RequestBody Map<String, List<RawMtrTrsprtCstVO>> RawMtrTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("updateRawMtrTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			List<RawMtrTrsprtCstVO> origin = RawMtrTrsprtCstVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<RawMtrTrsprtCstVO> modified = RawMtrTrsprtCstVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<RawMtrTrsprtCstVO> insertList = new ArrayList<RawMtrTrsprtCstVO>(modified).stream().filter(e -> Objects.nonNull(e.getSn())).collect(Collectors.toList());
			for (RawMtrTrsprtCstVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				insertedCnt += rawMtrTrsprtCstService.insertRawMtrTrsprtCst(element);
			}

			List<RawMtrTrsprtCstVO> updateList = new ArrayList<RawMtrTrsprtCstVO>();
			for (RawMtrTrsprtCstVO ei : origin) {
				for (RawMtrTrsprtCstVO ej : modified) {
					if (ei.getSn() == ej.getSn()) {
						if (ei.hashCode() != ej.hashCode()) {
							ej.setSysLastChgPrgrmId(getPrgrmId());
							ej.setSysLastChgUserId(getUserId());
							updateList.add(ej);
						} break;
					}
				}
			}
			for (RawMtrTrsprtCstVO element : updateList) {
				insertedCnt += rawMtrTrsprtCstService.updateRawMtrTrsprtCst(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물운임비용등록 - 원물운임비용 삭제
	@PostMapping(value = "/am/cmns/deleteRawMtrTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrTrsprtCstList(@RequestBody RawMtrTrsprtCstVO RawMtrTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteRawMtrTrsprtCstList 호출 <><><><> ");

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
}
