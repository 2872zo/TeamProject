package com.phoenix.mvc.service.explore.impl;

import org.springframework.stereotype.Repository;

@Repository
public class ExploreDaoImpl {
	public ExploreDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
