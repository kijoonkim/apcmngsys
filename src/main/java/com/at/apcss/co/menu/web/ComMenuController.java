package com.at.apcss.co.menu.web;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class ComMenuController extends BaseController {

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	@RequestMapping("/co/menu/menuMng.do")
	public String doMain() {

		return "apcss/co/menu/comMenuManage";
	}

	// 메뉴 목록 조회
	@PostMapping(value = "/co/menu/selectMenuList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComMenuVO> resultList = new ArrayList<ComMenuVO>();
		try {
			 resultList = comMenuService.selectMenuList(comMenuVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 등록
	@PostMapping(value = "/co/menu/insertMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("insertNenu 호출 :: ");

		// 임시
		comMenuVO.setSysFrstInptUserId("SYS");
		comMenuVO.setSysFrstInptPrgrmId("CO_001");
		comMenuVO.setSysLastChgUserId("SYS");
		comMenuVO.setSysLastChgPrgrmId("CO_001");
		int result = comMenuService.insertMenu(comMenuVO);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 수정
	@PostMapping(value = "/co/menu/updateMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("updateMenu 호출 :: ");

		// 임시
		comMenuVO.setSysLastChgUserId("SYS");
		comMenuVO.setSysLastChgPrgrmId("CO_001");
		int result = comMenuService.updateMenu(comMenuVO);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 삭제
	@PostMapping(value = "/co/menu/deleteMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("deleteMenu 호출 :: ");

		int result = comMenuService.deleteMenu(comMenuVO);
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}
}
