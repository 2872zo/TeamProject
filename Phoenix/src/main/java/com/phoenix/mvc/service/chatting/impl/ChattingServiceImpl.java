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
	public int addChatFriend(ChatFriend chatFriend) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void testMethod(Chat chat) throws Exception {
		chattingDao.testMethod(chat);
		
	}
}
