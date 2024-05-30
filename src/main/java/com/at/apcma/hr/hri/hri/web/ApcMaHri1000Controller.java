package com.at.apcma.hr.hri.hri.web;

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
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * 인사정보 등록을 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.14
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 인사정보 등록 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.05.14  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHri1000Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 인사정보 등록 목록 조회
    @PostMapping(value = "/hr/hri/hri/selectHri1000List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHri1000List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHri1000List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_HRI1000_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHri1000List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    @PostMapping(value = "/hr/hri/hri/insertHri1000Master.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHri1000Master(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertHri1000Master=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"P_HRI1000_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHri1000Master=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    @PostMapping(value = "/hr/hri/hri/insertHri1000Sub.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHri1000Sub(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertHri1000Master=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"P_HRI1000_S1");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHri1000Master=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    @PostMapping(value = "/hr/hri/hri/insertHri1000Detail.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHri1000Detail(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertHri1000Detail=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for(String key : param.keySet()){
                if(key.contains("P_HRI1000_S")) {
                    if(param.get(key) instanceof List) {
                        List<HashMap<String,Object>> listData = (List<HashMap<String, Object>>) param.get(key);
                        if(listData.size() > 0) {
                            listData.stream().forEach(d -> {
                                try {
                                    d.put("procedure", key);
                                    apcMaCommDirectService.callProc(d, session, request, "");
                                } catch (Exception e) {
                                    throw new RuntimeException(e);
                                }
                            });
                            resultMap.put(key, listData);
                        }
                    } else if (param.get(key) instanceof Map) {
                        Map<String, Object> mapData = (Map<String, Object>) param.get(key);
                        mapData.put("procedure", 		key);
                        resultMap.put(key, apcMaCommDirectService.callProc(mapData, session, request, ""));
                    }
                }
            }
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHri1000Detail=====end========");
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/hr/hri/hri/deleteHri1000List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteHri1000List(
            @RequestBody Map<String, Object> param
            , Model model
            ,HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============deleteHri1000List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_HRI1000_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============deleteHri1000List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    @PostMapping(value = "/hr/hri/hri/insertHri1000EnterEmp.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHri1000EnterEmp(
            @RequestBody Map<String, Object> param
            , Model model
            ,HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHri1000EnterEmp=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_HRI1000_ENTER_EMP_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHri1000EnterEmp=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }
}
