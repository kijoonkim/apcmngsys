package com.at.apcss.am.cmns.web;

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

import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class RgnTrsprtCstController extends BaseController {

	// 지역별운임비
	@Resource(name = "rgnTrsprtCstService")
	private RgnTrsprtCstService rgnTrsprtCstService;

	// APC 환경설정 - 지역별 운임비 목록 조회
	@PostMapping(value = "/am/cmns/selectRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RgnTrsprtCstVO> resultList = new ArrayList<>();
		try {

			resultList = rgnTrsprtCstService.selectRgnTrsprtCstList(rgnTrsprtCstVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteRgnTrsprtCstList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRgnTrsprtCstList(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = rgnTrsprtCstService.deleteRgnTrsprtCst(rgnTrsprtCstVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/multiApcVhclMngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiApcVhclMngList(@RequestBody RgnTrsprtCstVO apcWrhsVhclMngList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		List<WrhsVhclVO> wrhsVhclList = apcWrhsVhclMngList.getWrhsVhclList();
		List<RgnTrsprtCstVO> rgnTrsprtCstList = apcWrhsVhclMngList.getRgnTrsprtCstList();
		RgnTrsprtCstVO saveList = new RgnTrsprtCstVO();
		
		try {
			for ( WrhsVhclVO wrhsVhclVO : wrhsVhclList ) {
				wrhsVhclVO.setVhclno(wrhsVhclVO.getVhclno().replaceAll(" ", ""));
				wrhsVhclVO.setSysFrstInptUserId(getUserId());
				wrhsVhclVO.setSysFrstInptPrgrmId(getPrgrmId());
				wrhsVhclVO.setSysLastChgUserId(getUserId());
				wrhsVhclVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			for ( RgnTrsprtCstVO rgnTrsprtCstVO : rgnTrsprtCstList ) {
				rgnTrsprtCstVO.setSysFrstInptUserId(getUserId());
				rgnTrsprtCstVO.setSysFrstInptPrgrmId(getPrgrmId());
				rgnTrsprtCstVO.setSysLastChgUserId(getUserId());
				rgnTrsprtCstVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			saveList.setWrhsVhclList(wrhsVhclList);
			saveList.setRgnTrsprtCstList(rgnTrsprtCstList);

			HashMap<String, Object> rtnObj = rgnTrsprtCstService.multiApcVhclMngList(saveList);
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
