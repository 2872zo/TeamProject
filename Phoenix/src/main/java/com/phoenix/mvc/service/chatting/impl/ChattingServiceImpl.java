package com.phoenix.mvc.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoom;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;

@Service
@Transactional
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
	public Map getFriendSearchList(Search search) throws Exception {
		Map map = new HashMap();
		List searchList = chattingDao.getFriendSearchList(search);
		map.put("searchList", searchList);
		return map;
	}

	@Override
	public Map getWannaBeFriendList(Search search) throws Exception {
		Map map = new HashMap();
		List wannaBeFreindList = chattingDao.getWannaBeFriendList(search);
		map.put("wannaBeFreindList", wannaBeFreindList);
		return map;
	}

	@Override
	public int addFriend(ChatFriend chatFriend) throws Exception {
		return chattingDao.addFriend(chatFriend);
	}

	@Override
	public int updateFriend(ChatFriend chatFriend) throws Exception {
		return chattingDao.updateFriend(chatFriend);
	}

	@Override
	public int deleteFriend(ChatFriend chatFriend) throws Exception {
		return chattingDao.deleteFriend(chatFriend);
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
	public Map getChatList(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		List chatList = chattingDao.getChatList(search);
		return map;
	}

	@Override
	public Map getChatRoom(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		List chatList = chattingDao.getChatList(search);
		map.put("chatList", chatList);
		return map;
	}
	
	@Override
	public void addChatRoom(ChatRoomForMongo chatRoomForMongo) throws Exception {
		chattingDao.addChatRoom(chatRoomForMongo);
	}

	@Override
	public void addChatRoom(ChatRoom chatRoom) throws Exception {
		chattingDao.addChatRoom(chatRoom);
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
