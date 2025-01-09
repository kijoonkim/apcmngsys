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
 * 전표전기 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.15
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 전표전기(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.15  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFig2200Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
    // 전표전기 조회
    @PostMapping(value = "/fi/fgl/jor/selectFig2200List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFig2200List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFig2200List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"SP_FIG2200_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFig2200List=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }
    
    // 지급조건변경이력 조회
    @PostMapping(value = "/fi/fgl/jor/selectFig2250List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFig2250List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFig2250List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"SP_FIG2250_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFig2250List=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }   
    
    // 결재이력 조회
    @PostMapping(value = "/fi/fgl/jor/selectFim3420List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFim3420List(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============selectFim3420List=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"SP_FIM3420_Q");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============selectFim3420List=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
    // 전기처리, 전기취소, 전기+해제, 보류해제, 보류지정, 일괄삭제
    @PostMapping(value = "/fi/fgl/jor/updateFig2200S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateFig2200S1(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============updateFig2200S1=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"SP_FIG2200_S1");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============updateFig2200S1=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
    // 일괄결재
    @PostMapping(value = "/fi/fgl/jor/updateFig2200S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateFig2200S2(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============updateFig2200S2=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"SP_FIG2200_S2");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============updateFig2200S2=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
}
