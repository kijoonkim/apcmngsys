package com.at.apcma.fi.fgl.jor.web;

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

/**
 * 전표등록 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 전표등록(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.29  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFig2210Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
    // 전표등록 조회
    @PostMapping(value = "/fi/fgl/jor/selectFig2210QList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFig2210QList(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============selectFig2210QList=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"P_FIG2210_Q");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============selectFig2210QList=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
    // 회계처리 조회
    @PostMapping(value = "/fi/fgl/jor/selectFig2210ItemQList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFig2210ItemQList(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============selectFig2210ItemQList=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"P_FIG2210_ITEM_Q");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============selectFig2210ItemQList=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
    // 전표등록 처리
    @PostMapping(value = "/fi/fgl/jor/insertFig2210S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFig2210S(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============insertFig2210S=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"P_FIG2210_S");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============insertFig2210S=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
    

    
}
