package com.phoenix.mvc.service.chatting;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Chat;


public interface ChattingDao {
	
	public List getMyChatRoomList (Search search) throws Exception;
	
	public List getMyFriendsList(Search search) throws Exception;
	
	public void testMethod (Chat chat) throws Exception;
	
	public List getChatList(Chat chat) throws Exception;
	
}
