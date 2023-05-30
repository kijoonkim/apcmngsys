package com.at.apcss.co.cd.web;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.cd.service.ComCdService;

@RestController
public class CoCdComCdApiController {


	@Resource(name = "comCdService")
	private ComCdService comCdService;
	
	


}
