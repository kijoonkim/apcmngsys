package com.at.apcma.fi.ffa.com.web;

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
import com.ibatis.sqlmap.engine.type.JdbcTypeRegistry;

/**
 * 감가상각률등록 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.10.17
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 감가상각률등록(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.10.17  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFia1200Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 감가상각률등록 조회
	@PostMapping(value = "/fi/ffa/com/selectFia1200List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia1200List(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectFia1200List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_FIA1200_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFia1200List=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 감가상각률등록 신규
    @PostMapping(value = "/fi/ffa/com/saveFia1200List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveFia1200List(
    		@RequestBody Map<String, Object> param
    		, Model model
    		, HttpSession session
    		, HttpServletRequest request) throws Exception{
    	
    	logger.info("=============saveFia1200List=====start========");
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	
    	try {
    		
    		resultMap = apcMaComService.processForListData(param, session, request, "", "P_FIA1200_S");
    		
    	} catch (Exception e) {
    		logger.debug(e.getMessage());
    		return getErrorResponseEntity(e);
    	}
    	
    	logger.info("=============saveFia1200List=====end========");
    	return getSuccessResponseEntityMa(resultMap);
    } 	
	
}
