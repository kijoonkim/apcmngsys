package com.at.apcma.fi.fia.web;

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
 * 공통코드 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.11
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 공통코드 조회(Commonness Code) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.07.11  박승진     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaFia5400Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;



	// 감가상각 일시중지 등록 저장
	@PostMapping(value = "/fi/fia/insertFia5400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFIA5400(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============insertFIA5400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA5400_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============insertFIA5400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 감가상각 일시중지 등록 조회
	@PostMapping(value = "/fi/fia/selectFia5400Q.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFIA5400(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectFIA5400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA5400_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFIA5400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}



}
