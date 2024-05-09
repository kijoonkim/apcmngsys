package com.at.apcma.com.web;

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

/**
 * 경영정보 공통업무를 처리하는 컨트롤러 클래스
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
public class ApcMaComController extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
	//select 조회
	@PostMapping(value = "/com/comSelectList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> comSelectList(
    		@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpServletRequest request) throws Exception{

		logger.info("=============comSelectList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_ESS_BIZCOMP_Q");
			resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============comSelectList=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
}
