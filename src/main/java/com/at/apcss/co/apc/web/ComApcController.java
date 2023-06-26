package com.at.apcss.co.apc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.apc.service.ComApcService;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class ComApcController extends BaseController{

	@Resource(name = "comApcService")
	private ComApcService comApcService;

	@RequestMapping(value = "/co/apc/apcMng.do")
	public String doApc() {
		return "apcss/co/apc/comApcManage";
	}

	@RequestMapping(value = "/co/guide/comGuideComponent.do")
	public String doGuideComponent() {
		logger.debug("GuideComponent page 호출 ");
		return "apcss/co/guide/comGuideComponent";
	}

	@RequestMapping(value = "/co/guide/comGuideGrid.do")
	public String doGuideGrid() {
		logger.debug("comGuideGrid page 호출 ");
		return "apcss/co/guide/comGuideGrid";
	}
}
