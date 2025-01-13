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
import com.at.apcss.pd.hisPopup.service.IsoPurSalHisPopupService;
import com.at.apcss.pd.hisPopup.vo.IsoPurSalVO;

@Controller
public class IsoPurSalHisPopupController extends BaseController{

	@Resource(name= "IsoPurSalHisPopupService")
	private IsoPurSalHisPopupService IsoPurSalHisPopupService;

	//화면이동
	@RequestMapping(value = "/pd/hisPopup/IsoPurSalHisPopup.do")
	public String IsoPurSalHisPopup() {
		return "apcss/pd/hisPopup/IsoPurSalHisPopup";
	}

	//출자출하조직 전문품목 매입 매출 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisIsoPurSal2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisIsoPurSal2024(Model model, @RequestBody IsoPurSalVO IsoPurSalVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<IsoPurSalVO> resultList = new ArrayList<>();
		try {
			 resultList = IsoPurSalHisPopupService.selectHisIsoPurSal2024(IsoPurSalVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//출자출하조직 전문품목 매입 매출 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisIsoPurSal2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisIsoPurSal2025(Model model, @RequestBody IsoPurSalVO IsoPurSalVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<IsoPurSalVO> resultList = new ArrayList<>();
		try {
			 resultList = IsoPurSalHisPopupService.selectHisIsoPurSal2025(IsoPurSalVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
