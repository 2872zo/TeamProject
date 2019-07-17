package com.phoenix.mvc.service.util.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.util.UtilDao;
import com.phoenix.mvc.service.util.UtilService;

@Service
public class UtilServiceImpl implements UtilService {

	@Autowired
	@Qualifier("utilDaoImpl")
	private UtilDao	utilDao;
	
	public UtilServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public boolean validationCheck(Map<String, String> map) {
		return utilDao.validationCheck(map);
	}

}
