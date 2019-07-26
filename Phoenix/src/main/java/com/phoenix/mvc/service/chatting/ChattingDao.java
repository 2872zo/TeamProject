package com.phoenix.mvc.service.chatting;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoom;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;


public interface ChattingDao {
	
	public List getMyChatRoomList(Search search) throws Exception;
	
	public int getMyChatRoomCount(Search search) throws Exception;
	
	public List getMyFriendsList(Search search) throws Exception;
	
	public List getFriendSearchList(Search search) throws Exception;
	
	public List getWannaBeFriendList(Search search) throws Exception;
	
	public ChatFriend getFriend(ChatFriend chatFriend) throws Exception;
	
	public int addFriend(ChatFriend chatFriend) throws Exception;
	
	public int updateFriend(ChatFriend chatFriend) throws Exception;
	
	public int deleteFriend(ChatFriend chatFriend) throws Exception;
	
	public void addChatRoom(ChatRoomForMongo chatRoomForMongo) throws Exception;
	
	public void addChatRoom(ChatRoom chatRoom) throws Exception;
	
	public void deleteChatRoomFromList (ChatRoom chatRoom) throws Exception;
	
	public void testMethod (Chat chat) throws Exception;
	
	public void addChat (Chat chat) throws Exception;
	
	public List getChatList(Search search) throws Exception;
	
	public int getMyChatCount(Search search) throws Exception;
	
	public List getChatRoomUserList(Search search) throws Exception;
}
