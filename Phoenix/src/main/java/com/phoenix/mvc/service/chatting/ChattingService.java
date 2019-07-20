package com.phoenix.mvc.service.chatting;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.ChatFriend;

public interface ChattingService {
	public Map getMyChatRoomList (Search search) throws Exception;
	
	public Map getMyFriendsList (Search search) throws Exception;
	
	public int addChatFriend(ChatFriend chatFriend) throws Exception;
}
