package com.phoenix.mvc.web.chatting;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoom;
import com.phoenix.mvc.service.domain.User;

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
		chattingService.addChat(chat);
		
		System.out.println ("제대로들어가면호출됨"+chat);
		
		//List list = chattingService.getChatList(chat);
		
		//System.out.println(list);
		
		return chat;
	}
	
	
	@PostMapping("inviteFriend")
	public ChatFriend inviteFriend(@RequestBody ChatFriend chatFriend) throws Exception{
		
		
		return new ChatFriend();
	}
	
	@PostMapping("addChatFriend")
	public int addChatFriend(@SessionAttribute("user") User user, @RequestBody ChatFriend chatFriend) throws Exception{
		chatFriend.setUserNo(user.getUserNo());
		int added = chattingService.addFriend(chatFriend);
		
		if (added==1) {
			return chatFriend.getChatFriendNo();
		}
		else {
			return -1;
		}
	}
	
	@PostMapping("deleteChatFriend")
	public boolean deleteChatFriend(@RequestBody ChatFriend chatFriend) throws Exception {
		
		chattingService.deleteFriend(chatFriend);
		return true;
	}
	
	@PostMapping("updateChatFriend")
	public boolean updateChatFriend(@RequestBody Search search){
		return true;
	}
	
	@PostMapping("cancelChatFriend")
	public boolean cancelChatFriend(@RequestBody Search search) {
		return true;
	}
	
	@PostMapping("updateChatRoomName")
	public Chat updateChatRoomName(@RequestBody ChatRoom chatRoom){
		return null;
		
	}
	
	
}
