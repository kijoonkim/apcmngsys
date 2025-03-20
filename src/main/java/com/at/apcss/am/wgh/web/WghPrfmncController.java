package com.at.apcss.am.wgh.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.am.wgh.vo.WghHstryVO;
import com.at.apcss.am.wgh.vo.WghInspPrfmncVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.at.apcss.am.wgh.service.WghPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : WghPrfmncController.java
 * @Description : 계량실적에 대한 Controller 클래스
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
public class WghPrfmncController extends BaseController {

	@Resource(name = "wghPrfmncService")
	private WghPrfmncService wghPrfmncService;

	/**
	 * 계량실적 목록 조회
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		WghPrfmncVO resultVO = new WghPrfmncVO();

		try {
			resultVO = wghPrfmncService.selectWghPrfmnc(wghPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 계량실적 목록 조회
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmncList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghPrfmncList(wghPrfmncVO);
		} catch (Exception e) {
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

	@PostMapping(value = "/am/wgh/insertWghPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertWghPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.insertWghPrfmnc(wghPrfmncVO);
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

	@PostMapping(value = "/am/wgh/insertWghVhclPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertWghVhclPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.insertWghVhclPrfmnc(wghPrfmncVO);
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

	@PostMapping(value = "/am/wgh/updateWghPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateWghPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.updateWghPrfmnc(wghPrfmncVO);
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

	@PostMapping(value = "/am/wgh/updateWghVhclPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateWghVhclPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.updateWghVhclPrfmnc(wghPrfmncVO);
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

	@PostMapping(value = "/am/wgh/deleteWghPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWghPrfmncList(@RequestBody List<WghPrfmncVO> wghPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( WghPrfmncVO wghPrfmncVO : wghPrfmncList ) {
				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.deleteWghPrfmncList(wghPrfmncList);
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

	@PostMapping(value = "/am/wgh/deleteWghPrfmncInspList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWghPrfmncInspList(@RequestBody HashMap<String, Object> param, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		Object wghPrfmncData = param.get("wghPrfmnc");
		Object inspListData = param.get("inspList");
		Object pltWrhsSpmtData = param.get("pltList");

		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		WghPrfmncVO wghPrfmncVO = objectMapper.convertValue(
				wghPrfmncData,
				new TypeReference<WghPrfmncVO>() {
				}
		);

		List<WghInspPrfmncVO> wghInspPrfmncVOList = objectMapper.convertValue(
				inspListData,
				new TypeReference<List<WghInspPrfmncVO>>() {
				}
		);

		List<PltWrhsSpmtVO> pltWrhsSpmtVOList = objectMapper.convertValue(
				pltWrhsSpmtData,
				new TypeReference<List<PltWrhsSpmtVO>>() {
				}
		);
		wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
		wghPrfmncVO.setSysLastChgUserId(getUserId());
		wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
		wghPrfmncVO.setSysFrstInptUserId(getUserId());

		for(PltWrhsSpmtVO vo : pltWrhsSpmtVOList){
			vo.setSysLastChgPrgrmId(getPrgrmId());
			vo.setSysLastChgUserId(getUserId());
			vo.setSysFrstInptPrgrmId(getPrgrmId());
			vo.setSysFrstInptUserId(getUserId());
		}

		try {
			HashMap<String, Object> rtnObj = wghPrfmncService.deleteWghPrfmncInspList(wghPrfmncVO, wghInspPrfmncVOList, pltWrhsSpmtVOList);

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

	/**
	 * 계량정보관리 출고 목록 조회
	 * @param WghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghInfoSpmtMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghInfoSpmtMngList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghInfoSpmtMngList(wghPrfmncVO);
		} catch (Exception e) {
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
	/**
	 * 계량정보관리 입고 목록 조회
	 * @param WghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghInfoWrhsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghInfoWrhsMngList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghInfoWrhsMngList(wghPrfmncVO);
		} catch (Exception e) {
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

	@PostMapping(value = "/am/wgh/updateStrgLoctnCdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateStrgLoctnCdList(@RequestBody List<WghPrfmncVO> wghPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {

				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.updateStrgLoctnCdList(wghPrfmncList);
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

	/**
	 * 계량접수 출고 목록 조회
	 * @param WghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghRcptSpmtList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghRcptSpmtList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghRcptSpmtList(wghPrfmncVO);
		} catch (Exception e) {
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
	/**
	 * 계량접수 출고 상세 목록 조회
	 * @param WghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghRcptSpmtDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghRcptSpmtDtlList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghRcptSpmtDtlList(wghPrfmncVO);
		} catch (Exception e) {
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
	/**
	 * 계량접수 입고 목록 조회
	 * @param WghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghRcptWrhsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghRcptWrhsList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghRcptWrhsList(wghPrfmncVO);
		} catch (Exception e) {
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
	/**
	 * 계량접수 입고 상세 목록 조회
	 * @param WghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghRcptWrhsDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghRcptWrhsDtlList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghRcptWrhsDtlList(wghPrfmncVO);
		} catch (Exception e) {
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

	/**
	 * 계량실적 다중 저장
	 * @param List<WghPrfmncVO>
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/multiWghPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiWghPrfmncList(@RequestBody List<WghPrfmncVO> wghPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {
				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.multiWghPrfmncList(wghPrfmncList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/wgh/multiWghPrfmncList0669.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiWghPrfmncList0669(@RequestBody HashMap<String, Object> param, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Object wghPrfmncListData = param.get("multiList");
		Object pltWrhsSpmtVOData = param.get("pltWrhsSpmt");
		Object wghHstryListData = param.get("wghHstryList");

		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		List<WghPrfmncVO> wghPrfmncList = objectMapper.convertValue(
				wghPrfmncListData,
				new TypeReference<List<WghPrfmncVO>>() {
				}
		);
		List<PltWrhsSpmtVO> pltWrhsSpmtList = objectMapper.convertValue(
				pltWrhsSpmtVOData,
				new TypeReference<List<PltWrhsSpmtVO>>() {
				}
		);
		List<WghHstryVO> wghHstryVOList = objectMapper.convertValue(
				wghHstryListData,
				new TypeReference<List<WghHstryVO>>() {
				}
		);

		try {
			for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {
				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
				/** 검품등급 공통정보 셋팅 **/
				List<WghInspPrfmncVO> list = wghPrfmncVO.getInspPrfmncList();
				for(WghInspPrfmncVO vo : list){
					vo.setSysFrstInptUserId(getUserId());
					vo.setSysFrstInptPrgrmId(getPrgrmId());
					vo.setSysLastChgUserId(getUserId());
					vo.setSysLastChgPrgrmId(getPrgrmId());
				}
			}
			for (PltWrhsSpmtVO pltWrhsSpmtVO : pltWrhsSpmtList) {
				pltWrhsSpmtVO.setSysFrstInptUserId(getUserId());
				pltWrhsSpmtVO.setSysFrstInptPrgrmId(getPrgrmId());
				pltWrhsSpmtVO.setSysLastChgUserId(getUserId());
				pltWrhsSpmtVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			for (WghHstryVO wghHstryVO : wghHstryVOList){
				wghHstryVO.setSysFrstInptUserId(getUserId());
				wghHstryVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghHstryVO.setSysLastChgUserId(getUserId());
				wghHstryVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.multiWghPrfmncList(wghPrfmncList, pltWrhsSpmtList, wghHstryVOList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/wgh/selectMultiWghPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMultiWghPrfmncList(@RequestBody WghPrfmncVO wghPrfmnc, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> resultList = new ArrayList<>();

		try {
			resultList = wghPrfmncService.selectMultiWghPrfmncList(wghPrfmnc);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wgh/insertWghEntrVhcl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertWghEntrVhcl(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			int rtnObj = wghPrfmncService.insertWghEntrVhcl(wghPrfmncVO);


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

	@PostMapping(value = "/am/wgh/insertWghOutVhcl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertWghOutVhcl(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			int rtnObj = wghPrfmncService.insertWghOutVhcl(wghPrfmncVO);


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

	@PostMapping(value = "/am/wgh/saveWghVhclInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> saveWghVhclInfo(@RequestBody List<WghPrfmncVO> wghPrfmncVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVOList.forEach(wghPrfmncVO ->{
				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());




			});

			wghPrfmncService.saveWghVhclInfo(wghPrfmncVOList);



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


	@PostMapping(value = "/am/wgh/selectWghEntrVhclList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghVhclList(@RequestBody WghPrfmncVO wghPrfmnc, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = wghPrfmncService.selectWghEntrVhclList(wghPrfmnc);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wgh/deleteWghEntrVhcl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWghEntrVhcl(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			int rtnObj = wghPrfmncService.deleteWghEntrVhcl(wghPrfmncVO);

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

	@PostMapping(value = "/am/wgh/deleteWghEntrVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWghEntrVhclList(@RequestBody List<WghPrfmncVO> wghPrfmncVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVOList.forEach(item ->{
				try {
					wghPrfmncService.deleteWghEntrVhcl(item);
				} catch (Exception e) {
					logger.debug(ComConstants.ERROR_CODE, e.getMessage());
				}
			});


		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wgh/selectWghInspPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghInspPrfmncList(@RequestBody WghInspPrfmncVO wghInspPrfmncVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghInspPrfmncVO> resultList = new ArrayList<>();

		try{
			resultList = wghPrfmncService.selectWghInspPrfmncList(wghInspPrfmncVO);

		} catch (Exception e) {
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

	@PostMapping(value = "/am/wgh/selectWghHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	    public ResponseEntity<HashMap<String, Object>> selectWghHstryList(@RequestBody WghHstryVO wghHstryVO, HttpServletRequest request) throws Exception {
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<WghHstryVO> resultList = new ArrayList<>();
	        try{
				resultList = wghPrfmncService.selectWghHstryList(wghHstryVO);

	        }catch (Exception e) {
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

	/**
	 * 출하실적등록(계량) - 계량목록 조회
	 * @param wghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghPrfmncListForSpmtReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmncListForSpmtReg(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghPrfmncListForSpmtReg(wghPrfmncVO);
		} catch (Exception e) {
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

	/**
	 * 출하실적등록(계량) - 계량정보 조회
	 * @param wghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghInfoForSpmtReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghInfoForSpmtReg(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghInfoForSpmtReg(wghPrfmncVO);
		} catch (Exception e) {
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

	/**
	 * 출하실적등록(계량) - 재고조회
	 * @param wghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectInvntrListForSpmtReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvntrListForSpmtReg(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectInvntrListForSpmtReg(wghPrfmncVO);
		} catch (Exception e) {
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

	/**
	 * 출하실적등록(계량) - 재고상세조회
	 * @param wghPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectInvntrDtlListForSpmtReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvntrDtlListForSpmtReg(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectInvntrDtlListForSpmtReg(wghPrfmncVO);
		} catch (Exception e) {
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

	/**
	 * 출하실적등록(계량) - 출하등록
	 * @param spmtPrfmncComVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/insertSpmtPrfmncByWgh.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncByWgh (@RequestBody SpmtPrfmncComVO spmtPrfmncComVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
			spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
			spmtPrfmncComVO.setSysLastChgUserId(getUserId());
			spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.insertSpmtPrfmncByWgh(spmtPrfmncComVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}catch (Exception e) {
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

	/**
	 * 출하실적등록(계량) - 출하취소
	 * @param SpmtPrfmncList
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/deleteSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtPrfmncList(@RequestBody List<SpmtPrfmncComVO> spmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncList) {
				spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncComVO.setSysLastChgUserId(getUserId());
				spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.deleteSpmtPrfmncList(spmtPrfmncList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
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

	/**
	 * 계량정보관리 - 계량정보상세 출고 저장
	 * @param List<WghPrfmncVO>
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/updateWghInfoDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateWghInfoDtlList(@RequestBody List<WghPrfmncVO> wghPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for (WghPrfmncVO wghPrfmncVO : wghPrfmncList) {
				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.updateWghInfoDtlList(wghPrfmncList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
}
