package com.phoenix.mvc.web.cafe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CafeTabContoller {
	public CafeTabContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("/cafe/main")
	public String cafeMain() {
		System.out.println("/cafe/main입니다.");
		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}
}
