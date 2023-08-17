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

import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PltBxController.java
 * @Description : 팔레트/박스 정보관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
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
public class PltBxController extends BaseController {
	@Resource(name = "pltBxService")
	private PltBxService pltBxService;


	// APC 환경설정 - 팔레트/박스 목록 조회
	@PostMapping(value = "/am/cmns/selectPltBxList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPltBxList(@RequestBody PltBxVO pltBxVO, HttpServletRequest request) throws Exception {
		logger.debug("selectPltBxList 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PltBxVO> resultList = new ArrayList<>();
		try {

			resultList = pltBxService.selectPltBxList(pltBxVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 팔레트/박스 등록
	@PostMapping(value = "/am/cmns/comparePltBx.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePltBx(@RequestBody Map<String, List<PltBxVO>> pltBxVO, HttpServletRequest request) throws Exception {
		logger.debug("comparePltBx 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			List<PltBxVO> origin = pltBxVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
			List<PltBxVO> modified = pltBxVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());

			List<PltBxVO> insertList = new ArrayList<PltBxVO>(modified).stream().filter(e -> e.getPltBxCd() == null || e.getPltBxCd().equals("")).collect(Collectors.toList());
			for (PltBxVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				pltBxService.insertPltBx(element);
			}

			List<PltBxVO> updateList = new ArrayList<PltBxVO>();
			for (PltBxVO ei : origin) {
				for (PltBxVO ej : modified) {
					if (ei.getPltBxCd().equals(ej.getPltBxCd())) {
						if (ei.hashCode() != ej.hashCode()) {
							updateList.add(ej);
						}
						break;
					}
				}
			}

			for (PltBxVO element : updateList) {
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				pltBxService.updatePltBx(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 팔레트/박스 등록
	@PostMapping(value = "/am/cmns/deletePltBx.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePltBx(@RequestBody PltBxVO pltBxVO, HttpServletRequest request) throws Exception {
		logger.debug("deletePltBx 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = pltBxService.deletePltBx(pltBxVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

//	// 원물입고 - 팔레트/박스 재고현황 조회
//	@PostMapping(value = "/am/cmns/selectPltBxMngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
//	public ResponseEntity<HashMap<String, Object>> deletePltBx(@RequestBody PltBxVO pltBxVO, HttpServletRequest request) throws Exception {
//		logger.debug("deletePltBx 호출 <><><><> ");
//
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		int result = 0;
//		try {
//			result = pltBxService.deletePltBx(pltBxVO);
//		} catch (Exception e) {
//			return getErrorResponseEntity(e);
//		}
//
//		resultMap.put("result", result);
//
//		return getSuccessResponseEntity(resultMap);
//	}
}
