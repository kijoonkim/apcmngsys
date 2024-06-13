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
 * 수당기준 등록 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.23
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 수당기준 등록 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.06.11  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrb5600Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 수당기준 정보 조회
    @PostMapping(value = "/hr/hrp/com/selectHrp5600List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp5600List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrp5600List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRB5600_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrp5600List=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 수당기준 정보 조회
    @PostMapping(value = "/hr/hrp/com/insertHrp5600.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrp5600(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrp5600=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRB5600_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHrp5600=====end========");
        /*if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {*/
            return getSuccessResponseEntity(resultMap);
        /*}*/
    }

    // 수당기준 정보 조회
    @PostMapping(value = "/hr/hrp/com/insertHrp5600S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrp5600S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrp5600S1=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            for(String key : param.keySet()){
                if(key.contains("P_HRB5600_S1")) {
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
}
