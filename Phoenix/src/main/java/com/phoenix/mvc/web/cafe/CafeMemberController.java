package com.phoenix.mvc.web.cafe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class CafeMemberController {

	public CafeMemberController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping(value = "/cafe/{cafeURL}/addCafeApplication", method = RequestMethod.GET)
	public String addCafeApplication(@PathVariable String cafeURL) {

		System.out.println("/cafe/(cafeURL)/addCafeApplication : GET");
		
		return "redirect:/cafe/addCafeApplicationView.jsp";

	}

}
