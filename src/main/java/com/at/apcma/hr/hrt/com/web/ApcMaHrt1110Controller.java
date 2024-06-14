package com.at.apcma.hr.hrt.com.web;

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
 * 근태집계 정보를 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.06.03
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 인사정보 등록 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.06.03  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrt1110Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @PostMapping(value = "/hr/hrt/com/selectHrt1110List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrt1110List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrt1110List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_HRT1110_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrt1110List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("resultMessage")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    @PostMapping(value = "/hr/hrt/com/insertHrt1110List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrt1110List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrt1110List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for(String key : param.keySet()){
                if(key.contains("listData")) {
                    if(param.get(key) instanceof List) {
                        List<HashMap<String,Object>> listData = (List<HashMap<String, Object>>) param.get(key);

                        for(int i = 0; i < listData.size(); i++) {
                            listData.get(i).put("procedure", 		"P_HRT1110_S");
                            listData.add(i, apcMaCommDirectService.callProc(listData.get(i), session, request, ""));
                            if(listData.get(i).get("resultStatus").equals("E")) {
                                String errorCode = Optional.ofNullable(listData.get(i).get("v_errorCode")).orElse("").toString();
                                String errorStr = Optional.ofNullable(listData.get(i).get("resultMessage")).orElse("").toString();

                                return getErrorResponseEntity(errorCode, errorStr);
                            }
                        }

                        resultMap.put(key, listData);
                    }
                }
            }
            logger.info("=============insertHrt1110List=====end========");
            return getSuccessResponseEntity(resultMap);

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }
    }
}
