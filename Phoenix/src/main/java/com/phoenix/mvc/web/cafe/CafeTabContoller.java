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

	
	@RequestMapping(value= "/cafe/addCafe", method=RequestMethod.GET)
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
	
	
	
	
	@RequestMapping("/cafe/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {
		System.out.println("/cafe/search입니다.");
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchKeyword());
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = cafeTabService.searchCafe(search);
		List cafeList = (List) map.get("cafeList");
		List postList = (List) map.get("postList");
		Page page = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//Page page = new Page();
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("postList", postList);
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
}
