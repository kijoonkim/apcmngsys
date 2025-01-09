package com.at.apcma.fi.fgl.clo.web;

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
 * 선급이용상각 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.09.30
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 선급이용상각(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.09.26  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFig2410Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
    // 선급이용상각 조회
    @PostMapping(value = "/fi/fgl/clo/selectFig2410List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFig2410List(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============selectFig2410List=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"SP_FIG2410_Q");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============selectFig2410List=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    
    // 전표생성, 전표취소
    @PostMapping(value = "/fi/fgl/clo/updateFig2410S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateFig2410S1(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============updateFig2410S1=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"SP_FIG2410_S1");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============updateFig2410S1=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }   
    

}
