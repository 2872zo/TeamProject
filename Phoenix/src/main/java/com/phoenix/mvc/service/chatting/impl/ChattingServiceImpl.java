package com.phoenix.mvc.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoom;

@Service
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	@Qualifier("chattingDaoImpl")	
	private ChattingDao chattingDao;
	
	
	public ChattingServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map getMyChatRoomList(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		
		List chatRoomList = chattingDao.getMyChatRoomList(search);
		
		map.put("chatRoomList",chatRoomList);
		
		return map;
	}

	@Override
	public Map getMyFriendsList(Search search) throws Exception {
		Map map = new HashMap();
		List friendsList = chattingDao.getMyFriendsList(search);
		map.put("friendsList", friendsList);
		return map;
	}

	@Override
	public void addChatFriend(ChatFriend chatFriend) throws Exception {
				
	}

	@Override
	public void addChat(Chat chat) throws Exception {
		chattingDao.addChat(chat);
	}
	
	@Override
	public void testMethod(Chat chat) throws Exception {
		chattingDao.testMethod(chat);
		
	}

	@Override
	public List getChatList(Chat chat) throws Exception {
		// TODO Auto-generated method stub
		return chattingDao.getChatList(chat);
	}

	@Override
	public Map getChatRoom(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateChatFriend(ChatFriend chatFriend) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeChatFriend(ChatFriend chatFriend) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addChatRoom(ChatRoom chatRoom) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateChatRoom(ChatRoom chatRoom) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeChatRoom(ChatRoom chatRoom) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
