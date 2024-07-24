package com.at.apcss.co.ognz.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.ognz.service.UntyOgnzService;
import com.at.apcss.co.ognz.vo.UntyOgnzVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : UntyOgnzController.java
 * @Description : 통합조직에 대한 Controller 클래스
 * @author 신정철
 * @since 2024.07.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.22  신정철        최초 생성
 * </pre>
 */
@Controller
public class UntyOgnzController extends BaseController {

	@Resource(name = "untyOgnzService")
	private UntyOgnzService untyOgnzService;
	
	// 통합조직 트리 목록 조회
	@PostMapping(value = "/co/ognz/selectUntyOgnzTreeList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUntyOgnzTreeList(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<UntyOgnzVO> resultList = new ArrayList<UntyOgnzVO>();
		try {
			 resultList = untyOgnzService.selectUntyOgnzTreeList(untyOgnzVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
		
	}	
	
	
	// 통합조직  등록
	@PostMapping(value = "/co/ognz/insertUntyOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUntyOgnz(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {

			untyOgnzVO.setSysFrstInptUserId(getUserId());
			untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
			untyOgnzVO.setSysLastChgUserId(getUserId());
			untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = untyOgnzService.insertUntyOgnz(untyOgnzVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
	// 통합조직  변경
	@PostMapping(value = "/co/ognz/updateUntyOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUntyOgnz(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			untyOgnzVO.setSysFrstInptUserId(getUserId());
			untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
			untyOgnzVO.setSysLastChgUserId(getUserId());
			untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = untyOgnzService.updateUntyOgnz(untyOgnzVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
	// 통합조직 삭제
	@PostMapping(value = "/co/ognz/deleteUntyOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteUntyOgnz(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			untyOgnzVO.setSysFrstInptUserId(getUserId());
			untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
			untyOgnzVO.setSysLastChgUserId(getUserId());
			untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = untyOgnzService.deleteUntyOgnz(untyOgnzVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
}
