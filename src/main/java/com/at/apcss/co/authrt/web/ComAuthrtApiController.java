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

import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUiVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
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
public class ComAuthrtApiController extends BaseController {

	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService; 

	
	@GetMapping(value = "/co/authrt/authrts/{id}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtById(@PathVariable String id, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		ComAuthrtVO comAuthrtResultVO;
		
		try {
			comAuthrtResultVO = comAuthrtService.selectComAuthrt(id);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_MAP, comAuthrtResultVO);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authrts", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtList(@RequestBody ComAuthrtVO comAuthVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComAuthrtVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtList(comAuthVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authrtMenus", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtMenuList(@RequestBody ComAuthrtMenuVO comAuthrtMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtMenuVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtMenuList(comAuthrtMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authrtUis", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtUiList(@RequestBody ComAuthrtUiVO comAuthrtUiVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtUiVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtUiList(comAuthrtUiVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/authrtMenuTree", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtMenuTreeList(@RequestBody ComAuthrtMenuVO comAuthrtMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComAuthrtMenuVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtMenuTreeList(comAuthrtMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/authrt/authrtUsers", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtUserList(@RequestBody ComAuthrtUserVO comAuthrtUserVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComAuthrtUserVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtUserList(comAuthrtUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
}
