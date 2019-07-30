package com.phoenix.mvc.service.chatting;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;
import com.phoenix.mvc.service.domain.ChatRoomInfo;

public interface ChattingService {
	
	public Map getMyFriendsList(Search search) throws Exception;
	
	public Map getFriendSearchList(Search search) throws Exception;
	
	public Map getWannaBeFriendList(Search search) throws Exception;
		
	public int addFriend(ChatFriend chatFriend) throws Exception;
	
	public int updateFriend(ChatFriend chatFriend) throws Exception;
	
	public int deleteFriend(ChatFriend chatFriend) throws Exception;
	
	public Map getMyChatRoomList(Search search) throws Exception;
	
	public Map getChatRoom(Search search) throws Exception;
	
	public String addChatRoom(Map map) throws Exception;
	
	public void testMethod(Chat chat) throws Exception;
	
	public void addChat(Chat chat) throws Exception;
	
	public Map getChatList(Search search) throws Exception;
	//겟 챗룸으로 합치고 서비스에서 없애야 됨 DAO는 필요... 한줄 알았는데 무한 스크롤 업 하려면 혹시모름
	
	public void addMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public List getMyChatRoomList(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void updateMyChatRoomName(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void deleteMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public Map getFriendsListForInvite(Search search) throws Exception;
	
}
