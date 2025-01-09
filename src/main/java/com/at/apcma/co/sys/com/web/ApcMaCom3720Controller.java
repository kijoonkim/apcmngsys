package com.at.apcma.co.sys.com.web;

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
import com.ibatis.sqlmap.engine.type.JdbcTypeRegistry;

/**
 * 프로젝트코드 정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.06.18
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 프로젝트코드 정보 조회 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.06.18  천용진     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom3720Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
	// 프로젝트코드 정보 조회
	@PostMapping(value = "/co/sys/com/selectCom3720.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3720(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom3720=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_COM3720_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom3720=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 프로젝트코드 정보 삭제
	@PostMapping(value = "/co/sys/com/deleteCom3720.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCom3720(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteCom3720=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3720_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============deleteCom3720=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 프로젝트코드 정보 신규
	@PostMapping(value = "/co/sys/com/insertCom3720.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3720(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3720=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3720_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============insertCom3720=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 프로젝트코드 정보 - 정보 수정
	@PostMapping(value = "/co/sys/com/updateCom3720.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCom3720(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateCom3720=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3720_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============updateCom3720=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 프로젝트코드 정보 - 상세내역 저장
	@PostMapping(value = "/co/sys/com/updateCom3720_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCom3720_S1(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateCom3720_S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3720_S1");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============updateCom3720_S1=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	

}
