package com.at.apcma.co.sys.com.web;

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
 * 거래처정보 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.08.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 통화 조회 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 * @ 2024.08.29   	천용진		최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaCom3400Controller extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;
    
	// 거래처정보 조회
	@PostMapping(value = "/co/sys/com/selectCom3400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3400(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom3400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_COM3400_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom3400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 거래처정보 저장
	@PostMapping(value = "/co/sys/com/insertCom3400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_COM3400_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============insertCom3400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 거래처정보 삭제
	@PostMapping(value = "/co/sys/com/deleteCom3400.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCom3400(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============deleteCom3400=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_COM3400_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============deleteCom3400=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 직원거래처 정보 조회
	@PostMapping(value = "/co/sys/com/selectCom3400_IF_Q.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3400_IF_Q(
    		@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============selectCom3400_IF_Q=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_COM3400_EMP_IF_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============selectCom3400_IF_Q=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 직원거래처 정보 생성
	@PostMapping(value = "/co/sys/com/selectCom3400_IF_S.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCom3400_IF_S(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============selectCom3400_IF_S=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_COM3400_EMP_IF_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============selectCom3400_IF_S=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	
	// 수취인확인
	@PostMapping(value = "/co/sys/com/financeName.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> financeName(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============financeName=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FBSNAME_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============financeName=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}	
	
	// 확정 버튼
	@PostMapping(value = "/co/sys/com/insertCom3400_S2.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S2(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S2=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S2");
					
			logger.info("=============insertCom3400_S2=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 변경이력관리 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S3.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S3(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S3=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S3");
			
			logger.info("=============insertCom3400_S3=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 자금정보 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S4.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S4(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S4=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S4");
			
			logger.info("=============insertCom3400_S4=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 구매정보 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S5.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S5(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S5=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S5");
			
			logger.info("=============insertCom3400_S5=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 판매정보 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S6.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S6(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S6=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S6");
			
			logger.info("=============insertCom3400_S6=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 판매납품처 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S7.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S7(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S7=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S7");
			
			logger.info("=============insertCom3400_S7=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 판매처분류 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S8.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S8(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S8=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S8");
			
			logger.info("=============insertCom3400_S8=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	
	
	// 매핑이력 그리드 저장
	@PostMapping(value = "/co/sys/com/insertCom3400_S9.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCom3400_S9(
			@RequestBody Map<String, Object> param
			,Model model
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============insertCom3400_S9=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			resultMap = apcMaComService.processForListData(param, session, request, "", "P_COM3400_S9");
			
			logger.info("=============insertCom3400_S9=====end========");
			return getSuccessResponseEntityMa(resultMap);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
	}	

}
