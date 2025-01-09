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
import java.util.Map;
import java.util.Optional;

/**
 * 급여체계별 급여항목 컨트롤러 클래스
 *
 * @author 인텔릭아이앤에스
 * @version 1.0
 * @see <pre>
 * << 급여체계별 급여항목 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.06.03  표주완     	최초 생성
 *
 *  </pre>
 * @since 2024.06.03
 */
@Controller
public class ApcMaHrb5300Controller extends BaseController {

    @Resource(name = "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 급여체계별 급여항목 정보 조회
    @PostMapping(value = "/hr/hrp/com/selectHrb5300List.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrb5300List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============selectHrb5300List=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "SP_HRB5300_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrb5300List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 급여체계별 급여항목 저장
    @PostMapping(value = "/hr/hrp/com/insertHrb5300.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrb5300(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHrb5300=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "SP_HRB5300_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHrb5300=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 급여체계별 급여항목 구문확인 버튼
    @PostMapping(value = "/hr/hrp/com/chkHrb5300.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> chkHrb5300(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============chkHrb5300=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            resultMap = apcMaCommDirectService.checkFormula(param);

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============chkHrb5300=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }


}
