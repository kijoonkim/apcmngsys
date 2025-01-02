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
 * 달력 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.04
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 달력 조회 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.07.04  천용진     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom2400Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 달력 조회
	@PostMapping(value = "/co/sys/cal/selectCom2400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom2400(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom2400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_COM2400_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom2400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 달력 정보 저장
	@PostMapping(value = "/co/sys/cal/insertCom2400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom2400(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom2400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM2400_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============insertCom2400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
}
