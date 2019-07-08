package com.phoenix.mvc.service.sns.impl;

import org.springframework.stereotype.Repository;

@Repository
public class SnsDaoImpl {
	public SnsDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
