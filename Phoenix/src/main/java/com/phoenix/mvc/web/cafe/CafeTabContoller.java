package com.phoenix.mvc.web.cafe;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;


import com.phoenix.mvc.common.Search;


@Controller
@RequestMapping("/cafe/*")
public class CafeTabContoller {
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	public CafeTabContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("/cafe/main")
	public String cafeMain() {
		System.out.println("/cafe/main입니다.");
		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}

	
	@RequestMapping(value= "/cafe/addCafeView", method=RequestMethod.GET)
	public String addCafeView(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/addCafe : GET");
		
		
		
		return "cafe/addCafeView";
	}
	@RequestMapping(value= "/cafe/addCafe", method=RequestMethod.POST)
	public String addCafe(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/addCafe : POST");
		
		
		cafe.setManageUserNo("10012");		

		cafeTabService.addCafe(cafe);
		
		return "cafe/addCafe";
	}
	
	
	
	
	@RequestMapping("/cafe/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {
		System.out.println("/cafe/search입니다.");
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchKeyword());
		
	
		List list =cafeTabService.searchCafe(search);
		model.addAttribute("cafeList", list);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
}
