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
import com.at.apcss.pd.hisPopup.service.UoGenalTblHisPopupService;
import com.at.apcss.pd.hisPopup.vo.UoGenalTblVO;

@Controller
public class UoGenalTblHisPopupController extends BaseController{

	@Resource(name= "UoGenalTblHisPopupService")
	private UoGenalTblHisPopupService UoGenalTblHisPopupService;

	//화면이동
	@RequestMapping(value = "/pd/hisPopup/UoGenalTblHisPopup.do")
	public String UoGenalTblHisPopup() {
		return "apcss/pd/hisPopup/UoGenalTblHisPopup";
	}

	//통합조직 총괄표 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisUoGenalTbl2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisUoGenalTbl2024(Model model, @RequestBody UoGenalTblVO UoGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<UoGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = UoGenalTblHisPopupService.selectHisUoGenalTbl2024(UoGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//통합조직 총괄표 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisUoGenalTbl2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisUoGenalTbl2025(Model model, @RequestBody UoGenalTblVO UoGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<UoGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = UoGenalTblHisPopupService.selectHisUoGenalTbl2025(UoGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//통합조직 부류별 합계 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisUoClsfTot2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisUoClsfTot2025(Model model, @RequestBody UoGenalTblVO UoGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<UoGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = UoGenalTblHisPopupService.selectHisUoClsfTot2025(UoGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
