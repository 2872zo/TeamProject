package com.phoenix.mvc.web.shoppingmall;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallService;

@RestController
@RequestMapping("/shopping/*")
public class ShoppingmallRestController {

	@Autowired
	@Qualifier("shoppingmallServiceImpl")
	private ShoppingmallService shoppingmallService;
	
	
	public ShoppingmallRestController() {
		
		System.out.println(this.getClass().getName()+"생성자 시작");
	}
	
	@RequestMapping("/json/infiniteProductList")
	public Map getInfiniteProductList(@RequestBody ShoppingmallSearch search)
	{
		
		System.out.println("json/infiniteProductList 컨트롤러 시작");
		
		System.out.println("searchTotal : "+search.getSearchTotal());
		
		if(search.getSearchKeyword()==null )
		{
			search.setSearchKeyword("자전거");
		}
		if(search.getDetectedItemCount()==0) //일리가 없음
		{
			search.setDetectedItemCount(0); //일단 무한스크롤 위해서..
		}
		
		Map<String, Object> returnMap = shoppingmallService.getShoppingmallProductList(search);
		
		//returnMap에 productList랑 search 들어가있음.
		
		return returnMap;
	}
	
	@RequestMapping("/json/addShoppingmallAccount")
	public Map addShoppingmallAccount(@RequestBody Account account, HttpSession session)
	{
		
		System.out.println("json/addShoppingmallAccount 실행");
		
		System.out.println("account : "+account);
		User user = (User)session.getAttribute("user");
		
		String loginResult = shoppingmallService.login(account, user);
		
		//loginResult를 그냥 리턴..
		Map returnMap = new HashMap();
		returnMap.put("loginResult", loginResult);
		
		return returnMap;
	}

}
