package com.at.apcma.fi.ffa.alm.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import com.ibatis.sqlmap.engine.type.JdbcTypeRegistry;

/**
 * 취득등록 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.10.17
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 취득등록(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.10.17  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFia2500Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 취득등록 조회
	@PostMapping(value = "/fi/ffa/alm/selectFia2500List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia2500List(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectFia2500List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_FIA2500_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFia2500List=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 취득등록 디테일 조회
	@PostMapping(value = "/fi/ffa/alm/selectFia1100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia1100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============selectFia1100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIA1100_POPUP_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============selectFia1100=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 취득등록 저장,삭제,취소
	@PostMapping(value = "/fi/ffa/alm/modifyFia2500S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> modifyFia2500S(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============modifyFia2500S=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIA2500_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============modifyFia2500S=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 취득등록 디테일
    @PostMapping(value = "/fi/fgl/alm/saveFia2500S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFia2500S1(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFia2500S1=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		resultMap = apcMaComService.processForListData(param, session, request, "", "P_FIA2500_S1");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFia2500S1=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    } 	
	
	// 자산취득 가져오기 조회
	@PostMapping(value = "/fi/ffa/alm/selectFia2510.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia2510(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============selectFia2510=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIA2510_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============selectFia2510=====end========");
		return getSuccessResponseEntity(resultMap);
	}	    
	
}
