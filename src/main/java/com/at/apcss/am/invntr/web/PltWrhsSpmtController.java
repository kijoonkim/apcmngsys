package com.at.apcss.am.invntr.web;

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

import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.am.invntr.service.PltWrhsSpmtService;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PltWrhsSpmtController.java
 * @Description : 팔레트입출고관리 대한 Controller 클래스
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
public class PltWrhsSpmtController extends BaseController {
	@Resource(name = "pltWrhsSpmtService")
	private PltWrhsSpmtService pltWrhsSpmtService;

	// 원물입고 - 원물 팔레트/박스 재고 목록 조회
	@PostMapping(value = "/am/cmns/selectPltBxMngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPltBxMngList(@RequestBody PltBxVO pltBxVO, HttpServletRequest request) throws Exception {
		logger.debug("selectPltBxMngList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PltBxVO> resultList = new ArrayList<>();
		try {

			resultList = pltWrhsSpmtService.selectPltBxMngList(pltBxVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물입고 - 원물 팔레트/박스 입출 등록
	@PostMapping(value = "/am/cmns/insertPltWrhsSpmt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertPltWrhsSpmt(@RequestBody PltWrhsSpmtVO pltWrhsSpmtVO, HttpServletRequest request) throws Exception {
		logger.debug("insertPltWrhsSpmt 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			pltWrhsSpmtVO.setSysLastChgPrgrmId(getUserId());
			pltWrhsSpmtVO.setSysLastChgUserId(getPrgrmId());
			pltWrhsSpmtVO.setSysFrstInptPrgrmId(getUserId());
			pltWrhsSpmtVO.setSysFrstInptUserId(getPrgrmId());
			insertedCnt += pltWrhsSpmtService.insertPltWrhsSpmt(pltWrhsSpmtVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 원물입고 - 원물 팔레트/박스 입출 목록 조회
	@PostMapping(value = "/am/cmns/selectPltWrhsSpmtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPltWrhsSpmtList(@RequestBody PltWrhsSpmtVO pltWrhsSpmtVO, HttpServletRequest request) throws Exception {
		logger.debug("selectPltBxMngList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PltWrhsSpmtVO> resultList = new ArrayList<>();
		try {

			resultList = pltWrhsSpmtService.selectPltWrhsSpmtList(pltWrhsSpmtVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/cmns/updateDelYnPltWrhsSpmt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateDelYnPltWrhsSpmt(@RequestBody List<PltWrhsSpmtVO> deleteList, HttpServletRequest request) throws Exception {
		logger.debug("updateDelYnPltWrhsSpmt 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {
			for (PltWrhsSpmtVO pltWrhsSpmtVO : deleteList) {
				pltWrhsSpmtVO.setSysLastChgPrgrmId(getUserId());
				pltWrhsSpmtVO.setSysLastChgUserId(getPrgrmId());
				pltWrhsSpmtVO.setSysFrstInptPrgrmId(getUserId());
				pltWrhsSpmtVO.setSysFrstInptUserId(getPrgrmId());
				deletedCnt += pltWrhsSpmtService.updateDelYnPltWrhsSpmt(pltWrhsSpmtVO);
			}
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
