package com.at.apcma.hr.hrp.com.web;

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
 * 간이세액조건표 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.23
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 간이세액조건표 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.06.13  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrb6200Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;


    // 간이세액조건표 정보 조회
    @PostMapping(value = "/hr/hrp/com/selectHrb6200List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp5600List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrb6200List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRB6200_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrb6200List=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 간이세액조건표 정보 조회
    @PostMapping(value = "/hr/hrp/com/insertHrb6200.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrb6200(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrb6200=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRB6200_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHrb6200=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 수당기준 정보 조회
    @PostMapping(value = "/hr/hrp/com/insertHrb6200S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrb6200S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrb6200S1=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            for(String key : param.keySet()){
                if(key.contains("P_HRB6200_S1")) {
                    if(param.get(key) instanceof List) {
                        List<HashMap<String,Object>> listData = (List<HashMap<String, Object>>) param.get(key);
                        listData.stream().forEach(d -> {
                            try {
                                d.put("procedure", 		key);
                                d = apcMaCommDirectService.callProc(d, session, request, "");
                                resultMap.put("result", d);
                            } catch (Exception e) {
                                throw new RuntimeException(e);
                            }
                        });
                        resultMap.put(key, listData);
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

        logger.info("=============insertHrb6200S1=====end========");
        HashMap<String, Object> result = (HashMap<String, Object>) resultMap.get("result");
        if (result.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 수당기준 정보 조회
    @PostMapping(value = "/hr/hrp/com/insertHrb6200S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrb6200S2(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrb6200S2=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            for(String key : param.keySet()){
                if(key.contains("P_HRB6200_S2")) {
                    if(param.get(key) instanceof List) {
                        List<HashMap<String,Object>> listData = (List<HashMap<String, Object>>) param.get(key);
                        listData.stream().forEach(d -> {
                            try {
                                d.put("procedure", 		key);
                                d = apcMaCommDirectService.callProc(d, session, request, "");
                                resultMap.put("result", d);
                            } catch (Exception e) {
                                throw new RuntimeException(e);
                            }
                        });
                        resultMap.put(key, listData);
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

        logger.info("=============insertHrb6200S2=====end========");
        HashMap<String, Object> result = (HashMap<String, Object>) resultMap.get("result");
        if (result.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }
}
