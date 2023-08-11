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

import com.at.apcss.am.cmns.service.DdlnService;
import com.at.apcss.am.cmns.vo.DdlnVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : DdlnController.java
 * @Description : 마감 정보관리에 대한 Controller 클래스
 * @author 하민우
 * @since 2023.08.10
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.10  하민우        최초 생성
 *      </pre>
 */
@Controller
public class DdlnController extends BaseController {
	// 차량정보
	@Resource(name = "DdlnService")
	private DdlnService DdlnService;

	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectDdln.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDdln(@RequestBody DdlnVO DdlnVO, HttpServletRequest request) throws Exception {
		logger.debug("selectDdln 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DdlnVO> resultList = new ArrayList<>();
		try {

			resultList = DdlnService.selectDdln(DdlnVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

//	@PostMapping(value = "/am/cmns/compareWrhsVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
//	public ResponseEntity<HashMap<String, Object>> compareWrhsVhclList(@RequestBody Map<String, List<DdlnVO>> DdlnVO, HttpServletRequest request) throws Exception {
//		logger.debug("compareWrhsVhclList 호출 <><><><> ");
//
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//
//		int insertCnt = 0;
//		try {
//			List<DdlnVO> origin = DdlnVO.get("origin").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
//			List<DdlnVO> modified = DdlnVO.get("modified").stream().filter(e -> e.getDelYn().equals("N")).collect(Collectors.toList());
//
//			List<String> originPk = origin.stream().map(e -> e.getVhclno()).collect(Collectors.toCollection(ArrayList::new));
//			List<String> modifiedPk = modified.stream().map(e -> e.getVhclno()).collect(Collectors.toCollection(ArrayList::new));
//
//			List<DdlnVO> insertList = new ArrayList<DdlnVO>(modified).stream().filter(e -> (modifiedPk.contains(e.getVhclno()) == true && originPk.contains(e.getVhclno()) == false)).collect(Collectors.toList());
//			for (DdlnVO element : insertList) {
//				element.setSysFrstInptPrgrmId(getPrgrmId());
//				element.setSysFrstInptUserId(getUserId());
//				element.setSysLastChgPrgrmId(getPrgrmId());
//				element.setSysLastChgUserId(getUserId());
//				DdlnService.insertDdln(element);
//			}
//
//			List<DdlnVO> updateList = new ArrayList<DdlnVO>();
//			for (DdlnVO ei : origin) {
//				for (DdlnVO ej : modified) {
//					if (ei.getVhclno().equals(ej.getVhclno())) {
//						if (ei.equals(ej) == false) {
//							ej.setSysLastChgPrgrmId(getPrgrmId());
//							ej.setSysLastChgUserId(getUserId());
//							updateList.add(ej);
//						}
//						break;
//					}
//				}
//			}
//
//			for (DdlnVO element : updateList) {
//				DdlnService.updateDdln(element);
//			}
//		} catch (Exception e) {
//			return getErrorResponseEntity(e);
//		}
//
//		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);
//
//		return getSuccessResponseEntity(resultMap);
//	}

	@PostMapping(value = "/am/cmns/insertDdln.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertDdln(@RequestBody List<DdlnVO> ddlnList, HttpServletRequest request) throws Exception {
		logger.debug("insertDdln 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int inserted = 0;

		try {
			for (DdlnVO DdlnVO : ddlnList) {
				DdlnVO.setSysFrstInptPrgrmId(getPrgrmId());
				DdlnVO.setSysFrstInptUserId(getUserId());
				DdlnVO.setSysLastChgPrgrmId(getPrgrmId());
				DdlnVO.setSysLastChgUserId(getUserId());
				inserted += DdlnService.insertDdln(DdlnVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, inserted);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/updateDdln.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateDdln(@RequestBody List<DdlnVO> ddlnList, HttpServletRequest request) throws Exception {
		logger.debug("updateDdln 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int updated = 0;

		try {
			for (DdlnVO DdlnVO : ddlnList) {
				DdlnVO.setSysFrstInptPrgrmId(getPrgrmId());
				DdlnVO.setSysFrstInptUserId(getUserId());
				DdlnVO.setSysLastChgPrgrmId(getPrgrmId());
				DdlnVO.setSysLastChgUserId(getUserId());
				updated += DdlnService.updateDdln(DdlnVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updated);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/cmns/multiDdlnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiDdlnList(@RequestBody List<DdlnVO> ddlnList, HttpServletRequest request) throws Exception {
		logger.debug("multiDdlnList 호출 <><><><> ");
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DdlnVO> updateList = new ArrayList<DdlnVO>();
		try {
			for ( DdlnVO DdlnVO : ddlnList ) {
				DdlnVO.setSysFrstInptUserId(getUserId());
				DdlnVO.setSysFrstInptPrgrmId(getPrgrmId());
				DdlnVO.setSysLastChgUserId(getUserId());
				DdlnVO.setSysLastChgPrgrmId(getPrgrmId());
				updateList.add(DdlnVO);
			}
			
			HashMap<String, Object> rtnObj = DdlnService.multiDdlnList(updateList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteDdln.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteDdln(@RequestBody DdlnVO DdlnVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteDdln 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = DdlnService.deleteDdln(DdlnVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
