package com.at.apcma.hr.hra.adj.web;

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

/**
 * 근로소득원천징수부 조회/출력 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.22
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 근로소득원천징수부 조회/출력(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.08.22  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHra1800Controller extends BaseController {

    @Resource(name = "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name = "apcMaComService")
    private ApcMaComService apcMaComService;

    // 근로소득원천징수부 조회/출력 조회
    @PostMapping(value = "/hr/hra/adj/selectHra1800List.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHra1800List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============selectHra1800List=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "P_HRA1800_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHra1800List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 근로소득원천징수부 조회/출력 저장
    @PostMapping(value = "/hr/hra/adj/insertHra1800.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1800(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHra1800=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "TT_V_T_HRA1800_TABLE_1");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra1800=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }


}
