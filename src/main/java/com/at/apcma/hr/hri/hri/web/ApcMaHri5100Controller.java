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
import java.util.HashMap;
import java.util.Map;

/**
 * 인원현황 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.13
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 인원현황 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.05.13  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHri5100Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 인원현황 조회
    @PostMapping(value = "/hr/hri/hri/selectHri5100List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHri5100List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHri5100List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_HRI5100_Q");
            resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHri5100List=====end========");
        return getSuccessResponseEntity(resultMap);
    }
}
