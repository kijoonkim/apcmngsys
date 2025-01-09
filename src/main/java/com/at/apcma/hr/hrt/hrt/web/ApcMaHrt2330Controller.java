package com.at.apcma.hr.hrt.hrt.web;

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
 * 일근태조회를 처리하는 컨트롤러 클래스
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
public class ApcMaHrt2330Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @PostMapping(value = "/hr/hrt/hrt/selectHrt2330List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrt2330List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrt2330List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"SP_HRT2330_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {

            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrt2330List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("resultMessage")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }
}
