package com.at.apcma.fi.ftr.tri.web;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
public class ApcMaFim5300Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;

    @PostMapping(value = "/fi/ftr/tri/selectFim5300List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFim5300List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFim5300List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"P_FIM5300_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFim5300List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("resultMessage")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }
    
    
    @PostMapping(value = "/fi/ftr/tri/insertFim5300S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFim5300S(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFim5300S=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"P_FIM5300_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertFim5300S=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("resultMessage")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }
}
