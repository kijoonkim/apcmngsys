package com.at.apcma.fi.ftr.rec.web;

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
import java.util.Optional;

/**
 * 자금전표등록을 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.06.03
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 인사정보 등록 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.06.03  신정철     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaTra1020Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;

    @PostMapping(value = "/fi/ftr/rec/selectTra1020List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectTrp1060List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectTra1020List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"SP_TRA1020_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectTra1020List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("resultMessage")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }
    
    @PostMapping(value = "/fi/ftr/rec/insertTra1020SList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertTra1020SList(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertTra1020SList=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_TRA1020_S");

            logger.info("=============insertTra1020SList=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }
    }
    
    @PostMapping(value = "/fi/ftr/rec/insertTra1020S1List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertTra1020S1List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertTra1020S1List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_TRA1020_S1");

            logger.info("=============insertTra1020S1List=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }
    }
}
