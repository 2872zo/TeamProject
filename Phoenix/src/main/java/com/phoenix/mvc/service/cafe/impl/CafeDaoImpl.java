package com.phoenix.mvc.service.cafe.impl;

import org.springframework.stereotype.Repository;

@Repository
public class CafeDaoImpl {
	public CafeDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
