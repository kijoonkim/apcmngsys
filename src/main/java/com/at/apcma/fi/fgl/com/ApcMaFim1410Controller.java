package com.at.apcma.fi.fgl.com;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 부서별계정 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.15
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 부서별계정(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.15  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFim1410Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
    // 부서별계정 조회
    @PostMapping(value = "/fi/fgl/com/selectFim1410List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectFim1410List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectFim1410List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", 		"P_FIM1410_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectFim1410List=====end========");
        return getSuccessResponseEntityMa(resultMap);
    }
    
    // 부서별계정 저장
    @PostMapping(value = "/fi/fgl/com/saveFim1410.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFim1410(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFim1410=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		resultMap = apcMaComService.processForListData(param, session, request, "", "P_FIM1410_S");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFim1410=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    }    
    
}
