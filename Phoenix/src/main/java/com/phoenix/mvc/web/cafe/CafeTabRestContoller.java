package com.phoenix.mvc.web.cafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.service.cafe.CafeTabService;

@Controller
@RequestMapping("/cafe/json/*")
public class CafeTabRestContoller {
	
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	public CafeTabRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
