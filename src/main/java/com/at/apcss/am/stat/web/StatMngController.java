package com.at.apcss.am.stat.web;

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

import com.at.apcss.am.stat.service.StatMngService;
import com.at.apcss.am.stat.vo.StatMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

/**
 * @Class Name : statController.java
 * @Description : 집계정보관리
 * @author 박승진
 * @since 2024.10.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.23   박승진         최초 생성
 * </pre>
 */
@Controller
public class StatMngController extends BaseController {

	@Resource(name = "statMngService")
	private StatMngService statMngService;

	@PostMapping(value = "/am/stat/insertStatCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertAsstMtrCrtrInfoList(@RequestBody List<Object> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 집계기준 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        StatMngVO statMngVO = mapper.convertValue(data.get(0), StatMngVO.class);
        statMngVO.setDelYn("N");
        statMngVO.setSysFrstInptUserId(getUserId());
        statMngVO.setSysFrstInptPrgrmId(getPrgrmId());
        statMngVO.setSysLastChgUserId(getUserId());
        statMngVO.setSysLastChgPrgrmId(getPrgrmId());

		/** 집계기준 상세 propertise VO **/
        List<Map<String,Object>> cmnsStatCrtrList = (List<Map<String, Object>>) data.get(1);
        CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, StatMngVO.class);
        List<StatMngVO> statMngDtlVOList = mapper.convertValue(cmnsStatCrtrList, listType);

		try {
			statMngVO.setSysFrstInptUserId(getUserId());
			statMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			statMngVO.setSysLastChgUserId(getUserId());
			statMngVO.setSysLastChgPrgrmId(getPrgrmId());
			statMngVO.setDelYn("N");
			result = statMngService.insertStatCrtrInfo(statMngVO);

			statMngDtlVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = statMngService.insertStatCrtrDtlInfo(statMngDtlVOList);

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

	@PostMapping(value = "/am/stat/selectStatCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectStatCrtrInfoList(@RequestBody StatMngVO StatMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<StatMngVO> resultList = new ArrayList<>();
		List<StatMngVO> resultList2 = new ArrayList<>();

		try {
			resultList = statMngService.selectStatCrtrInfoList(StatMngVO);
			resultList2 = statMngService.selectStatCrtrInfoDtlList(StatMngVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultList1", resultList);
		resultMap.put("resultList2", resultList2);


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/stat/selectStatCrtrInfoDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectStatCrtrInfoDtlList(@RequestBody StatMngVO StatMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<StatMngVO> resultList = new ArrayList<>();

		try {
			resultList = statMngService.selectStatCrtrInfoDtlList(StatMngVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/stat/deleteStatMngInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteStatMngInfo(@RequestBody StatMngVO statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {

			result = statMngService.deleteStatCrtrInfo(statMngVO);

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

	@PostMapping(value = "/am/stat/selectPrdWrhsStatInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdWrhsStatInfo(@RequestBody HashMap<String,Object> statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdWrhsStatInfo(statMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}



	@PostMapping(value = "/am/stat/selectPrdInptPrfmncStatInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdInptPrfmncStatInfo(@RequestBody HashMap<String,Object> statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdInptPrfmncStatInfo(statMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/stat/selectPrdPrdctnPrfmncStatInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdPrdctnPrfmncStatInfo(@RequestBody HashMap<String,Object> statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdPrdctnPrfmncStatInfo(statMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/stat/selectPrdSpmtPrfmncStatInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdSpmtPrfmncStatInfo(@RequestBody HashMap<String,Object> statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdSpmtPrfmncStatInfo(statMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}@PostMapping(value = "/am/stat/selectPrdPrdctnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdPrdctnInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdPrdctnInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/stat/selectPrdSpmtInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdSpmtInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdSpmtInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/stat/selectPrdWrhsInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdWrhsInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdWrhsInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/stat/selectPrdInptInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdInptInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = statMngService.selectPrdInptInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}



}