package com.at.apcma.fi.fgl.sta.web;

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

import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 합계잔액시산표조회 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.04.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 합계잔액시산표조회(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.05.14  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFig5210Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
	// 합계잔액시산표조회 조회
	@PostMapping(value = "/fi/fgl/sta/selectFig5210List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFig5210List(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectFig5210List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_FIG5210_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFig5210List=====end========");
		return getSuccessResponseEntity(resultMap);	
	}	
	
	// 합계잔액시산표조회 조회
	@PostMapping(value = "/fi/fgl/sta/selectFig5210Report.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFig5210Report(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============selectFig5210Report=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIG5210_Q");
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
		
		logger.info("=============selectFig5210Report=====end========");
		return getSuccessResponseEntity(resultMap);	
	}	
}
