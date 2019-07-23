package com.phoenix.mvc.web.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/json/checkUserIdDuplication", method=RequestMethod.POST)
	public boolean checkUserIdDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkUserIdDuplication : POST");
		
		boolean result = userService.checkUserIdDuplication(user.getUserId());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}

	
	
}
