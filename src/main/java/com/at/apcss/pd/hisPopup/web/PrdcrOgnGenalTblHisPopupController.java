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
import com.at.apcss.pd.hisPopup.service.PrdcrOgnGenalTblHisPopupService;
import com.at.apcss.pd.hisPopup.vo.PrdcrOgnGenalTblVO;

@Controller
public class PrdcrOgnGenalTblHisPopupController extends BaseController{

	@Resource(name= "PrdcrOgnGenalTblHisPopupService")
	private PrdcrOgnGenalTblHisPopupService PrdcrOgnGenalTblHisPopupService;

	//화면이동
	@RequestMapping(value = "/pd/hisPopup/PrdcrOgnGenalTblHisPopup.do")
	public String PrdcrOgnGenalTblHisPopup() {
		return "apcss/pd/hisPopup/PrdcrOgnGenalTblHisPopup";
	}

	//생산자조직 총괄표 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisPrdcrOgnGenalTbl2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisPrdcrOgnGenalTbl2024(Model model, @RequestBody PrdcrOgnGenalTblVO PrdcrOgnGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrOgnGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnGenalTblHisPopupService.selectHisPrdcrOgnGenalTbl2024(PrdcrOgnGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//생산자조직 총괄표 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisPrdcrOgnGenalTbl2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisPrdcrOgnGenalTbl2025(Model model, @RequestBody PrdcrOgnGenalTblVO PrdcrOgnGenalTblVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrOgnGenalTblVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnGenalTblHisPopupService.selectHisPrdcrOgnGenalTbl2025(PrdcrOgnGenalTblVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
