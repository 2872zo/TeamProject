package com.phoenix.mvc.web.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;
import com.phoenix.mvc.service.user.UserService;
import com.phoenix.mvc.service.user.impl.UserDaoImpl;

@RestController
public class CafeMemberRestController {
//	@Autowired
//	@Qualifier("cafeServiceImpl")
//	private CafeService cafeService;
	
	
	public CafeMemberRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	/*@GetMapping("/user/{userId}")
	public User getUserById(@PathVariable String userId) throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		return cafeService.getUser(userId);
	}*/
}
