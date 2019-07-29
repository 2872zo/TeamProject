package com.phoenix.mvc.service.chatting;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;
import com.phoenix.mvc.service.domain.ChatRoomInfo;


public interface ChattingDao {
	
	public List getMyChatRoomList(Search search) throws Exception;
	
	public ChatRoomInfo getMyChatRoomInfo(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public int getMyChatRoomCount(Search search) throws Exception;
	
	public List getMyFriendsList(Search search) throws Exception;
	
	public List getFriendSearchList(Search search) throws Exception;
	
	public List getWannaBeFriendList(Search search) throws Exception;
	
	public ChatFriend getFriend(ChatFriend chatFriend) throws Exception;
	
	public int addFriend(ChatFriend chatFriend) throws Exception;
	
	public int updateFriend(ChatFriend chatFriend) throws Exception;
	
	public int deleteFriend(ChatFriend chatFriend) throws Exception;
	
	public void addChatRoom(ChatRoomForMongo chatRoomForMongo) throws Exception;
	
	public void addMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public List getMyChatRoomList(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void updateMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void deleteMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public List getFriendsListForInvite(Search search) throws Exception;
	
	public void testMethod (Chat chat) throws Exception;
	
	public void addChat (Chat chat) throws Exception;
	
	public List getChatList(Search search) throws Exception;
	
	public int getMyChatCount(Search search) throws Exception;
	
	public List getChatRoomUserList(Search search) throws Exception;
}
