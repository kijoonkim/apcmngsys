package com.at.apcss.pd.pcorm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluFndsMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;

@Controller
public class PrdcrCrclOgnVluFndsMngController extends BaseController{

	@Resource(name= "prdcrCrclOgnVluFndsMngService")
	private PrdcrCrclOgnVluFndsMngService prdcrCrclOgnVluFndsMngService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/PrdcrCrclOgnVluFndsMng.do")
	public String PrdcrCrclOgnVluFndsMng() {
		return "apcss/pd/pcorm/PrdcrCrclOgnVluFndsMng";
	}

	// 조회
	@PostMapping(value = "/pd/pcorm/selectScoreList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectScoreList(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluFndsMngService.selectScoreList(prdcrCrclOgnVluFndsMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}




}
