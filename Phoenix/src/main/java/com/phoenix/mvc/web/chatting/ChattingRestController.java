package com.phoenix.mvc.web.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.service.chatting.ChattingService;

@Controller
@RequestMapping("/chat/json/*")
public class ChattingRestController {
	
	public ChattingRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

}
