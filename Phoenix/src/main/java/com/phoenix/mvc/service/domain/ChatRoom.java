package com.phoenix.mvc.service.domain;

public class ChatRoom {
	
	private int userNo;
	private int chatRoomNo;
	private int myChatRoomNo;
	private String chatRoomName;
	private String recentMsg;
	
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
	
	@Override
	public String toString() {
		return "ChatRoom [userNo=" + userNo + ", chatRoomNo=" + chatRoomNo + ", chatRoomName=" + chatRoomName
				+ ", recentMsg=" + recentMsg + "]";
	}
	
}
