package com.at.apcma.co.sys.cal.web;

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
 * 회기 정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.06.27
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 회기 정보 조회 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.06.27  천용진     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom2100Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
	
	// 회기 정보 조회
	@PostMapping(value = "/co/sys/cal/selectCom2100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom2100(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom2100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			Map<String, Object> gmap3 = (HashMap<String, Object>)session.getAttribute("maSessionInfo");
			param.put("procedure", 		"SP_COM2100_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom2100=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 회기 정보 저장
	@PostMapping(value = "/co/sys/cal/updateCom2100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCom2100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateCom2100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "SP_COM2100_S");
			
            logger.info("=============updateCom2100=====end========");
            return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
	}	
	
	// 회기 정보 삭제
	@PostMapping(value = "/co/sys/cal/deleteCom2100.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCom2100(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteCom2100=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM2100_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============deleteCom2100=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	

}
