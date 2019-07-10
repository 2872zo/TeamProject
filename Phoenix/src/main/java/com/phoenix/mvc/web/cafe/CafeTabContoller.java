package com.phoenix.mvc.web.cafe;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
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
	
	
	
	
	@RequestMapping("/cafe/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {
		System.out.println("/cafe/search입니다.");
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchKeyword());
		
	
		List list =cafeTabService.searchCafe(search);
		model.addAttribute("cafeList", list);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
	
	@RequestMapping("/{cafeURL}")
	public String getCafeMain(@PathVariable String cafeURL,HttpSession session,Model model)
	{
		System.out.println("/cafe/{cafeURL}");
		
		//승규 getBoardPostList Service 불러오면 안되잖아. 그럼 바로 dao부르나?? 내가 메서드를 만들어야겠네.
		User user = new User(); 
		
		if(session.getAttribute("user")!=null)  //session에 있으면
		{
			user = (User) session.getAttribute("user") ;
		}
			
		if(user.getUserNo()==0) //포탈로그인되어있지않음. 400
		{
			user.setUserNo(400);
		} 
		//set해주고 service태워서 service에서 회원인지 아닌지 검사
		
		Map map = cafeTabService.getCafeMain(user, cafeURL);
		model.addAttribute("cafeMember", map.get("cafeMember"));
		model.addAttribute("boardList", map.get("boardList"));
		
		return "cafe/mainCafe";
	}
}
