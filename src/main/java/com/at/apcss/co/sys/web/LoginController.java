package com.at.apcss.co.sys.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	//@Resource(name = "comMenuService")
	//private ComMenuService comMenuService;
	
	@RequestMapping("/login.do")
	public String doLogin(Model model, HttpSession httpSession) {
		
		return "main/login";
	}
}
