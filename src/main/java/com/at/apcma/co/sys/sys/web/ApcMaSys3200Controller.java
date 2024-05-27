package com.at.apcma.co.sys.sys.web;

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
import java.util.List;
import java.util.Map;

/**
 * 관리번호 채번 정보 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.16
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 관리번호 채번 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.05.16  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaSys3200Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;


    // 관리번호 채번 정보 조회
    @PostMapping(value = "/co/sys/sys/selectSys3200List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSys3200List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectSys3200List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3200_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectSys3200List=====end========");
        return getSuccessResponseEntity(resultMap);
    }

    // 관리번호 채번 정보 (History) 조회
    @PostMapping(value = "/co/sys/sys/selectSys3200HisList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSys3200HisList(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectSys3200HisList=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3200_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectSys3200HisList=====end========");
        return getSuccessResponseEntity(resultMap);
    }

    // 관리번호 채번 정보 신규
    @PostMapping(value = "/co/sys/sys/insertSys3200.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertSys3200(
            @RequestBody Map<String, Object> param
            ,Model model
            , HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertSys3200=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3200_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertSys3200=====end========");
        return getSuccessResponseEntity(resultMap);
    }


    // 관리번호 채번 정보 수정
    @PostMapping(value = "/co/sys/sys/updateSys3200.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSys3200(
            @RequestBody Map<String, Object> param
            ,Model model
            , HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============updateSys3200=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3200_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============updateSys3200=====end========");
        return getSuccessResponseEntity(resultMap);
    }

    // 관리번호 채번 정보 삭제
    @PostMapping(value = "/co/sys/sys/deleteSys3200.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteSys3200(
            @RequestBody Map<String, Object> param
            ,Model model
            , HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============deleteSys3200=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3200_S");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============deleteSys3200=====end========");
        return getSuccessResponseEntity(resultMap);
    }

    // 관리번호 채번 정보 신규
    @PostMapping(value = "/co/sys/sys/insertSys3200His.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertSys3200His(
            @RequestBody Map<String, Object> param
            ,Model model
            , HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertSys3200His=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

           /* for (Map<String, Object> param : params) {*/
                param.put("procedure", "P_SYS3200_S1");
                resultMap = apcMaCommDirectService.callProc(param, session, request, "");
           /* }*/

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertSys3200His=====end========");
        return getSuccessResponseEntity(resultMap);
    }


    // 관리번호 채번 정보 수정
    @PostMapping(value = "/co/sys/sys/updateSys3200His.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSys3200His(
            @RequestBody List<Map<String, Object>> params
            ,Model model
            , HttpSession session
            ,HttpServletRequest request) throws Exception{

        logger.info("=============updateSys3200His=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            for (Map<String, Object> param : params) {
                param.put("procedure", "P_SYS3200_S1");
                resultMap = apcMaCommDirectService.callProc(param, session, request, "");
            }

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============updateSys3200His=====end========");
        return getSuccessResponseEntity(resultMap);
    }

}
