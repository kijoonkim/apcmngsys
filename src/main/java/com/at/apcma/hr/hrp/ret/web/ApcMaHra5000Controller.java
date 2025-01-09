package com.at.apcma.hr.hrp.ret.web;

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
 * 퇴직정산기준 등록 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.10
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 퇴직정산기준 등록 (Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.10  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHra5000Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;

    // 퇴직정산기준 등록 조회
    @PostMapping(value = "/hr/hrp/ret/selectHra5000List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHra5000List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHra5000List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "SP_HRA5000_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHra5000List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 퇴직정산기준 등록 저장
    @PostMapping(value = "/hr/hrp/ret/insertHra5000.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra5000(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra5000=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "SP_HRA5000_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra5000=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 퇴직정산기준(근속연수 공제) 저장
    @PostMapping(value = "/hr/hrp/ret/insertHra5000S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra5000S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra5000S1=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA5000_S1");

            logger.info("=============insertHra5000S1=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 퇴직정산기준(누진일수) 저장
    @PostMapping(value = "/hr/hrp/ret/insertHra5000S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra5000S2(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra5000S2=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA5000_S2");

            logger.info("=============insertHra5000S2=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 퇴직정산기준(환산급여) 저장
    @PostMapping(value = "/hr/hrp/ret/insertHra5000S3.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra5000S3(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra5000S3=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA5000_S3");

            logger.info("=============insertHra5000S3=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

}
