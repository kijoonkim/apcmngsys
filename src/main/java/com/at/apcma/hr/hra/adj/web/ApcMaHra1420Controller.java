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
 * 정산자료 등록(관리자) 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.02
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 정산자료 등록(관리자)(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.09.23  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHra1420Controller extends BaseController {

    @Resource(name = "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name = "apcMaComService")
    private ApcMaComService apcMaComService;

    // 정산자료 등록(관리자) 조회
    @PostMapping(value = "/hr/hra/adj/selectHra1420List.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHra1400List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============selectHra1420List=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "P_HRA1410_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHra1420List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }


    // 정산자료 등록(관리자) 저장
    @PostMapping(value = "/hr/hra/adj/insertHra1420.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1420(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHra1420=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "P_HRA1410_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra1420=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

}
