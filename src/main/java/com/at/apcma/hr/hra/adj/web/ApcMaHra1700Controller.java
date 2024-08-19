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
 * 개인별 연말정산 결과조회 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.22
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 개인별 연말정산 결과조회(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.08.22  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHra1700Controller extends BaseController {

    @Resource(name = "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name = "apcMaComService")
    private ApcMaComService apcMaComService;

    // 개인별 연말정산 결과조회 조회
    @PostMapping(value = "/hr/hra/adj/selectHra1700List.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHra1700List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============selectHra1700List=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "P_HRA1700_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHra1700List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 개인별 연말정산 결과조회 저장
    @PostMapping(value = "/hr/hra/adj/insertHra1700.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1700(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHra1700=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "P_HRA1700_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra1700=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }


}
