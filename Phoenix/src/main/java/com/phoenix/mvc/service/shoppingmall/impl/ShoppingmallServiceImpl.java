package com.phoenix.mvc.service.shoppingmall.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallService;

@Service("shoppingmallServiceImpl")
public class ShoppingmallServiceImpl implements ShoppingmallService

{
	
	@Autowired
	@Qualifier("shoppingmallDaoImpl")
	private ShoppingmallDaoImpl shoppingmallDaoImpl;
	
	public ShoppingmallServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	
	@Override
	public Map<String, Object> getShoppingmallProductList(ShoppingmallSearch search) {
		
		return shoppingmallDaoImpl.getTmonProductList(search);
	}
	
}
