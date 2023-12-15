package com.at.apcss.am.sort.web;

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

import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortPrfmncController.java
 * @Description : 선별실적정보관리에 대한 Controller 클래스
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
public class SortMngController extends BaseController {

	@Resource(name = "sortMngService")
	private SortMngService sortMngService;

	@Resource(name = "sortPrfmncService")
	private SortPrfmncService sortPrfmncService;


	@PostMapping(value = "/am/sort/insertSortInpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortInpt(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = sortMngService.insertSortInpt(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/deleteSortInpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSortInpt(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = sortMngService.deleteSortInpt(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/sort/insertImportSortRslt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertImportSortRslt(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = sortMngService.insertImportSortRslt(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/insertSortRslt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortRslt(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = sortMngService.insertSortRslt(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/sort/insertSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmnc(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			sortMngVO.setNeedsInptRegYn(ComConstants.CON_YES);	// 투입실적 자동등록

			HashMap<String, Object> rtnObj = sortMngService.insertSortPrfmnc(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/deleteSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSortPrfmnc(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = sortMngService.deleteSortPrfmnc(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}



	@PostMapping(value = "/am/sort/sortPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUserList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		logger.debug("param info {}", sortPrfmncVO.toString());

		try {
			resultList = sortPrfmncService.selectSortPrfmncList(sortPrfmncVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
