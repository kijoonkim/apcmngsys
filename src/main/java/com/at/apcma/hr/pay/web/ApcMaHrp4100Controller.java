package com.at.apcma.hr.pay.web;

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

/**
 * 급여 전표처리기준 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.06.21
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 급여 전표처리기준 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.06.21  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrp4100Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 급여 전표처리기준 조회
    @PostMapping(value = "/hr/hrp/pay/selectHrp4100List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp2320List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrp4100List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRP4100_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrp4100List=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    // 급여 전표처리기준 저장
    @PostMapping(value = "/hr/hrp/pay/insertHrp4100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrp4100(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrp4100=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRP4100_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHrp4100=====end========");
        if (resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("v_errorStr")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

}
