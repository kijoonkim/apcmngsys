package com.at.apcss.am.apc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class ApcEvrmntStngController extends BaseController{

	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	@RequestMapping(value = "/am/apc/apcEvrmntStng.do")
	public String doApc() {
		return "apcss/am/apc/apcEvrmntStng";
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
