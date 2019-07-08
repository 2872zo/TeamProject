package com.phoenix.mvc.service.mail.impl;

import org.springframework.stereotype.Repository;

@Repository
public class MailDaoImpl {
	public MailDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
