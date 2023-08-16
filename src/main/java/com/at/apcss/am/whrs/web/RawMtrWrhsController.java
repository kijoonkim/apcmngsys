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

import com.at.apcss.am.whrs.service.RawMtrWrhsService;
import com.at.apcss.am.whrs.vo.RawMtrWrhsVO;
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
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
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
				
				rawMtrWrhsVO.setSysFrstInptUserId("admin");
				rawMtrWrhsVO.setSysFrstInptPrgrmId("testprgrm");
				rawMtrWrhsVO.setSysLastChgUserId("admin");
				rawMtrWrhsVO.setSysLastChgPrgrmId("testprgrm");
			}
			
			HashMap<String, Object> rtnObj = rawMtrWrhsService.insertRawMtrWrhsList(rawMtrWrhsList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
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
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
}
