package com.at.apcss.fm.wrhs.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.wrhs.service.RawMtrWrhsPrnmntService;
import com.at.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;

/**
 * @Class Name : RawMtrWrhsPrnmntController.java
 * @Description : 원물예정입고 대한 Controller 클래스
 * @author 김호
 * @since 2024.12.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.23  김호        최초 생성
 * </pre>
 */
@Controller
public class RawMtrWrhsPrnmntController extends BaseController {

	@Resource(name = "rawMtrWrhsPrnmntService")
	private RawMtrWrhsPrnmntService rawMtrWrhsPrnmntService;

	/**
	 * 입고예정 목록 조회
	 * @param RawMtrWrhsPrnmntVO
	 * @param request
	 * @return List<RawMtrWrhsPrnmntVO>
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/wrhs/selectRawMtrWrhsPrnmntList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsPrnmntList(@RequestBody RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsPrnmntVO> resultList;
		try {
			resultList = rawMtrWrhsPrnmntService.selectRawMtrWrhsPrnmntList(rawMtrWrhsPrnmntVO);


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
	 * 입고예정 저장
	 * @param RawMtrWrhsPrnmntVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/wrhs/multiRawMtrWrhsPrnmnt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiRawMtrWrhsPrnmnt(@RequestBody RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			rawMtrWrhsPrnmntVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsPrnmntVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsPrnmntVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsPrnmntVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsPrnmntService.multiRawMtrWrhsPrnmnt(rawMtrWrhsPrnmntVO);
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
	 * 입고예정 삭제
	 * @param RawMtrWrhsPrnmntVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/fm/wrhs/deleteRawMtrWrhsPrnmnt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsPrnmnt(@RequestBody RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			rawMtrWrhsPrnmntVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsPrnmntVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsPrnmntVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsPrnmntVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsPrnmntService.deleteRawMtrWrhsPrnmnt(rawMtrWrhsPrnmntVO);
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


}
