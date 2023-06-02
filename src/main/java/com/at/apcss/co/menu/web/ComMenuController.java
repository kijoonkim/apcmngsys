package com.at.apcss.co.menu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComMenuController {

	@RequestMapping("/co/menu/menuMng.do")
	public String doMain() {
		return "apcss/co/menu/ComMenuManage";
	}
}
