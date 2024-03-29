package com.phoenix.mvc.service.chatting;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;
import com.phoenix.mvc.service.domain.ChatRoomInfo;
import com.phoenix.mvc.service.domain.User;


public interface ChattingDao {
	
	public List getMyChatRoomList(Search search) throws Exception;
	
	public ChatRoomInfo getMyChatRoomInfo(Search search) throws Exception;
	
	public List getMyFriendsList(Search search) throws Exception;
	
	public List getFriendSearchList(Search search) throws Exception;
	
	public List getWannaBeFriendList(Search search) throws Exception;
	
	public int addFriend(ChatFriend chatFriend) throws Exception;
	
	public int updateFriend(ChatFriend chatFriend) throws Exception;
	
	public int deleteFriend(ChatFriend chatFriend) throws Exception;
	
	public void addChatRoom(ChatRoomForMongo chatRoomForMongo) throws Exception;
	
	public void addMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void updateMyChatRoomName(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void deleteMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public List getFriendsListForInvite(Search search) throws Exception;
	
	public ChatRoomInfo getMyChatRoomInfoByChatRoomInfo(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void updateChatRoomRecentMsg(Chat chat) throws Exception;
	
	public void addChat (Chat chat) throws Exception;
	
	public long getChatCount(Search search) throws Exception;
	
	public List getChatList(Search search) throws Exception;
	
	public List getMoreChat(Search search) throws Exception;
	
	public List getChatRoomUserList(Search search) throws Exception;
	
	public List getFriendNickNameList(Search search) throws Exception;
	
	public List getFourImgForChatRoomList(ChatRoomInfo chatRoomInfo) throws Exception;
	
	public void updateChatRoomInfoByUser(User user) throws Exception;
	
	
}
