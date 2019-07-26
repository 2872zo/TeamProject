package com.phoenix.mvc.service.domain;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ChatRoomInfo {
	
	String id;
	String chatRoomId;
	int userNo;
	String ChatRoomName;
	Date latestEnter;
	Date latestLeave;
	
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
	public String getChatRoomName() {
		return ChatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		ChatRoomName = chatRoomName;
	}
	public Date getLatestEnter() {
		return latestEnter;
	}
	public void setLatestEnter(Date latestEnter) {
		this.latestEnter = latestEnter;
	}
	public Date getLatestLeave() {
		return latestLeave;
	}
	public void setLatestLeave(Date latestLeave) {
		this.latestLeave = latestLeave;
	}
	
	@Override
	public String toString() {
		return "ChatRoomInfo [id=" + id + ", chatRoomId=" + chatRoomId + ", userNo=" + userNo + ", ChatRoomName="
				+ ChatRoomName + ", latestEnter=" + latestEnter + ", latestLeave=" + latestLeave + "]";
	}
	
}
