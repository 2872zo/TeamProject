package com.phoenix.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserContoller {
	
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
		
		return "redirect:/cafe/main";
	}
	////////////////////////////////////준호끝///////////////////////////////////
}
