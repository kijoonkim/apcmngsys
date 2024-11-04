package com.at.apcma.fi.ftr.trl.web;

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
 * 차입금원장등록 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.10.17
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 차입금원장등록(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.10.17  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaTrl1010Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 차입금원장등록 조회
	@PostMapping(value = "/fi/ffa/alm/selectTrl1010List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTrl1010List(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectTrl1010List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_TRL1010_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectTrl1010List=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 차입금원장등록 조회
	@PostMapping(value = "/fi/ffa/alm/insertTrl1010.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertTrl1010(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============insertTrl1010=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_TRL1010_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============insertTrl1010=====end========");
		return getSuccessResponseEntity(resultMap);
	}


	// 수당기준 적용기준 상세 저장
	@PostMapping(value = "/fi/ffa/alm/insertTrl1010S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertTrl1010S1(
			@RequestBody Map<String, Object> param
			, Model model
			, HttpSession session
			, HttpServletRequest request) throws Exception{

		logger.info("=============insertTrl1010S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_TRL1010_S1");

			logger.info("=============insertTrl1010S1=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}
	
	
}
