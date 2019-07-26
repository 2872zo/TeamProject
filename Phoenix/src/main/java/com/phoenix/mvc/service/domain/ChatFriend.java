package com.phoenix.mvc.service.domain;

import java.util.List;

public class ChatFriend {
		
	private int chatFriendNo;
	private int userNo;
	private int targetUserNo;
	private String userNickname;
	private String userImg;
	private String friendNickname;
	private String friendStatus;
	
	private List<ChatFriend> chatFriendsList;

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

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getFriendNickname() {
		return friendNickname;
	}

	public void setFriendNickname(String friendNickname) {
		this.friendNickname = friendNickname;
	}

	public String getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(String friendStatus) {
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
		return "ChatFriend [chatFriendNo=" + chatFriendNo + ", userNo=" + userNo + ", targetUserNo=" + targetUserNo
				+ ", userNickname=" + userNickname + ", userImg=" + userImg + ", friendNickname=" + friendNickname
				+ ", friendStatus=" + friendStatus + ", chatFriendsList=" + chatFriendsList + "]";
	}
	
}
