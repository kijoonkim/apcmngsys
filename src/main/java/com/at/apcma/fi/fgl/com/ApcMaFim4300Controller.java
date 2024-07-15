package com.at.apcma.fi.fgl.com;

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
 * 전표유형관리 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.11
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 전표유형관리(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.08  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFim4300Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
    // 전표유형관리 조회
    @PostMapping(value = "/fi/fgl/com/selectFim4300List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFim4300List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFim4300List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_FIM4300_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFim4300List=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }
    
    // 전표유형관리 mast 저장
    @PostMapping(value = "/fi/fgl/com/saveFim4300mast.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFim4300mast(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFim4300mast=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		resultMap = apcMaComService.processForListData(param, session, request, "", "P_FIM4300_S");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFim4300mast=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }    
    
    // 전표유형관리 detail 저장
    @PostMapping(value = "/fi/fgl/com/saveFim4300detail.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFim4300detail(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFim4300detail=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		resultMap = apcMaComService.processForListData(param, session, request, "", "P_FIM4300_S1");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFim4300detail=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }    

}
