package com.phoenix.mvc.web.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;
import com.phoenix.mvc.service.user.UserService;
import com.phoenix.mvc.service.user.impl.UserDaoImpl;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public UserRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	/*@GetMapping("/user/{userId}")
	public User getUserById(@PathVariable String userId) throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		return userService.getUser(userId);
	}*/
	
	@PostMapping(value = "/json/checkUserIdDuplication")
	public boolean checkUserIdDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkUserIdDuplication : POST");
		
		boolean result = userService.checkUserIdDuplication(user.getUserId());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}
	
	@PostMapping(value = "/json/checkUserPwDuplication")
	public boolean checkUserPwDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkUserIdDuplication : POST");
		
		boolean result = userService.checkUserIdDuplication(user.getPassword());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}

	@PostMapping( value="/json/login")
	public boolean login(@RequestBody User user, HttpSession session ) throws Exception{
		
		System.out.println("/user/login:REST : POST");
		
		//Business Logic
		
		User dbUser=userService.getUser(user.getUserId());
		
		System.out.println("REST@@!!!!!!!!!!!!!!!!!!!"+user.getUserId());
		
		System.out.println("REST@@!!!!!!!!!!!!!!!!!!!"+user.getPassword());
		
		boolean result = false;
		//= userService.checkUserPwDuplication(user.getUserId());
		
		
		
		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			
			result = true;
		}
		
		return result;
	}
	
}
