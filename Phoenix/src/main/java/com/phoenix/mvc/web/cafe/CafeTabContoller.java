package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.common.Search;


@Controller
@RequestMapping("/cafe/*")
public class CafeTabContoller {
	
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	int pageSize = 2;
	int pageUnit = 3;
	
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
	
	
	
	/////////////////////////////////기황//////////////////////////////////////
	@RequestMapping("/cafe/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {
	
		System.out.println("/cafe/search입니다.");

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		Map<String, Object> map = cafeTabService.searchCafe(search);
		List cafeList = (List) map.get("cafeList");
		List postList = (List) map.get("postList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//Page page = new Page();
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("postList", postList);
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
	
	@RequestMapping("/cafe/category")
	public String getCategorizedCafe () {
		
		System.out.println("/cafe/category입니다.");
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
	
	/////////////////////////////////끝//////////////////////////////////////

}
