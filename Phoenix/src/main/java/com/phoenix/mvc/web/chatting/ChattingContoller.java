package com.phoenix.mvc.web.chatting;

import org.springframework.stereotype.Controller;

@Controller
public class ChattingContoller {
	public ChattingContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
}
