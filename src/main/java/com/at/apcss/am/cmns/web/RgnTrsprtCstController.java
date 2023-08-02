package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class RgnTrsprtCstController extends BaseController {

	// 지역별운임비
	@Resource(name = "rgnTrsprtCstService")
	private RgnTrsprtCstService rgnTrsprtCstService;

	// APC 환경설정 - 지역별 운임비 목록 조회
	@PostMapping(value = "/am/cmns/selectRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("selectRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RgnTrsprtCstVO> resultList = new ArrayList<>();
		try {

			resultList = rgnTrsprtCstService.selectRgnTrsprtCstList(rgnTrsprtCstVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/cmns/compareRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRgnTrsprtCstList(@RequestBody Map<String, List<RgnTrsprtCstVO>> rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("compareRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<RgnTrsprtCstVO> origin = rgnTrsprtCstVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<RgnTrsprtCstVO> modified = rgnTrsprtCstVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<String> originPk = origin.stream().map(e -> e.getTrsprtRgnCd()).collect(Collectors.toCollection(ArrayList::new));
			List<String> modifiedPk = modified.stream().map(e -> e.getTrsprtRgnCd()).collect(Collectors.toCollection(ArrayList::new));

			List<RgnTrsprtCstVO> insertList = new ArrayList<RgnTrsprtCstVO>(modified).stream().filter(e -> (modifiedPk.contains(e.getTrsprtRgnCd()) == true && originPk.contains(e.getTrsprtRgnCd()) == false)).collect(Collectors.toList());
			for (RgnTrsprtCstVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				rgnTrsprtCstService.insertRgnTrsprtCst(element);
			}


			List<RgnTrsprtCstVO> updateList = new ArrayList<RgnTrsprtCstVO>();
			for (RgnTrsprtCstVO ei : origin) {
				for (RgnTrsprtCstVO ej : modified) {
					if (ei.getTrsprtRgnCd().equals(ej.getTrsprtRgnCd())) {
						if (ei.equals(ej) == false) {
							ej.setSysLastChgPrgrmId(getPrgrmId());
							ej.setSysLastChgUserId(getUserId());
							updateList.add(ej);
						}
						break;
					}
				}
			}

			for (RgnTrsprtCstVO element : updateList) {
				rgnTrsprtCstService.updateRgnTrsprtCst(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteRgnTrsprtCstList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = rgnTrsprtCstService.deleteRgnTrsprtCst(rgnTrsprtCstVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
