package com.at.apcss.pd.pcorm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class BizPlanReqMngController extends BaseController{

	//@Resource(name= "BizPlanReqMngService")
	//private BizPlanReqMngService bizPlanReqMngService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/BizPlanReqMng.do")
	public String BizPlanReqMng() {
		return "apcss/pd/pcorm/BizPlanReqMng";
	}

}
