package com.at.apcss.am.invntr.web;

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

import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : GdsInvntrController.java
 * @Description : 상품재고관리 대한 Controller 클래스
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
public class GdsInvntrController extends BaseController {

	@Resource(name = "gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	@PostMapping(value = "/am/invntr/selectGdsInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGdsInvntrList(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GdsInvntrVO> resultList = new ArrayList<>();
		try {
			resultList = gdsInvntrService.selectGdsInvntrList(gdsInvntrVO);			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
		
	}
	
	@PostMapping(value = "/am/invntr/selectUpdateGdsInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectUpdateGdsInvntrList(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GdsInvntrVO> resultList = new ArrayList<>();
		try {
			resultList = gdsInvntrService.selectUpdateGdsInvntrList(gdsInvntrVO);			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
		
	}
	
	@PostMapping(value = "/am/invntr/selectGdsWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGdsWrhsList(@RequestBody GdsInvntrVO gdsInvntrVO, HttpServletRequest request) throws Exception {
		logger.debug("selectGdsWrhsList 실행");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GdsInvntrVO> resultList = new ArrayList<>();
		try {
			resultList = gdsInvntrService.selectGdsWrhsList(gdsInvntrVO);			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
		
	}
	
	@PostMapping(value = "/am/invntr/updateGdsInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateGdsInvntrList(@RequestBody List<GdsInvntrVO> gdsInvntrList, HttpServletRequest request) throws Exception {

		logger.debug("updateSortInvntrDsctnList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( GdsInvntrVO gdsInvntrVO : gdsInvntrList ) {
				gdsInvntrVO.setSysLastChgUserId(getUserId());
				gdsInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = gdsInvntrService.updateGdsInvntrList(gdsInvntrList); //updateSortInvntrDsctnList
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
