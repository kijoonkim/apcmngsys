package com.at.apcss.am.sort.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.vo.CmnsFcltAtrbVO;
import com.at.apcss.am.cmns.vo.CmnsFcltVO;
import com.at.apcss.am.sort.service.SortFcltService;
import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortBffaVO;
import com.at.apcss.am.sort.vo.SortFcltVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

/**
 * @Class Name : SortFcltController.java
 * @Description : 선별설비정보관리
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.03   박승진         최초 생성
 * </pre>
 */
@Controller
public class SortFcltController extends BaseController {

	@Resource(name = "sortFcltService")
	private SortFcltService sortFcltService;

	@PostMapping(value = "/am/sort/selectSortFcltInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncList(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortFcltVO> resultList = new ArrayList<>();

		try {
			resultList = sortFcltService.selectSortFcltInfoList(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/selectSortFcltDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortFcltDtl(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortFcltVO> resultList = new ArrayList<>();

		try {
			resultList = sortFcltService.selectSortFcltDtl(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/selectSortOprtngCrtrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortOprtngCrtrList(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortFcltVO> resultList = new ArrayList<>();

		try {
			resultList = sortFcltService.selectSortOprtngCrtrList(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 선별 설비 등록
	 * @param sortFcltVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/insertSortFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSortFclt(@RequestBody List<Object> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 선별설비 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        SortFcltVO sortfcltVO = mapper.convertValue(data.get(0), SortFcltVO.class);
        sortfcltVO.setDelYn("N");
        sortfcltVO.setSysFrstInptUserId(getUserId());
        sortfcltVO.setSysFrstInptPrgrmId(getPrgrmId());
        sortfcltVO.setSysLastChgUserId(getUserId());
        sortfcltVO.setSysLastChgPrgrmId(getPrgrmId());

		/** 계량설비 상세 propertise VO **/
        List<Map<String,Object>> cmnsFcltAtrbList = (List<Map<String, Object>>) data.get(1);
        CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, SortFcltVO.class);
        List<SortFcltVO> sortFcltDtlVOList = mapper.convertValue(cmnsFcltAtrbList, listType);

		try {
			sortfcltVO.setSysFrstInptUserId(getUserId());
			sortfcltVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortfcltVO.setSysLastChgUserId(getUserId());
			sortfcltVO.setSysLastChgPrgrmId(getPrgrmId());
			sortfcltVO.setDelYn("N");
			result = sortFcltService.insertSortFclt(sortfcltVO);

			sortFcltDtlVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = sortFcltService.insertSortFcltDtl(sortFcltDtlVOList);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 선별 설비 등록
	 * @param sortFcltVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/insertSortOprtngCrtr.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSortOprtngCrtr(@RequestBody List<SortFcltVO> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 선별설비 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        List<SortFcltVO> sortfcltVOList = data;



		try {


			sortfcltVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = sortFcltService.insertSortOprtngCrtr(sortfcltVOList);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}



	/**
	 * 선별 설비 정보 삭제
	 * @param sortFcltVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/deleteSortFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSortFclt(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			result = sortFcltService.deleteSortFclt(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 선별 설비 정보 삭제
	 * @param sortFcltVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/deleteSortFcltDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSortFcltDtl(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			result = sortFcltService.deleteSortFcltDtl(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}
	/**
	 * 가동기준관리(선별) 삭제
	 * @param sortFcltVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/deleteSortOprtngCrtr.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSortOprtngCrtr(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			result = sortFcltService.deleteSortOprtngCrtr(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/selectSortFcltOprtngPlanList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortFcltOprtngPlanList(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortFcltVO> resultList = new ArrayList<>();

		try {
			resultList = sortFcltService.selectSortFcltOprtngPlanList(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/selectSortFcltOprtngPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortFcltOprtngPrfmncList(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortFcltVO> resultList = new ArrayList<>();

		try {
			resultList = sortFcltService.selectSortFcltOprtngPrfmncList(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/insertSortFcltOprtngPlan.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSortFcltOprtngPlan(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		SortFcltVO resultList = new SortFcltVO();

		try {
			sortFcltVO.setDelYn("N");
			sortFcltVO.setSysFrstInptUserId(getUserId());
			sortFcltVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortFcltVO.setSysLastChgUserId(getUserId());
			sortFcltVO.setSysLastChgPrgrmId(getPrgrmId());
			sortFcltService.insertSortFcltOprtngPlan(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/deleteSortFcltOprtngPlan.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSortFcltOprtngPlan(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		SortFcltVO resultList = new SortFcltVO();

		try {
			sortFcltService.deleteSortFcltOprtngPlan(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/deleteSortFcltOprtngPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSortFcltOprtngPrfmnc(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		SortFcltVO resultList = new SortFcltVO();

		try {
			sortFcltService.deleteSortFcltOprtngPrfmnc(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/insertSortFcltOprtngPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSortFcltOprtngPrfmnc(@RequestBody SortFcltVO sortFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		SortFcltVO resultList = new SortFcltVO();

		try {
			sortFcltVO.setDelYn("N");
			sortFcltVO.setSysFrstInptUserId(getUserId());
			sortFcltVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortFcltVO.setSysLastChgUserId(getUserId());
			sortFcltVO.setSysLastChgPrgrmId(getPrgrmId());
			sortFcltService.insertSortFcltOprtngPrfmnc(sortFcltVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


}