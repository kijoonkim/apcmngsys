package com.at.apcss.co.authrt.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.authrt.service.ComAuthService;
import com.at.apcss.co.authrt.vo.ComAuthMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthUiVO;
import com.at.apcss.co.authrt.vo.ComAuthUserVO;
import com.at.apcss.co.authrt.vo.ComAuthVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 권한정보 처리하는 컨트롤러 클래스
 * @author SI개발부 신정철
 * @since 2023.05.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.05.26  신정철     	최초 생성
 *
 *  </pre>
 */
@RestController
public class ComAuthApiController extends BaseController {

	@Resource(name = "comAuthService")
	private ComAuthService comAuthService; 

	
	@GetMapping(value = "/co/authrt/authrts/{id}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> selectComAuthById(@PathVariable String id, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		ComAuthVO comAuthResultVO;
		
		try {
			comAuthResultVO = comAuthService.selectComAuth(id);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_MAP, comAuthResultVO);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authrts", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthList(@RequestBody ComAuthVO comAuthVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComAuthVO> resultList;
		
		try {
			resultList = comAuthService.selectComAuthList(comAuthVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authMenus", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthMenuList(@RequestBody ComAuthMenuVO comAuthMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthMenuVO> resultList;
		
		try {
			resultList = comAuthService.selectComAuthMenuList(comAuthMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authUis", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthUiList(@RequestBody ComAuthUiVO comAuthUiVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthUiVO> resultList;
		
		try {
			resultList = comAuthService.selectComAuthUiList(comAuthUiVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authMenuTree", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthMenuTreeList(@RequestBody ComAuthMenuVO comAuthMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComAuthMenuVO> resultList;
		
		try {
			resultList = comAuthService.selectComAuthMenuTreeList(comAuthMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/authrt/authUsers", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthUserList(@RequestBody ComAuthUserVO comAuthUserVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComAuthUserVO> resultList;
		
		try {
			resultList = comAuthService.selectComAuthUserList(comAuthUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
}
