package com.phoenix.mvc.service.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="chat")
public class Chat {
	
	private String id;
	private String chatRoomId;
	private int userNo;
	private String userNickname;
	private String profileImg;
	private int chatType;
	private String chatMsg;
	private Date regDate;
	
	public Chat() {	
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChatRoomId() {
		return chatRoomId;
	}

	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getChatNickname() {
		return userNickname;
	}

	public void setChatNickname(String chatNickname) {
		this.userNickname = chatNickname;
	}

	public String getChatProfileImg() {
		return profileImg;
	}

	public void setChatProfileImg(String chatProfileImg) {
		this.profileImg = chatProfileImg;
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

	public String getRegDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		
		return format.format(regDate);
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Chat [id=" + id + ", chatRoomId=" + chatRoomId + ", UserNo=" + userNo + ", userNickname=" + userNickname
				+ ", profileImg=" + profileImg + ", chatType=" + chatType + ", chatMsg=" + chatMsg + ", regDate="
				+ regDate + "]";
	}
	
}
