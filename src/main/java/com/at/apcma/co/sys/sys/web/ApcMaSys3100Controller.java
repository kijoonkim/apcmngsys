package com.at.apcma.co.sys.sys.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import com.ibatis.sqlmap.engine.type.JdbcTypeRegistry;

/**
 * 소수점 설정 정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.14
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 소수점 설정 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.05.14  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaSys3100Controller extends BaseController{

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 소수점 설정 정보 조회
    @PostMapping(value = "/co/sys/sys/selectSys3100List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSys3100List(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpServletRequest request) throws Exception{

        logger.info("=============selectSys3100List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3100_Q");
            resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectSys3100List=====end========");
        return getSuccessResponseEntity(resultMap);
    }

    // 소수점 설정 정보 신규
    @PostMapping(value = "/co/sys/sys/insertSys3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertSys3100(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpServletRequest request) throws Exception{

        logger.info("=============insertSys3100=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_SYS3100_S");
            resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============insertSys3100=====end========");
        return getSuccessResponseEntity(resultMap);
    }


    // 소수점 설정 정보 수정
    @PostMapping(value = "/co/sys/sys/updateSys3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateSys3100(
            @RequestBody Map<String, Object> param
            ,Model model
            ,HttpServletRequest request) throws Exception{

        logger.info("=============updateSys3100=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"SP_COM3100_S");
            resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============updateSys3100=====end========");
        return getSuccessResponseEntity(resultMap);
    }
}
