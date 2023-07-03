package com.at.apcss.co.menu.web;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.sys.controller.BaseController;

@Controller
public class ComMenuController extends BaseController {

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	// 메뉴 관리
	@RequestMapping("/co/menu/menuMng.do")
	public String doMenu() {

		return "apcss/co/menu/comMenuManage";
	}

	// 화면 관리
	@RequestMapping("/co/menu/uiMng.do")
	public String doUi() {

		return "apcss/co/menu/comUiManage";
	}
}
