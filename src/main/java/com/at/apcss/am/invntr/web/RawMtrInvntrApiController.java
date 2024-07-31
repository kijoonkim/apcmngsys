package com.at.apcss.am.invntr.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class RawMtrInvntrApiController extends BaseController {

	@Resource(name = "rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	//모바일 선별실적등록 팔레트번호 조회
	@PostMapping(value = "/api/mobile/am/invntr/selectRawMtrInvntr.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawMtrInvntr(@RequestBody RawMtrInvntrVO rawMtrInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		RawMtrInvntrVO resultVO;
		try {
			resultVO = rawMtrInvntrService.selectRawMtrInvntr(rawMtrInvntrVO);
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	//모바일 품목/품종 UPDATE
	@PostMapping(value = "/api/mobile/am/invntr/rawMtrInvntrItemCdUpdate.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> rawMtrInvntrItemCdUpdate(@RequestBody RawMtrInvntrVO rawMtrInvntrVO, HttpServletRequest request) throws Exception {
		int result = 0;
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
//			rawMtrInvntrVO.setSysLastChgUserId(getUserId());
//			rawMtrInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			result = rawMtrInvntrService.rawMtrInvntrItemCdUpdate(rawMtrInvntrVO);
			resultMap.put(ComConstants.PROP_UPDATED_CNT, result);

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