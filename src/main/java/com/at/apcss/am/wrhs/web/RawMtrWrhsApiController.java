package com.at.apcss.am.wrhs.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : RawMtrWrhsApiController.java
 * @Description : 원물입고에 대한 ApiController 클래스
 * @author 김  호
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
public class RawMtrWrhsApiController extends BaseController {

	@Resource(name = "rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;

	@Resource(name = "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	// 입고실적조회
	@PostMapping(value = "/api/mobile/am/wrhs/selectRawMtrWrhsLists.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMblRawMtrWrhsList(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsVO> resultList;
		try {
			resultList = rawMtrWrhsService.selectMblRawMtrWrhsList(rawMtrWrhsVO);
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
	// 모바일 입고실적 INSERT
	@PostMapping(value = "/api/mobile/am/wrhs/insertRawMtrWrhs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrWrhs(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

//		rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
//		rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
//		rawMtrWrhsVO.setSysLastChgUserId(getUserId());
//		rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());

		try {
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
	//모바일 입고실적 UPDATE
	@PostMapping(value = "/api/mobile/am/wrhs/updateRawMtrWrhs.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateRawMtrWrhs(@RequestBody RawMtrWrhsVO rawMtrWrhsVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

//			rawMtrWrhsVO.setSysFrstInptUserId(getUserId());
//			rawMtrWrhsVO.setSysFrstInptPrgrmId(getPrgrmId());
//			rawMtrWrhsVO.setSysLastChgUserId(getUserId());
//			rawMtrWrhsVO.setSysLastChgPrgrmId(getPrgrmId());

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
		resultMap.put(ComConstants.PROP_RESULT_MAP, rawMtrWrhsVO);
		return getSuccessResponseEntity(resultMap);
	}

	//모바일 실적정보 조회 API
	@PostMapping(value = "/api/mobile/am/wrhs/selectRawMtrWrhsLatestInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
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