package com.at.apcma.co.sys.org.web;

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
 * 원가중심점 정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.08
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 원가중심점 정보 조회 >>
 *
 *  수정일      		수정자		수정내용
 *  ----------		----------	---------------------------
 * @ 2024.08.08   	천용진		최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaOrg3100Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 원가중심점 정보 조회
	@PostMapping(value = "/co/sys/org/selectOrg3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectOrg3100(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectOrg3100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_ORG3100_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
				
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectOrg3100=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 원가중심점 정보 - 기본정보, 관리항목 저장
	@PostMapping(value = "/co/sys/org/updateOrg3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateOrg3100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateOrg3100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_ORG3100_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
			logger.info("=============updateOrg3100=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 원가중심점 정보 삭제
	@PostMapping(value = "/co/sys/org/deleteOrg3100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteOrg3100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteOrg3100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_ORG3100_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
			logger.info("=============deleteOrg3100=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
}
