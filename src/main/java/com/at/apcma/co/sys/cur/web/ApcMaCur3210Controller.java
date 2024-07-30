package com.at.apcma.co.sys.cur.web;

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
 * 환율 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.13
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 환율 조회 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 * @ 2024.05.13   	표주완		최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCur3210Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 환율 조회
	@PostMapping(value = "/co/sys/cur/selectCom3210.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3210(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom3210=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_COM3210_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom3210=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 환율 정보 저장
	@PostMapping(value = "/co/sys/cur/insertCom3210_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3210_S1(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3210_S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3210_S1");
					
			logger.info("=============insertCom3210_S1=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 환율 정보 저장
	@PostMapping(value = "/co/sys/cur/insertCom3210_S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3210_S2(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3210_S2=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3210_S2");
			
			logger.info("=============insertCom3210_S2=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
}
