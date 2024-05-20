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
import com.at.apcss.pd.pcorm.service.BizPlanReqMngService;
import com.at.apcss.pd.pcorm.vo.BizPlanReqMngVO;

@Controller
public class BizPlanReqMngController extends BaseController{

	@Resource(name= "BizPlanReqMngService")
	private BizPlanReqMngService bizPlanReqMngService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/BizPlanReqMng.do")
	public String BizPlanReqMng() {
		return "apcss/pd/pcorm/BizPlanReqMng";
	}


	// 조회
	@PostMapping(value = "/pd/bsm/selectBizPlanReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBizPlanReqMngList(Model model, @RequestBody BizPlanReqMngVO bizPlanReqMngVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectBizPlanReqMngList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanReqMngVO> resultList = new ArrayList<>();
		try {
			resultList = bizPlanReqMngService.selectBizPlanReqMngList(bizPlanReqMngVO);
			System.out.println(resultList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
