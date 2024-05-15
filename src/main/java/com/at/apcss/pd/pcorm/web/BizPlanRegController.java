package com.at.apcss.pd.pcorm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class BizPlanRegController extends BaseController{

	//@Resource(name= "BizPlanRegService")
	//private BizPlanRegService bizPlanRegService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/BizPlanReg.do")
	public String BizPlanReg() {
		return "apcss/pd/pcorm/BizPlanReg";
	}

}
