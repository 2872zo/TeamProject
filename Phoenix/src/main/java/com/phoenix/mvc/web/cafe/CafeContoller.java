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
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	public CafeContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("/{cafeURL}")
	public String getCafeMain(@PathVariable String cafeURL, HttpSession session,Model model) throws Exception
	{
		System.out.println("/cafe/{cafeURL}");
		
		User user = (User)session.getAttribute("user");

		Map map = cafeTabService.getCafeMain(user, cafeURL);
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>cafemain cafemember: " + map.get("cafeMember"));
		
		model.addAttribute("cafe", map.get("cafe"));
		model.addAttribute("cafeURL", cafeURL);
		model.addAttribute("noticePostList", map.get("noticePostList"));//공지게시글리스트
		model.addAttribute("cafeMember", map.get("cafeMember"));//내정보
		model.addAttribute("boardList", map.get("boardList"));//카페게시판리스트
		
		return "cafe/mainCafe";
	}
}
