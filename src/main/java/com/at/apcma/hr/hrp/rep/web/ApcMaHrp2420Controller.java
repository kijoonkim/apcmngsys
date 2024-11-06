package com.at.apcma.hr.hrp.rep.web;

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
 * 급여대장( 급여명세서 일괄출력 ) 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.08
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 급여대장( 급여명세서 일괄출력 )(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.08  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrp2420Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    // 급여대장( 급여명세서 일괄출력 ) 조회
    @PostMapping(value = "/hr/hrp/rep/selectHrp2420List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp2420List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrp2420List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRP2425_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrp2420List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }
    
    // 급여대장( 급여명세서 일괄출력 ) 레포트 데이터 조회
    @PostMapping(value = "/hr/hrp/rep/selectHrp2420ReportList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp2420ReportList(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============selectHrp2420ReportList=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();

    	
    	try {
    		
    		param.put("procedure", "P_HRP2436_Q");
    		resultMap = apcMaCommDirectService.callProc(param, session, request, "");
    		
    		//self url 편집
    		String f_path1 = request.getRequestURL().toString();
    		String f_path2 = request.getRequestURI().toString();
    		String f_path3 = f_path1.replaceAll(f_path2, "");
    		resultMap.put("SERVER_ROOT_PATH", f_path3);
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============selectHrp2420ReportList=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    	
    }
}
