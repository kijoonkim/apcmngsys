package com.at.apcss.am.wrhs.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.ComRawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsSmmryVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : RawMtrWrhsController.java
 * @Description : 원물입고에 대한 Controller 클래스
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
public class RawMtrWrhsController extends BaseController {

	@Resource(name = "rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;

	@Resource(name = "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;
	
	@PostMapping(value = "/am/wrhs/insertRawMtrWrhs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrWrhs(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);
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
		resultMap.put(ComConstants.PROP_RESULT_MAP, rawMtrWrhsVO);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/updateRawMtrWrhs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateRawMtrWrhs(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsService.updateRawMtrWrhs(rawMtrWrhsVO);
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

	@PostMapping(value = "/am/wrhs/deleteRawMtrWrhs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhs(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsService.deleteRawMtrWrhs(rawMtrWrhsVO);
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

	@PostMapping(value = "/am/wrhs/deleteRawMtrWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsList(@RequestBody List<RawMtrWrhsVO> rawMtrWrhsList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( RawMtrWrhsVO rawMtrWrhsVO : rawMtrWrhsList ) {
				rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
				rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrWrhsVO.setSysLastChgUserId(getUserId());
				rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = rawMtrWrhsService.deleteRawMtrWrhsList(rawMtrWrhsList);
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

	@PostMapping(value = "/am/wrhs/insertRawMtrWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrWrhsList(@RequestBody List<RawMtrWrhsVO> rawMtrWrhsList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( RawMtrWrhsVO rawMtrWrhsVO : rawMtrWrhsList ) {
				rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
				rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrWrhsVO.setSysLastChgUserId(getUserId());
				rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = rawMtrWrhsService.insertRawMtrWrhsList(rawMtrWrhsList);
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

	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsList(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsVO> resultList;
		try {
			resultList = rawMtrWrhsService.selectRawMtrWrhsList(rawMtrWrhsVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
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

	@PostMapping(value = "/am/wrhs/selectDsctnTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDsctnTotList(@RequestBody RawMtrWrhsDsctnTotVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsDsctnTotVO> resultList;
		try {
			resultList = rawMtrWrhsService.selectDsctnTotList(rawMtrWrhsVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
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

	@PostMapping(value = "/am/wrhs/selectComDsctnTotList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectComDsctnTotList(@RequestBody ComRawMtrWrhsDsctnTotVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComRawMtrWrhsDsctnTotVO> resultList;
		try {
			resultList = rawMtrWrhsService.selectComDsctnTotList(rawMtrWrhsVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
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

	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsPrfmncList(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsVO> resultList;
		try {
			resultList = rawMtrWrhsService.selectRawMtrWrhsPrfmncList(rawMtrWrhsVO);
		} catch (Exception e) {
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
	
	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsSmmryTotalList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsSmmryTotalList(@RequestBody RawMtrWrhsSmmryVO rawMtrWrhsSmmryVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsSmmryVO> resultList;
		List<CmnsVrtyVO> vrtyList;
		try {
			resultList = rawMtrWrhsService.selectRawMtrWrhsSmmryTotalList(rawMtrWrhsSmmryVO);
			
			CmnsVrtyVO vrtyParamVO = new CmnsVrtyVO();
			vrtyParamVO.setApcCd(rawMtrWrhsSmmryVO.getApcCd());
			vrtyParamVO.setItemCd(rawMtrWrhsSmmryVO.getItemCd());
			vrtyList = cmnsVrtyService.selectApcVrtyList(vrtyParamVO);
			
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(AmConstants.PROP_VRTY_LIST, vrtyList);
		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsLatestInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsLatestInfoList(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsVO> resultList;
		try {
			resultList = rawMtrWrhsService.selectRawMtrWrhsLatestInfoList(rawMtrWrhsVO);
		} catch (Exception e) {
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
