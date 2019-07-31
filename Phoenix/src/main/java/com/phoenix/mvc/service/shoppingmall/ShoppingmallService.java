package com.phoenix.mvc.service.shoppingmall;

import java.util.Map;

import com.phoenix.mvc.service.domain.ShoppingmallSearch;

public interface ShoppingmallService {
	
	public Map<String,Object> getShoppingmallProductList(ShoppingmallSearch search);
	
	

}
