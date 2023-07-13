package com.at.apcss.am.cmns.web;


import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class PltBxApiController extends BaseController{

	@Resource(name = "pltBxService")
	private PltBxService pltBxService;
}
