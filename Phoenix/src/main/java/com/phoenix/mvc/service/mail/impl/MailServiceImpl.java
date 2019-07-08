package com.phoenix.mvc.service.mail.impl;

import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl {
	public MailServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
