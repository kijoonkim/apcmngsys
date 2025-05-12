package com.at.apcma.fi.tax.vat;

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
 * 세무 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.10.07
 * @version 	1.0
 * @see
 *
 * <pre>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 * @ 2024.10.07   	천용진		최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFit1100Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    @PostMapping(value = "/fi/tax/vat/selectFit1100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFit1100(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFit1100=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"SP_FIT1100_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFit1100=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }

    //매출 전체
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S");

            logger.info("=============insertFit1100_S=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //매입 전체
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S1=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S1");

            logger.info("=============insertFit1100_S1=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //매출세금계산서
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S2(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S2=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S2");

            logger.info("=============insertFit1100_S2=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //매출계산서
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S3.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S3(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S3=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S3");

            logger.info("=============insertFit1100_S3=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //영세율첨부서류
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S4.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S4(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S4=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S4");

            logger.info("=============insertFit1100_S4=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //신용카드매출
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S5.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S5(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S5=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S5");

            logger.info("=============insertFit1100_S5=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //수출실적
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S6.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S6(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S6=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S6");

            logger.info("=============insertFit1100_S6=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //내국신용장
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S7.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S7(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S7=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S7");

            logger.info("=============insertFit1100_S7=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //영세율매출명세서
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S8.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S8(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S8=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S8");

            logger.info("=============insertFit1100_S8=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //매입세금계산서
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S9.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S9(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S9=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S9");

            logger.info("=============insertFit1100_S9=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //매입계산서
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S10.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S10(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S10=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S10");

            logger.info("=============insertFit1100_S10=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //의제매입세액명세
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S11.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S11(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S11=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S11");

            logger.info("=============insertFit1100_S11=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //건물등감가상각
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S12.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S12(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S12=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S12");

            logger.info("=============insertFit1100_S12=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //공제받지못할매입세액명세
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S13.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S13(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S13=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S13");

            logger.info("=============insertFit1100_S13=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
    //신용카드수령금액명세
    @PostMapping(value = "/fi/tax/vat/inesrtFit1100_S14.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFit1100_S14(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertFit1100_S14=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_FIT1100_S14");

            logger.info("=============insertFit1100_S14=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {

            return getErrorResponseEntity(e);
        }
    }
}
