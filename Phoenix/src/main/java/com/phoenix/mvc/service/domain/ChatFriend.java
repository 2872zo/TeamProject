package com.phoenix.mvc.service.domain;

import java.util.List;

public class ChatFriend {
	
	private String id;
	
	private int chatFriendNo;
	private int userNo;
	private int targetUserNo;
	private String friendNickname;
	private int friendStatus;
	
	private List<ChatFriend> chatFriendsList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getChatFriendNo() {
		return chatFriendNo;
	}

	public void setChatFriendNo(int chatFriendNo) {
		this.chatFriendNo = chatFriendNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTargetUserNo() {
		return targetUserNo;
	}

	public void setTargetUserNo(int targetUserNo) {
		this.targetUserNo = targetUserNo;
	}

	public String getFriendNickname() {
		return friendNickname;
	}

	public void setFriendNickname(String friendNickname) {
		this.friendNickname = friendNickname;
	}

	public int getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(int friendStatus) {
		this.friendStatus = friendStatus;
	}

	public List<ChatFriend> getChatFriendsList() {
		return chatFriendsList;
	}

	public void setChatFriendsList(List<ChatFriend> chatFriendsList) {
		this.chatFriendsList = chatFriendsList;
	}

	@Override
	public String toString() {
		return "ChatFriend [id=" + id + ", chatFriendNo=" + chatFriendNo + ", userNo=" + userNo + ", targetUserNo="
				+ targetUserNo + ", friendNickname=" + friendNickname + ", friendStatus=" + friendStatus
				+ ", chatFriendsList=" + chatFriendsList + "]";
	}
	
}
