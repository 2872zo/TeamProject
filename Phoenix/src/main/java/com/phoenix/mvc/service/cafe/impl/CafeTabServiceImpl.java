package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;


@Service("cafeTabServiceImpl")
public class CafeTabServiceImpl implements CafeTabService{
	
	@Autowired
	@Qualifier("cafeTabDaoImpl")	
	private CafeTabDao cafeTabDao;
	
	public void setCafeDao(CafeTabDao cafeDao) {
	this.cafeTabDao= cafeDao;
	}
	
	public CafeTabServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@Override
	public void addCafe(Cafe cafe) throws Exception {
		cafeTabDao.addCafe(cafe);
	}

	@Override
	public List searchCafe(Search search) throws Exception {
		// TODO Auto-generated method stub
		return cafeTabDao.searchCafe(search);
	}
}
