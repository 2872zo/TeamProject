package com.phoenix.mvc.service.domain;

public class ChatFriend {
	
	private int userNo;
	private int targetUserNo;
	private String friendNickname;
	private int friendStatus;
	
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
	
	@Override
	public String toString() {
		return "ChatFriend [userNo=" + userNo + ", targetUserNo=" + targetUserNo + ", friendNickname=" + friendNickname
				+ ", friendStatus=" + friendStatus + "]";
	}
	
}
