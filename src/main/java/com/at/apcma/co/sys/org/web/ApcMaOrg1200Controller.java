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
 * 사업단위 정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.06
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 사업단위 정보 조회 >>
 *
 *  수정일      		수정자		수정내용
 *  ----------		----------	---------------------------
 * @ 2024.08.06   	천용진		최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaOrg1200Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 신고사업장 정보 조회
	@PostMapping(value = "/co/sys/org/selectOrg1200.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectOrg1200(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectOrg1200=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_ORG1200_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
				
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectOrg1200=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 신고사업장 정보 정보 저장
	@PostMapping(value = "/co/sys/org/insertOrg1200.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertOrg1200(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertOrg1200=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_ORG1200_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
			logger.info("=============insertOrg1200=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
	}	
	
}
