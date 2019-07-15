package com.phoenix.mvc.web.cafe;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.User;

@Controller
@RequestMapping("/cafe/*")
public class CafeContoller {
	
//	@Autowired
//	@Qualifier("cafeTabServiceImpl")
//	private CafeTabService cafeTabService;
	
	public CafeContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
}
