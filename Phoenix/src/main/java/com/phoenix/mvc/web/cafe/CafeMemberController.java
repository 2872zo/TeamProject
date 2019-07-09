package com.phoenix.mvc.web.cafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.CafeApplication;

@Controller
@RequestMapping("/cafe/*")
public class CafeMemberController {
	
	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	public CafeMemberController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	

	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.GET)
	public String addCafeApplication(@PathVariable String cafeURL) {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : GET");
		
		return "cafe/addCafeApplicationView";

	}
	
	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.POST)
	public String addCafeApplication(@PathVariable String cafeURL, @ModelAttribute("cafeApplication") CafeApplication cafeApplication) {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : POST");
		
		cafeApplication.setUserNo("10001");
		cafeApplication.setCafeNo("10000");
		System.out.println("들어온 cafeApplication 값?"+ cafeApplication);
		cafeMemberService.addCafeApplication(cafeApplication);
		
		return "redirect:/cafe/addCafeApplicationView.jsp";

	}

}
