package com.phoenix.mvc.service.cafe.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;

@Service("cafeServiceImpl")
public class CafeTabServiceImpl implements CafeTabService{
	
	@Autowired
	@Qualifier("cafeDaoImpl")	
	private CafeTabDao cafeDao;
	
	public void setCafeDao(CafeTabDao cafeDao) {
	this.cafeDao= cafeDao;
	}
	
	public CafeTabServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@Override
	public void addCafe(Cafe cafe) throws Exception {
		cafeDao.addCafe(cafe);
	}
}
