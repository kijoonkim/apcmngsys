package com.at.apcma.co.sys.com.web;

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
 * 공통코드 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 공통코드 조회(Commonness Code) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.05.29  천용진     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom3000Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
	
	// 공통코드 정보 조회
	@PostMapping(value = "/co/sys/com/selectCom3000List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3000List(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom3000List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_COM3000_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom3000List=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 공통코드 정보 조회
	@PostMapping(value = "/co/sys/com/selectCom3000Q1List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3000Q1List(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============selectCom3000Q1List=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3000_Q1");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============selectCom3000Q1List=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 공통코드 정보 삭제
	@PostMapping(value = "/co/sys/com/deleteCom3000.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCom3000(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteCom3000=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3000_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============deleteCom3000=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 공통코드 정보 - 그룹코드 내역 신규
	@PostMapping(value = "/co/sys/com/insertCom3000.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3000(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3000=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3000_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============insertCom3000=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 공통코드 정보 - 그룹코드 내역 수정
	@PostMapping(value = "/co/sys/com/updateCom3000.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCom3000(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============updateCom3000=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3000_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============updateCom3000=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 공통코드 정보 - 세부코드 정보 수정
    @PostMapping(value = "/co/sys/com/updateCom3000_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateCom3000_S1(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============updateCom3000_S1=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "SP_COM3000_S1");

            logger.info("=============updateCom3000_S1=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
        	logger.info("=============updateCom3000_S1=====ERROR========");
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }
    }
	
	// 공통코드 정보 - 그룹코드 내역 수정
	@PostMapping(value = "/co/sys/com/deleteCom3000_S1.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCom3000_S1(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteCom3000_S1=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"SP_COM3000_S1");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============deleteCom3000_S1=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	

}
