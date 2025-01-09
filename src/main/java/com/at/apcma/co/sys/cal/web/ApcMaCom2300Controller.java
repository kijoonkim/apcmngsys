package com.at.apcma.co.sys.cal.web;

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
import java.util.*;

/**
 * 달력 정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.01
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 달력 정보 조회 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.07.01  천용진     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom2300Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 달력 정보 조회
	@PostMapping(value = "/co/sys/cal/selectCom2300.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom2300(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom2300=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_COM2300_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom2300=====end========");
//		return getSuccessResponseEntityMa(resultMap);
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 달력 정보 저장 - 마스터 그리드
	@PostMapping(value = "/co/sys/cal/insertCom2300.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom2300(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom2300=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM2300_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============insertCom2300=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 달력 정보 저장, 수정, 삭제 - 서브 그리드
	@PostMapping(value = "/co/sys/cal/updateCom2300_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCom2300_S1(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateCom2300_S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "SP_COM2300_S1");
			
            logger.info("=============updateCom2300_S1=====end========");
            return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
	}	
	
	// 달력 정보 삭제
	@PostMapping(value = "/co/sys/cal/deleteCom2300.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCom2300(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteCom2300=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM2300_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============deleteCom2300=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
}
