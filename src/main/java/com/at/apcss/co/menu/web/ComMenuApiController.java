package com.at.apcss.co.menu.web;

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

import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 메뉴정보 처리하는 컨트롤러 클래스
 * @author SI개발부 신정철
 * @since 2023.05.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.05.24  박지욱     	최초 생성
 *
 *  </pre>
 */
@RestController
public class ComMenuApiController extends BaseController {
	
	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;
	
	@GetMapping(value = "/co/menu/menus/{id}")
	@ResponseBody
	public HashMap<String, Object> selectMenuById(@PathVariable String id, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		logger.debug("param ID: {}", id);
		
		ComMenuVO comMenuResultVO = comMenuService.selectComMenu(id);
		
		if (comMenuResultVO != null && !EgovStringUtil.isEmpty(comMenuResultVO.getMenuId())) {
			logger.debug("comUser info {} {}", comMenuResultVO.getMenuId(), comMenuResultVO.getMenuNm());
			logger.debug(comMenuResultVO.toString());
			
			resultMap.put("resultVO", comMenuResultVO);
			resultMap.put("resultCode", "200");
			resultMap.put("resultMessage", "성공 !!!");
		} else {
			resultMap.put("resultVO", comMenuResultVO);
			resultMap.put("resultCode", "500");
			resultMap.put("resultMessage", "메뉴정보없음");
			// resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
		}
		
		return resultMap;
	}
	
	@PostMapping(value = "/co/menu/menus", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectComMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComMenuVO> resultList = comMenuService.selectComMenuList(comMenuVO);
		
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
		
		return resultMap;
	}
	
	@PostMapping(value = "/co/menu/menuTree", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public HashMap<String, Object> selectMenuTreeList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComMenuVO> resultList = comMenuService.selectMenuTreeList(comMenuVO);
		
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
		
		return resultMap;
	}
	
}
