package com.phoenix.mvc.service.chatting;

import java.util.List;

import com.phoenix.mvc.common.Search;


public interface ChattingDao {
	
	public List getMyChatRoomList (Search search) throws Exception;

}
