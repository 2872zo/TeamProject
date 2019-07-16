package com.phoenix.mvc.web.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat/*")
public class ChattingContoller {
	public ChattingContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("main")
	public String getChatMain() {
		
		return "chat/chatMain";
	}
	
	@RequestMapping("chatRoomList")
	public String getChatRoomList() {
		
		return "chat/listChatRoom";
	}
	
	@RequestMapping("config")
	public String getChatConfig() {
		
		return "chat/chatConfig";
	}
	
	
}
