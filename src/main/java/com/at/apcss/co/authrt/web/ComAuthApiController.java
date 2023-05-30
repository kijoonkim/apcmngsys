package com.at.apcss.co.authrt.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.string.EgovStringUtil;
import org.springframework.http.MediaType;
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
import com.at.apcss.co.menu.vo.ComMenuVO;
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
	public HashMap<String, Object> selectComAuthById(@PathVariable String id, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		logger.debug("param ID: {}", id);
		
		try {
			
			ComAuthVO comAuthResultVO = comAuthService.selectComAuth(id);
			
			if (comAuthResultVO != null && !EgovStringUtil.isEmpty(comAuthResultVO.getAuthrtId())) {
				logger.debug("comAuth info {}", comAuthResultVO.toString());
				
				resultMap.put("resultVO", comAuthResultVO);
				resultMap.put("resultCode", "200");
				resultMap.put("resultMessage", "성공 !!!");
			} else {
				resultMap.put("resultVO", comAuthResultVO);
				resultMap.put("resultCode", "500");
				resultMap.put("resultMessage", "메뉴정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch(Exception e) {
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", e.getMessage());
		} finally {
			
		}
		
		return resultMap;
	}
	
	@PostMapping(value = "/co/authrt/authrts", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComAuthList(@RequestBody ComAuthVO comAuthVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			List<ComAuthVO> resultList = comAuthService.selectComAuthList(comAuthVO);
			
			if (resultList != null) {			
				resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "200");
				resultMap.put("resultMessage", "성공 !!!");
			} else {
				//resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "500");
				resultMap.put("resultMessage", "메뉴정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch (Exception e) {
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", e.getMessage());
		} finally {
			
		}
		
		return resultMap;
	}
	
	@PostMapping(value = "/co/authrt/authMenus", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComAuthMenuList(@RequestBody ComAuthMenuVO comAuthMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			List<ComAuthMenuVO> resultList = comAuthService.selectComAuthMenuList(comAuthMenuVO);
			
			if (resultList != null) {			
				resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "200");
				resultMap.put("resultMessage", "성공 !!!");
			} else {
				//resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "500");
				resultMap.put("resultMessage", "메뉴정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch (Exception e) {
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", e.getMessage());
		} finally {
			
		}
		
		return resultMap;
	}
	
	@PostMapping(value = "/co/authrt/authUis", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComAuthUiList(@RequestBody ComAuthUiVO comAuthUiVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			List<ComAuthUiVO> resultList = comAuthService.selectComAuthUiList(comAuthUiVO);
			
			if (resultList != null) {			
				resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "200");
				resultMap.put("resultMessage", "성공 !!!");
			} else {
				//resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "500");
				resultMap.put("resultMessage", "메뉴정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch (Exception e) {
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", e.getMessage());
		} finally {
			
		}
		
		return resultMap;
	}
	
	@PostMapping(value = "/co/authrt/authUsers", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComAuthUserList(@RequestBody ComAuthUserVO comAuthUserVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			List<ComAuthUserVO> resultList = comAuthService.selectComAuthUserList(comAuthUserVO);
			
			if (resultList != null) {			
				resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "200");
				resultMap.put("resultMessage", "성공 !!!");
			} else {
				//resultMap.put("resultList", resultList);
				resultMap.put("resultCode", "500");
				resultMap.put("resultMessage", "메뉴정보없음");
				// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
			}
		} catch (Exception e) {
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", e.getMessage());
		} finally {
			
		}
		
		return resultMap;
	}
}
