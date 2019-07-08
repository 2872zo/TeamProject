package com.phoenix.mvc.service.chatting.impl;

import org.springframework.stereotype.Repository;

@Repository
public class ChattingDaoImpl {
	public ChattingDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
