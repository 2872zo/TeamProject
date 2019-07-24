package com.phoenix.mvc.service.domain;

import java.util.List;

public class ChatRoom {
	
	private String id;
	private int userNo;
	private int chatRoomNo;
	private int myChatRoomNo;
	private String chatRoomName;
	private String recentMsg;
	
	private List<ChatFriend> chatFriendsList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public int getMyChatRoomNo() {
		return myChatRoomNo;
	}

	public void setMyChatRoomNo(int myChatRoomNo) {
		this.myChatRoomNo = myChatRoomNo;
	}

	public String getChatRoomName() {
		return chatRoomName;
	}

	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}

	public String getRecentMsg() {
		return recentMsg;
	}

	public void setRecentMsg(String recentMsg) {
		this.recentMsg = recentMsg;
	}

	public List<ChatFriend> getChatFriendsList() {
		return chatFriendsList;
	}

	public void setChatFriendsList(List<ChatFriend> chatFriendsList) {
		this.chatFriendsList = chatFriendsList;
	}

	@Override
	public String toString() {
		return "ChatRoom [id=" + id + ", userNo=" + userNo + ", chatRoomNo=" + chatRoomNo + ", myChatRoomNo="
				+ myChatRoomNo + ", chatRoomName=" + chatRoomName + ", recentMsg=" + recentMsg + ", chatFriendsList="
				+ chatFriendsList + "]";
	}
		
}
