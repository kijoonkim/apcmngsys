package com.at.apcma.hr.hra.web;

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
public class ApcMaHra8400Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;

	// 공통코드 정보 조회
	@PostMapping(value = "/hr/hra/selectHra8400Q.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHra8400Q(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectHra8400Q=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_HRA8400_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectHra8400Q=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}





	// 공통코드 정보 - 그룹코드 내역 신규
	@PostMapping(value = "/hr/hra/insertHra8400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertHra8400(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============insertHra8400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_HRA8400_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============insertHra8400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	// 공통코드 정보 - 그룹코드 내역 신규
		@PostMapping(value = "/hr/hra/insertHra8400S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertHra8400S1(
				@RequestBody Map<String, Object> param
				,Model model
				,HttpSession session
				,HttpServletRequest request) throws Exception{

			logger.info("=============insertHra8400=====start========");
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			try {

				param.put("procedure", 		"P_HRA8400_S1");
				resultMap = apcMaCommDirectService.callProc(param, session, request, "");

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			logger.info("=============insertHra8400=====end========");
			return getSuccessResponseEntityMa(resultMap);
		}



}
