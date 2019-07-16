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
	public String getCafeMain(@PathVariable String cafeURL,HttpSession session,Model model)
	{
		System.out.println("/cafe/{cafeURL}");
		
//		//승규 getBoardPostList Service 불러오면 안되잖아. 그럼 바로 dao부르나?? 내가 메서드를 만들어야겠네.
		User user = new User(); 
//		
//		if(session.getAttribute("user")!=null)  //session에 있으면
//		{
//			user = (User) session.getAttribute("user") ;
//		}
//			
//		if(user.getUserNo()==0) //포탈로그인되어있지않음. 400
//		{
//			user.setUserNo(400);
//		} 
//		//set해주고 service태워서 service에서 회원인지 아닌지 검사
	
		//가짜데이터
		user.setUserNo(10000);
		
		Map map = cafeTabService.getCafeMain(user, cafeURL);
		
		model.addAttribute("cafeURL", map.get("cafeURL"));
		model.addAttribute("noticePostList", map.get("noticePostList"));//공지게시글리스트
		model.addAttribute("cafeMember", map.get("cafeMember"));//내정보
		model.addAttribute("boardList", map.get("boardList"));//카페게시판리스트
		
		return "cafe/mainCafe";
	}
}
