package com.at.apcma.fi.fap.car.web;

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
 * 카드정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.04
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 카드정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.01  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFim3100Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
    // 카드정보 조회
    @PostMapping(value = "/fi/fap/car/selectFim3100List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFim3100List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFim3100List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_FIM3100_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFim3100List=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }
    
    // 카드정보수신
    @PostMapping(value = "/fi/fap/car/selectFim3100CardInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFim3100CardInfo(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============selectFim3100CardInfo=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"P_FIM3100_S2");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============selectFim3100CardInfo=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }
    
    // 카드정보 저장
    @PostMapping(value = "/fi/fap/car/saveFim3100Mast.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFim3100(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFim3100Mast=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"P_FIM3100_S");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFim3100Mast=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }
    
    // 카드정보 카드이력 저장
    @PostMapping(value = "/fi/fap/car/saveFim3100Detail.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFim3100Detail(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFim3100Detail=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		param.put("procedure", 		"P_FIM3100_S");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFim3100Detail=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }

	
}
