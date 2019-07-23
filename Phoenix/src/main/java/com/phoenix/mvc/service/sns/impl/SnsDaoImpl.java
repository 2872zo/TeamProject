package com.phoenix.mvc.service.sns.impl;

import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.sns.SnsDao;

@Repository("snsDaoImpl")
public class SnsDaoImpl implements SnsDao {
	
	public SnsDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
