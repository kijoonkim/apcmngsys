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
 * 정산자료(개인) 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.02
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 정산자료(개인)(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.08.02  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHra1400Controller extends BaseController {

    @Resource(name = "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name = "apcMaComService")
    private ApcMaComService apcMaComService;

    // 정산자료(개인) 조회
    @PostMapping(value = "/hr/hra/adj/selectHra1400List.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHra1400List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============selectHra1400List=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "SP_HRA1400_2023_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHra1400List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }


    // 정산자료(개인) 저장
    @PostMapping(value = "/hr/hra/adj/insertHra1400S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHra1400S1=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "SP_HRA1400_2023_S1");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra1400S1=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    // 정산자료(개인) ( 인적공제 및 소득공제 명세 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S");

            logger.info("=============insertHra1400S=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 정산자료(개인) ( 인적공제 및 소득공제 명세 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S2(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S2=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S2");

            logger.info("=============insertHra1400S2=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 정산자료(개인) ( 월세액 등 소득공제명세 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S3.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S3(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S3=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S3");

            logger.info("=============insertHra1400S3=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 정산자료(개인) ( 의료비 지급명세서 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S4.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S4(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S4=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S4");

            logger.info("=============insertHra1400S4=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 정산자료(개인) ( 기부금 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S5.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S5(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S5=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S5");

            logger.info("=============insertHra1400S5=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 정산자료(개인) ( 전년도이월 기부금 관리 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S6.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S6(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S6=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S6");

            logger.info("=============insertHra1400S6=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    // 정산자료(개인) ( 보험료 리스트 )
    @PostMapping(value = "/hr/hra/adj/insertHra1400S7.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S7(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHra1400S7=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_HRA1400_2023_S7");

            logger.info("=============insertHra1400S7=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }
    }

    //   정산자료등록(개인) 상태변경
    @PostMapping(value = "/hr/hra/adj/insertHra1400S8.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S8(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHra1400S8=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "SP_HRA1400_2023_S8");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra1400S8=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

    //   정산자료등록(개인) 인사정보일괄적용
    @PostMapping(value = "/hr/hra/adj/insertHra1400S1IM.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHra1400S1IM(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception {

        logger.info("=============insertHra1400S1IM=====start========");
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            param.put("procedure", "SP_HRA1400_2023_S1_IMPORT");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertHra1400S1IM=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }

}
