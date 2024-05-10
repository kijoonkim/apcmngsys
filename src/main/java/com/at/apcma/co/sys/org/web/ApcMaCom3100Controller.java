package com.at.apcma.co.sys.org.web;

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
 * 국가정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.04.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 국가정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.04.29  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom3100Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
	// 국가정보 조회
	@PostMapping(value = "/co/sys/org/selectCom3100List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3100List(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom3100List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_COM3100_Q");
			resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom3100List=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 국가정보 신규
	@PostMapping(value = "/co/sys/org/insertCom3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3100_S");
			resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============insertCom3100=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 국가정보 수정
	@PostMapping(value = "/co/sys/org/updateCom3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCom3100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateCom3100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3100_S");
			resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============updateCom3100=====end========");
		return getSuccessResponseEntity(resultMap);
	}	
}
