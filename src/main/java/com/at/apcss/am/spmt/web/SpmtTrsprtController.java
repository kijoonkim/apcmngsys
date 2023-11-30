package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.spmt.service.SpmtTrsprtService;
import com.at.apcss.am.spmt.vo.SpmtTrsprtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtTrsprtController.java
 * @Description : 출하운송회사정보 대한 Controller 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 *      </pre>
 */
@Controller
public class SpmtTrsprtController extends BaseController {
	// 출하운송회사정보
	@Resource(name = "spmtTrsprtService")
	private SpmtTrsprtService spmtTrsprtService;

	// APC 환경설정 - 출하운송회사정보 목록 조회
	@PostMapping(value = "/am/spmt/selectSpmtTrsprtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtTrsprtList(@RequestBody SpmtTrsprtVO spmtTrsprtVO, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtTrsprtList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtTrsprtVO> resultList = new ArrayList<>();
		try {

			resultList = spmtTrsprtService.selectSpmtTrsprtList(spmtTrsprtVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/compareSpmtTrsprtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> compareSpmtTrsprtList(@RequestBody Map<String, List<SpmtTrsprtVO>> spmtTrsprtVO, HttpServletRequest request) throws Exception {
		logger.debug("compareSpmtTrsprtList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<SpmtTrsprtVO> origin = spmtTrsprtVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<SpmtTrsprtVO> modified = spmtTrsprtVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<String> originPk = origin.stream().filter(e -> e.getTrsprtCoCd() != null && e.getTrsprtCoCd().equals("") == false).map(e -> e.getTrsprtCoCd()).collect(Collectors.toCollection(ArrayList::new));
			List<String> modifiedPk = modified.stream().filter(e -> e.getTrsprtCoCd() != null && e.getTrsprtCoCd().equals("") == false).map(e -> e.getTrsprtCoCd()).collect(Collectors.toCollection(ArrayList::new));

			List<SpmtTrsprtVO> insertList = new ArrayList<SpmtTrsprtVO>(modified).stream().filter(e -> e.getTrsprtCoCd() == null || e.getTrsprtCoCd().equals("")).collect(Collectors.toList());
			for (SpmtTrsprtVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				spmtTrsprtService.insertSpmtTrsprt(element);
			}

			List<SpmtTrsprtVO> updateList = new ArrayList<SpmtTrsprtVO>();
			for (SpmtTrsprtVO ei : origin) {
				for (SpmtTrsprtVO ej : modified) {
					if (ei.getTrsprtCoCd().equals(ej.getTrsprtCoCd())) {
						if (ei.hashCode() != ej.hashCode()) {
							updateList.add(ej);
						}
						break;
					}
				}
			}

			for (SpmtTrsprtVO element : updateList) {
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				spmtTrsprtService.updateSpmtTrsprt(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteSpmtTrsprtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtTrsprtList(@RequestBody SpmtTrsprtVO spmtTrsprtVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteSpmtTrsprtList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = spmtTrsprtService.deleteSpmtTrsprt(spmtTrsprtVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 등록
	@PostMapping(value = "/am/cmns/multiSpmtTrsprtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSpmtTrsprtList(@RequestBody List<SpmtTrsprtVO> spmtTrsprtList, HttpServletRequest request) throws Exception {
		logger.debug("multiSpmtTrsprtList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtTrsprtVO> updateList = new ArrayList<SpmtTrsprtVO>();
		try {

			for (SpmtTrsprtVO spmtTrsprtVO : spmtTrsprtList) {
				spmtTrsprtVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtTrsprtVO.setSysFrstInptUserId(getPrgrmId());
				spmtTrsprtVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtTrsprtVO.setSysLastChgUserId(getUserId());
				updateList.add(spmtTrsprtVO);
			}
			HashMap<String, Object> rtnObj = spmtTrsprtService.multiSpmtTrsprt(updateList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);

	}
}
