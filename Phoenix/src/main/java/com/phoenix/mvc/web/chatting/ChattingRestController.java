package com.phoenix.mvc.web.chatting;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoomInfo;
import com.phoenix.mvc.service.domain.User;

@RestController
@RequestMapping("/chat/json/*")
public class ChattingRestController {
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Value("${enterChatAmount}")
	private int enterChatAmount;
	
	@Value("${readChatAtOnce}")
	private int readChatAtOnce;
	
	public ChattingRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@PostMapping("addChat")
	public Chat addChat(@RequestBody Chat chat) throws Exception{
		System.out.println ("/chat/json/addChat");

		chat.setRegDate(new Date());
		chattingService.addChat(chat);
		
		return chat;
	}
	
	@PostMapping("inviteFriend")
	public boolean inviteFriend(@RequestBody List<ChatRoomInfo> chatRoomInfoList) throws Exception{

		for (ChatRoomInfo chatRoomInfo : chatRoomInfoList) {
			chatRoomInfo.setRegDate(new Date());
			chatRoomInfo.setChatRoomName(new SimpleDateFormat("yyyy.MM.dd HH:mm").format(chatRoomInfo.getRegDate())+"에 초대받은 채팅방");
			chattingService.addMyChatRoom(chatRoomInfo);
		}
		
		return true;
		
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
		
		int resultChecker = chattingService.deleteFriend(chatFriend);
		if (resultChecker==1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@PostMapping("updateChatRoomInfo")
	public String updateChatRoomInfo(@RequestBody ChatRoomInfo chatRoomInfo) throws Exception {
		
		chattingService.updateMyChatRoomName(chatRoomInfo);
		
		return chatRoomInfo.getChatRoomName();
		
	}
	
	@PostMapping("updateChatFriend")
	public boolean updateChatFriend(@RequestBody ChatFriend chatFriend) throws Exception{
		
		boolean responseBoolean = false;
		
		int checker = chattingService.updateFriend(chatFriend);

		if (checker==1) {
			responseBoolean = true;
		}
		
		return responseBoolean;
		
	}
	
}
