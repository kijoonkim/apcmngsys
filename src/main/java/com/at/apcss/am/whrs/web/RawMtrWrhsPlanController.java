package com.at.apcss.am.whrs.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.whrs.service.RawMtrWrhsPlanService;
import com.at.apcss.am.whrs.vo.RawMtrWrhsPlanVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class RawMtrWrhsPlanController extends BaseController{

	@Resource(name = "rawMtrWrhsPlanService")
	private RawMtrWrhsPlanService rawMtrWrhsPlanService;

	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsPlanList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsPlanList(@RequestBody RawMtrWrhsPlanVO rawMtrWrhsPlanVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RawMtrWrhsPlanVO> resultList;
		try {

			resultList = rawMtrWrhsPlanService.selectRawMtrWrhsPlanList(rawMtrWrhsPlanVO);

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/insertRawMtrWrhsPlanList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRawMtrWrhsPlanList(@RequestBody List<RawMtrWrhsPlanVO> rawMtrWrhsPlanList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertedCnt=0;

		try {
			for (RawMtrWrhsPlanVO rawMtrWrhsPlanVO : rawMtrWrhsPlanList) {
				rawMtrWrhsPlanVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrWrhsPlanVO.setSysFrstInptUserId(getUserId());
				rawMtrWrhsPlanVO.setSysLastChgPrgrmId(getPrgrmId());
				rawMtrWrhsPlanVO.setSysLastChgUserId(getUserId());
			}
			insertedCnt = rawMtrWrhsPlanService.insertRawMtrWrhsPlanList(rawMtrWrhsPlanList);

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/deleteRawMtrWrhsPlan.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsPlan(@RequestBody RawMtrWrhsPlanVO rawMtrWrhsPlanVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int delettedCnt=0;

		try {
				rawMtrWrhsPlanVO.setSysLastChgPrgrmId(getPrgrmId());
				rawMtrWrhsPlanVO.setSysLastChgUserId(getUserId());
				delettedCnt = rawMtrWrhsPlanService.deleteRawMtrWrhsPlan(rawMtrWrhsPlanVO);

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, delettedCnt);

		return getSuccessResponseEntity(resultMap);
	}

}
