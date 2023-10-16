package com.at.apcss.am.wrhs.web;

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

import com.at.apcss.am.wrhs.service.GdsWrhsService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : GdsWrhsController.java
 * @Description : 상품입고에 대한 Controller 클래스
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
public class GdsWrhsController extends BaseController {
	
	@Resource(name = "gdsWrhsService")
	private GdsWrhsService gdsWrhsService;
	
	@PostMapping(value = "/am/wrhs/selectGdsWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGdsWrhsList(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GdsInvntrVO> resultList = new ArrayList<>();
		try {
			resultList = gdsWrhsService.selectGdsWrhsList(gdsInvntrVO);			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
		
	}
	
	@PostMapping(value = "/am/wrhs/insertGdsInvntr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertGdsInvntr(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			gdsInvntrVO.setSysFrstInptUserId(getUserId());
			gdsInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
			gdsInvntrVO.setSysLastChgUserId(getUserId());
			gdsInvntrVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = gdsWrhsService.insertGdsInvntr(gdsInvntrVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/updateGdsInvntr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateGdsInvntr(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			gdsInvntrVO.setSysLastChgUserId(getUserId());
			gdsInvntrVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = gdsWrhsService.updateGdsInvntr(gdsInvntrVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/deleteGdsInvntr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteGdsInvntr(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			gdsInvntrVO.setSysLastChgUserId(getUserId());
			gdsInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = gdsWrhsService.deleteGdsInvntr(gdsInvntrVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
}
