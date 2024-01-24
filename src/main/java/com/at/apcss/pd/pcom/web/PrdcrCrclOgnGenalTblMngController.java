package com.at.apcss.pd.pcom.web;

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
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnGenalTblMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnGenalTblMngVO;

@Controller
public class PrdcrCrclOgnGenalTblMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnGenalTblMngService")
	private PrdcrCrclOgnGenalTblMngService PrdcrCrclOgnGenalTblMngService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnGenalTblMng.do")
	public String PrdcrCrclOgnGenalTblMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnGenalTblMng";
	}

	// 통합조직 리스트 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngUoList(Model model, @RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 총괄표 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngList(Model model, @RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngList(PrdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
