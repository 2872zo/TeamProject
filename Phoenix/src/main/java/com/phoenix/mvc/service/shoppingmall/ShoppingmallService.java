package com.phoenix.mvc.service.shoppingmall;

import java.util.Map;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.domain.User;

public interface ShoppingmallService {
	
	public Map<String,Object> getShoppingmallProductList(ShoppingmallSearch search);
	
	public Map<String,Object> getPurchaseList(User user, ShoppingmallSearch search);
	
	public String login(Account account, User user);

}
