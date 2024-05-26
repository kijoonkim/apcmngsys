package com.at.apcss.pd.pcorm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.SrvyService;
import com.at.apcss.pd.pcorm.vo.SrvyVO;

@Controller
public class SrvyController extends BaseController{

	@Resource(name= "SrvyService")
	private SrvyService srvyService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/Srvy.do")
	public String BizPlanReqMng() {
		return "apcss/pd/pcorm/Srvy";
	}

	// 설문조사 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectSrvyList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSrvyList(@RequestBody SrvyVO srvyVO, HttpServletRequest request) throws Exception{
		logger.debug("==============selectSrvyReqMngList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SrvyVO> resultList = new ArrayList<>();
		try {
			resultList = srvyService.selectSrvyList(srvyVO);
			System.out.println(resultList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
