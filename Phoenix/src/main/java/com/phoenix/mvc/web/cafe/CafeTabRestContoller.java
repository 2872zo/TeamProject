package com.phoenix.mvc.web.cafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.phoenix.mvc.service.cafe.CafeTabService;

@Controller
public class CafeTabRestContoller {
	
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	public CafeTabRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
