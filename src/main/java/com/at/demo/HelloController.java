package com.at.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping("/demo/hello.do")
	public String helloWorld() {
		System.out.println("hello!!!!!!!!!!");
		return "demo/hello";
	}
	
}
