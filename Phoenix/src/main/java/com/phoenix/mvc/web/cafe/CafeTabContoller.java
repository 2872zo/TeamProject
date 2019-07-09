package com.phoenix.mvc.web.cafe;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.cafe.impl.CafeTabServiceImpl;
import com.phoenix.mvc.service.domain.Cafe;


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
/*	
	@RequestMapping(value="addCafe", method=RequestMethod.GET)
	public String addCafeView(@ModelAttribute("cafe") Cafe cafe, Model model, HttpServletRequest request )throws Exception{
		
		System.out.println("/addCafe : POST");
		
		Map<String , Object> map= cafeTabService.getAddCafe(cafe);
		

		model.addAttribute("list", map.get("list"));


		return "forward:/cafe/addCafe.jsp";
	}*/
	
	@RequestMapping(value= "/{cafeURL}/addCafe", method=RequestMethod.GET)
	public String addCafe(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/addCafe : POST");
		
		cafe.setCafeNo("10001");
		cafe.setCafeName("gd");
		cafe.setCafeIcon("dsa");		
		cafe.setManageUserNo("10001");		
		cafe.setUrl("dsada");
		cafe.setCafeDetail("111");
		cafe.setBannerImg("dsada");
		cafe.setMainImg("dsada");
		cafe.setCafeType("dsada");
		cafe.setApplicationDetail("adsada");
		cafe.setCloseReason("dsada");
		cafe.setApplicationQuestion1("111");
		cafe.setApplicationQuestion2("sdada");
		cafe.setApplicationQuestion3("dsada");
		cafe.setCafeNickNameFlag("0");
		cafe.setAutoApplicationAcceptFlag("0");
		cafe.setClosedFlag("1");
		
		
		
		
		cafeTabService.addCafe(cafe);
		
		return "forward:/cafe/addCafe.jsp";
	}
	
	
	
}
