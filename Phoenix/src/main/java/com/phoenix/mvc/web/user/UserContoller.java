package com.phoenix.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserService;

@Controller
@RequestMapping("/user/*")
@PropertySource("common.properties")
public class UserContoller {
	
	
	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public UserContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}	
	
	////////////////////////////////////준호시작///////////////////////////////////
	@RequestMapping( value="loginView", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "user/loginView";
	}
	//레스트컨트롤러탐
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		System.out.println("!!!!!!!!!!!!!!!!!!!"+user.getUserId());
		//System.out.println("!!!!!!!!!!!!!!!!!!!"+dbUser);
		User dbUser=userService.getUser(user.getUserId());
		
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
			
		return "redirect:/";
	}
	
	@GetMapping("addUserView")
	public String addUserView(@ModelAttribute User user) throws Exception {

		System.out.println("/addUser : GET");

		return "user/addUserView";
	}
	
	@PostMapping("addUser")
	public String addUser(@ModelAttribute User user, Model model, HttpSession session) throws Exception {

		System.out.println("/addUser : POST");

		userService.addUser(user);

		User user2 = userService.getUserInfo(user.getUserNo());

		user = user2;

		System.out.println("유저인서트다다아아아앙@@@@@" + user);

		model.addAttribute("user", user);
		
		User dbUser=userService.getUser(user.getUserId());		
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}

		return "redirect:/";
	}
	
	@GetMapping("logout" )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/cafe/main";
	}
	
	@RequestMapping(value = "getUserInfo")
	public String getUserInfo(@RequestParam("userNo") int userNo, Model model) throws Exception {
		
		User user = userService.getUserInfo(userNo);
		
		System.out.println("카페정보들오니"+user);
		
		model.addAttribute("user", user);

		return "user/getUser";

	}
	
	@GetMapping("updateUserView")
	public String updateUserView(@RequestParam("userNo") int userNo, Model model) throws Exception {

		System.out.println("/updateCafeInfoView : GET");

		User user = userService.getUserInfo(userNo);

		model.addAttribute("user", user);

		return "user/updateUserView";
	}
	
	@PostMapping("updateUser")
	public String updateUser(@ModelAttribute("user") User user, Model model) throws Exception {

		System.out.println("/updateUser : POST");
		
		userService.updateUser(user);

		User user2 = userService.getUserInfo(user.getUserNo());

		user = user2;
		
		model.addAttribute("user", user);
		
		return "user/updateUser";
	}

	@RequestMapping(value="listUser")
	public String listUser(@ModelAttribute("search")Search search, Model model, HttpServletRequest request)throws Exception{
		
		System.out.println("/listUser :");
		
		if(search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map=userService.getUserList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("page", resultPage);
		model.addAttribute("search",search);
		
		return "/user/listUser";
	}
	
	
	////////////////////////////////////준호끝///////////////////////////////////
}
