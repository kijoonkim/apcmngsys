package com.at.apcss.co.menu.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.menu.vo.ComUiVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ComMenuController extends BaseController {

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	@RequestMapping("/co/menu/openPage.do/{menuId}")
	public String doOpenPage(Model model, @PathVariable String menuId, HttpServletRequest request) throws Exception {

		String pageUrl = ComConstants.CON_BLANK;

		try {
			ComMenuVO pageVO = comMenuService.selectComMenu(menuId);

			if (pageVO != null) {
				pageUrl = pageVO.getPageUrl();
			}

			ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
			BeanUtils.copyProperties(pageVO, comUiJsonVO);
			ObjectMapper objMapper = new ObjectMapper();
			String jsonString = objMapper.writeValueAsString(comUiJsonVO);
			model.addAttribute("comUiJson", jsonString);

			model.addAttribute("comMenuVO", pageVO);

			model.addAttribute("reportDbName", getReportDbName());
			model.addAttribute("reportUrl", getReportUrl());
			model.addAttribute("reportType", getReportType());
			model.addAttribute("reportPath", getReportPath());

			request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, menuId);

			//model.addAttribute("comApcList", request.getSession().getAttribute("comApcList"));

		} catch( Exception e) {
		}

		return "apcss/" + pageUrl;
	}// 메뉴 목록 조회
	@PostMapping(value = "/co/menu/selectMenuList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComMenuVO> resultList = new ArrayList<ComMenuVO>();
		try {
			 resultList = comMenuService.selectMenuList(comMenuVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 등록
	@PostMapping(value = "/co/menu/insertMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("insertNenu 호출 :: ");

		int insertedCnt =0;
		try {
			// 임시
			comMenuVO.setSysFrstInptUserId(getUserId());
			comMenuVO.setSysFrstInptPrgrmId(getPrgrmId());
			comMenuVO.setSysLastChgUserId(getUserId());
			comMenuVO.setSysLastChgPrgrmId(getPrgrmId());
			insertedCnt = comMenuService.insertMenu(comMenuVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 수정
	@PostMapping(value = "/co/menu/updateMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("updateMenu 호출 :: ");

		int updatedCnt =0;
		try {
			// 임시
			comMenuVO.setSysLastChgUserId(getUserId());
			comMenuVO.setSysLastChgPrgrmId(getPrgrmId());
			updatedCnt = comMenuService.updateMenu(comMenuVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 삭제
	@PostMapping(value = "/co/menu/deleteMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("deleteMenu 호출 :: ");
		int deletedCnt =0;
		try {
			deletedCnt = comMenuService.deleteMenu(comMenuVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 화면관리 메뉴 목록 조회
	@PostMapping(value = "/co/menu/selectMenuUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuUiList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("selectMenuUiList 호출 :: ");
		List<ComMenuVO> resultList = new ArrayList<>();
		try {
			resultList = comMenuService.selectMenuUiList(comMenuVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 화면관리 UI 목록 조회
	@PostMapping(value = "/co/menu/selectComUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUiList(@RequestBody ComUiVO comUiVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("selectMenuUiList 호출 :: ");
		List<ComUiVO> resultList = new ArrayList<>();
		try {
			resultList = comMenuService.selectComUiList(comUiVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	// 화면관리 UI 등록
	@PostMapping(value = "/co/menu/insertComUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComUiList(@RequestBody List<ComUiVO> comUiList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("insertComUiList 호출 :: ");
		int insertdCnt = 0;
		try {
			for(ComUiVO comUiVO : comUiList) {
				comUiVO.setSysFrstInptUserId(getUserId());
				comUiVO.setSysFrstInptPrgrmId(getPrgrmId());
				comUiVO.setSysLastChgUserId(getUserId());
				comUiVO.setSysLastChgPrgrmId(getPrgrmId());
				insertdCnt =+  comMenuService.insertComUi(comUiVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertdCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 화면관리 UI 멀티 저장
	@PostMapping(value = "/co/menu/multiSaveComUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveComUiList(@RequestBody List<ComUiVO> comUiList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int insertdCnt = 0;
		try {
			for(ComUiVO comUiVO : comUiList) {
				comUiVO.setSysFrstInptUserId(getUserId());
				comUiVO.setSysFrstInptPrgrmId(getPrgrmId());
				comUiVO.setSysLastChgUserId(getUserId());
				comUiVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			insertdCnt = comMenuService.multiSaveComUiList(comUiList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertdCnt);

		return getSuccessResponseEntity(resultMap);
	}
	// 화면관리 UI 삭제
	@PostMapping(value = "/co/menu/deleteComUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComUiList(@RequestBody List<ComUiVO> comUiList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int deletetCnt = 0;
		try {
			for(ComUiVO comUiVO : comUiList) {
				deletetCnt =+ comMenuService.deleteComUi(comUiVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletetCnt);

		return getSuccessResponseEntity(resultMap);
	}

}
