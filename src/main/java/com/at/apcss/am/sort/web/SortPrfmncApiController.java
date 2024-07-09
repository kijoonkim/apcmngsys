package com.at.apcss.am.sort.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortPrfmncApiController.java
 * @Description : 선별실적정보관리에 대한 ApiController 클래스
 * @author 김   호
 * @since 2024.04.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.11  김  호        최초 생성
 * </pre>
 */
@RestController
public class SortPrfmncApiController extends BaseController {

	@Resource(name = "sortPrfmncService")
	private SortPrfmncService sortPrfmncService;

	@Resource(name = "sortMngService")
	private SortMngService sortMngService;

	// 모바일 선별실적조회 API
	@PostMapping(value = "/api/mobile/am/sort/selectSortPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortPrfmncList(sortPrfmncVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	//모바일 선별실적 INSERT
	@PostMapping(value = "/api/mobile/am/sort/insertSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmnc(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
//			sortMngVO.setSysFrstInptUserId(getUserId());
//			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
//			sortMngVO.setSysLastChgUserId(getUserId());
//			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

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
		resultMap.put(ComConstants.PROP_RESULT_MAP, sortMngVO);
		return getSuccessResponseEntity(resultMap);
	}

	//모바일 선별실적 UPDATE
	@PostMapping(value = "/api/mobile/am/sort/updateSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSortPrfmnc(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
//			sortMngVO.setSysFrstInptUserId(getUserId());
//			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
//			sortMngVO.setSysLastChgUserId(getUserId());
//			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());

			sortMngVO.setNeedsInptRegYn(ComConstants.CON_YES);	// 투입실적 자동등록

			HashMap<String, Object> rtnObj = sortMngService.updateSortPrfmnc(sortMngVO);
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
		resultMap.put(ComConstants.PROP_RESULT_MAP, sortMngVO);
		return getSuccessResponseEntity(resultMap);
	}

	//모바일 선별실적정보 조회 API
	@PostMapping(value = "/api/mobile/am/sort/selectSortRsltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortRsltList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortListBySortno(sortPrfmncVO);
		} catch(Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
