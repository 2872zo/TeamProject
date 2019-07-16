package com.phoenix.mvc.service.domain;

import java.util.Date;

public class Chat {
	
	private int chatRoomNo;
	private int chatNo;
	private int UserNo;
	private String chatNickname;
	private String chatProfileImg;
	private int chatType;
	private String chatMsg;
	private Date regDate;
	
	public Chat() {
		
	}
	
	public int getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getUserNo() {
		return UserNo;
	}
	public void setUserNo(int userNo) {
		UserNo = userNo;
	}
	public String getChatNickname() {
		return chatNickname;
	}
	public void setChatNickname(String chatNickname) {
		this.chatNickname = chatNickname;
	}
	public String getChatProfileImg() {
		return chatProfileImg;
	}
	public void setChatProfileImg(String chatProfileImg) {
		this.chatProfileImg = chatProfileImg;
	}
	public int getChatType() {
		return chatType;
	}
	public void setChatType(int chatType) {
		this.chatType = chatType;
	}
	public String getChatMsg() {
		return chatMsg;
	}
	public void setChatMsg(String chatMsg) {
		this.chatMsg = chatMsg;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Chat [chatRoomNo=" + chatRoomNo + ", chatNo=" + chatNo + ", UserNo=" + UserNo + ", chatNickname="
				+ chatNickname + ", chatProfileImg=" + chatProfileImg + ", chatType=" + chatType + ", chatMsg="
				+ chatMsg + ", regDate=" + regDate + "]";
	}
	
}
