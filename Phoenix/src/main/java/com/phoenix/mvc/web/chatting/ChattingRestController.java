package com.phoenix.mvc.web.chatting;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatRoom;

@RestController
@RequestMapping("/chat/json/*")
public class ChattingRestController {
	
	public ChattingRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

	@PostMapping("addChat")
	public Chat addChat(@RequestBody Chat chat) throws Exception{
		System.out.println ("/chat/json/addChat");
		System.out.println (chat);
		chat.setRegDate(new Date());
		System.out.println ("시간찍힘"+chat);
		chat.setChatNickname("대충");
		chat.setChatProfileImg("abc");
		chattingService.testMethod(chat);
		
		System.out.println ("제대로들어가면호출됨"+chat);
		
		return chat;
	}
	
	@PostMapping("updateChatRoomName")
	public Chat updateChatRoomName(@RequestBody ChatRoom chatRoom){
		return null;
		
	}
	
	
}
