package com.at.apcss.pd.hisPopup.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.hisPopup.service.UoSpItmPurSalNHisPopupService;
import com.at.apcss.pd.hisPopup.vo.UoSpItmPurSalVO;

@Controller
public class UoSpItmPurSalNHisPopupController extends BaseController{

	@Resource(name= "UoSpItmPurSalNHisPopupService")
	private UoSpItmPurSalNHisPopupService UoSpItmPurSalNHisPopupService;

	//화면이동
	@RequestMapping(value = "/pd/hisPopup/UoSpItmPurSalNHisPopup.do")
	public String UoSpItmPurSalNHisPopup() {
		return "apcss/pd/hisPopup/UoSpItmPurSalNHisPopup";
	}

	//출자출하조직 전문품목 매입 매출 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisUoSpItmPurSalN2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisUoSpItmPurSalN2024(Model model, @RequestBody UoSpItmPurSalVO UoSpItmPurSalVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<UoSpItmPurSalVO> resultList = new ArrayList<>();
		try {
			 resultList = UoSpItmPurSalNHisPopupService.selectHisUoSpItmPurSalN2024(UoSpItmPurSalVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//출자출하조직 전문품목 매입 매출 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisUoSpItmPurSalN2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisUoSpItmPurSalN2025(Model model, @RequestBody UoSpItmPurSalVO UoSpItmPurSalVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<UoSpItmPurSalVO> resultList = new ArrayList<>();
		try {
			 resultList = UoSpItmPurSalNHisPopupService.selectHisUoSpItmPurSalN2025(UoSpItmPurSalVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
