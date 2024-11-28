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
public class ApcMaFia4300Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;

	// 공통코드 정보 조회
	@PostMapping(value = "/fi/fia/selectFia4300Q.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia4300Q(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectFia4300Q=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFia4300Q=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	//
		@PostMapping(value = "/fi/fia/selectFia4300Q1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectFia4300Q1(
	    		@RequestBody Map<String, Object> param
				,Model model
				,HttpSession session
				,HttpServletRequest request) throws Exception{

			logger.info("=============selectFia4300Q1=====start========");
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			try {

				param.put("procedure", 		"P_FIA4300_Q1");
				resultMap = apcMaCommDirectService.callProc(param, session, request, "");

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			logger.info("=============selectFia4300Q1=====end========");
			return getSuccessResponseEntityMa(resultMap);
	}
	// 공통코드 정보 조회
	@PostMapping(value = "/fi/fia/selectFia4300S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia4300S(
		@RequestBody Map<String, Object> param
		,Model model
		,HttpSession session
		,HttpServletRequest request) throws Exception{

		logger.info("=============selectFia4300S=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFia4300S=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 조회
	@PostMapping(value = "/fi/fia/selectFia4300S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia4300S1(
		@RequestBody Map<String, Object> param
		,Model model
		,HttpSession session
		,HttpServletRequest request) throws Exception{

		logger.info("=============selectFia4300S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S1");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFia4300S1=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 조회
	@PostMapping(value = "/fi/fia/selectFia4300S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFia4300S2(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectFia4300S2=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S2");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectFia4300S2=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 삭제
	@PostMapping(value = "/fi/fia/deleteFIA3000.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFIA4300(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============deleteFIA4300=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============deleteFIA4300=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 - 그룹코드 내역 신규
	@PostMapping(value = "/fi/fia/insertFia4300.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFIA4300(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============insertFIA4300=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============insertFIA4300=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 - 그룹코드 내역 수정
	@PostMapping(value = "/fi/fia/updateFia4300.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFIA4300(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============updateFIA4300=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============updateFIA4300=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 - 세부코드 정보 수정
	@PostMapping(value = "/fi/fia/updateFia4300_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFIA4300_S1(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============updateFIA4300_S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FIA4300_S1");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============updateFIA4300_S1=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

}
