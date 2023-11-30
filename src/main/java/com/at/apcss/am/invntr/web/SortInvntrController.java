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

import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortInvntrController.java
 * @Description : 선별재고관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.23  김현호        최초 생성
 * </pre>
 */
@Controller
public class SortInvntrController extends BaseController {
	@Resource(name = "sortInvntrService")
	private SortInvntrService sortInvntrService;

	@PostMapping(value = "/am/invntr/selectSortInvntrDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSortInvntrDsctnList(@RequestBody SortInvntrVO sortInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SortInvntrVO> resultList =  new ArrayList<>();
		try {

			resultList = sortInvntrService.selectSortInvntrDsctnList(sortInvntrVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/invntr/selectSortInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSortInvntrList(@RequestBody SortInvntrVO sortInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SortInvntrVO> resultList =  new ArrayList<>();
		try {
			resultList = sortInvntrService.selectSortInvntrList(sortInvntrVO);
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/invntr/selectDailySortInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDailySortInvntrList(@RequestBody SortInvntrVO sortInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SortInvntrVO> resultList =  new ArrayList<>();
		try {
			resultList = sortInvntrService.selectDailySortInvntrList(sortInvntrVO);
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/invntr/multiSaveSortInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveSortInvntrList(@RequestBody List<SortInvntrVO> sortInvntrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( SortInvntrVO sortInvntrVO : sortInvntrList ) {
				sortInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
				sortInvntrVO.setSysFrstInptUserId(getUserId());
				sortInvntrVO.setSysLastChgUserId(getUserId());
				sortInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = sortInvntrService.multiSaveSortInvntrList(sortInvntrList);
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
