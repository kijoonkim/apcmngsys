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
import com.at.apcss.pd.hisPopup.service.IsoGenalTblHisPopupService;
import com.at.apcss.pd.hisPopup.vo.IsoGenalTblVO;

@Controller
public class IsoGenalTblHisPopupController extends BaseController{

	@Resource(name= "IsoGenalTblHisPopupService")
	private IsoGenalTblHisPopupService IsoGenalTblHisPopupService;

	//화면이동
	@RequestMapping(value = "/pd/hisPopup/IsoGenalTblHisPopup.do")
	public String IsoGenalTblHisPopup() {
		return "apcss/pd/hisPopup/IsoGenalTblHisPopup";
	}

	//출자출하조직 총괄표 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisIsoGenalTbl2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisIsoGenalTbl2024(Model model, @RequestBody IsoGenalTblVO IsoGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<IsoGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = IsoGenalTblHisPopupService.selectHisIsoGenalTbl2024(IsoGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//출자출하조직 총괄표 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisIsoGenalTbl2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisIsoGenalTbl2025(Model model, @RequestBody IsoGenalTblVO IsoGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<IsoGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = IsoGenalTblHisPopupService.selectHisIsoGenalTbl2025(IsoGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//출자출하조직 부류별 합계 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisIsoClsfTot2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisIsoClsfTot2025(Model model, @RequestBody IsoGenalTblVO IsoGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<IsoGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = IsoGenalTblHisPopupService.selectHisIsoClsfTot2025(IsoGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
