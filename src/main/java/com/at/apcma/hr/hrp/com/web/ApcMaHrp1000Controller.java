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
 * 개인급여 정보 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.23
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 개인급여 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.05.23  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrp1000Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;


    // 개인급여 정보 조회
    @PostMapping(value = "/hr/hrp/com/selectHrp1000List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp1000List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrp1000List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRP1000_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrp1000List=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 개인급여 정보 저장
    @PostMapping(value = "/hr/hrp/com/insertHrp1000.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrp1000(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrp1000=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRP1000_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHrp1000=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 급여기본정보 급여정보(연봉) 저장 
    @PostMapping(value = "/hr/hrp/com/insertHrp1000S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrp1000S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrp1000S1=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for(String key : param.keySet()){
                if(key.contains("P_HRP1000_S1")) {
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

        logger.info("=============insertHrp1000S1=====end========");
        HashMap<String, Object> result = (HashMap<String, Object>) resultMap.get("result");
        if (result.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 원천세징수비율 정보 저장
    @PostMapping(value = "/hr/hrp/com/insertHrp1000S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrp1000S2(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrp1000S2=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for(String key : param.keySet()){
                if(key.contains("P_HRP1000_S2")) {
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

        logger.info("=============insertHrp1000S2=====end========");
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
