package com.phoenix.mvc.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping("/common/needLogin")
	public String needLogin() {
		return "troubleShooting/needLogin";
	}
	
	@RequestMapping("/common/restrict")
	public String needTime() {
		return "troubleShooting/restrict";
	}
}
