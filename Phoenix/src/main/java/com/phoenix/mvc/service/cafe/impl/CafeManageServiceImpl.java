package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;

@Service("cafeManageServiceImpl")
public class CafeManageServiceImpl implements CafeManageService {

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	

	public void setCafeManageDao(CafeManageDao cafeManageDao) {
		this.cafeManageDao = cafeManageDao;
	}

	public CafeManageServiceImpl() {
		
		System.out.println(this.getClass().getName());
	}

	@Override
	public List getCafeBoard(String cafeURL) {

	
		return cafeManageDao.getCafeBoard(cafeURL);
	}

}
