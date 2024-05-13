package com.at.apcma.hr.hri.hri.web;

import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class ApcMaHri1100Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 인원현황 조회
    @PostMapping(value = "/hr/hri/hri/selectHri1100List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectCom3100List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHri1100List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"SP_HRI1100_Q");
            resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHri1100List=====end========");
        return getSuccessResponseEntity(resultMap);
    }
}
