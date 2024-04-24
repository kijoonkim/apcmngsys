package com.at.apcss.co.authrt.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.authrt.service.ComDpcnLgnService;
import com.at.apcss.co.authrt.vo.ComDpcnLgnVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class ComDpcnLgnController extends BaseController{
	
	@Resource(name = "comDpcnLgnService")
	private ComDpcnLgnService comDpcnLgnService;

	/**
	 * 로그인중복관리 목록 조회
	 * @param ComDpcnLgnVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectUserIdComDpcnLgn.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUserIdComDpcnLgn(@RequestBody ComDpcnLgnVO comDpcnLgnVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		String resultStr = "";
		
		try {
			resultStr = comDpcnLgnService.selectUserIdComDpcnLgn(comDpcnLgnVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultStr);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 로그인중복관리 목록 조회
	 * @param ComDpcnLgnVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectComDpcnLgnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComDpcnLgnList(@RequestBody ComDpcnLgnVO comDpcnLgnVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComDpcnLgnVO> resultList;

		try {
			resultList = comDpcnLgnService.selectComDpcnLgnList(comDpcnLgnVO);
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
	
	/**
	 * 로그인중복관리 업데이트 목록
	 * @param  List<ComDpcnLgnVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/saveDpcnLgnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> saveDpcnLgnList(@RequestBody List<ComDpcnLgnVO> comDpcnLgnList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		for (ComDpcnLgnVO comDpcnLgnVO : comDpcnLgnList) {
			comDpcnLgnVO.setSysFrstInptPrgrmId(getPrgrmId());
			comDpcnLgnVO.setSysFrstInptUserId(getUserId());
			comDpcnLgnVO.setSysLastChgPrgrmId(getPrgrmId());
			comDpcnLgnVO.setSysLastChgUserId(getUserId());
		}

		try {
			resultMap = comDpcnLgnService.saveDpcnLgnList(comDpcnLgnList);
			if(resultMap != null) {
				return getErrorResponseEntity(resultMap);
			}
		} catch(Exception e) {
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
