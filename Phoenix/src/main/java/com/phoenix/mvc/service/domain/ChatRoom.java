package com.phoenix.mvc.service.domain;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;
@Document
public class ChatRoom {
	
	private String id;
	private int userNo;
	private int chatRoomNo;
	private int myChatRoomNo;
	private String chatRoomName;
	private Chat recentChat;
	private Date latestEnter;
	private Date latestLeave;
	
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
	public Chat getRecentChat() {
		return recentChat;
	}
	public void setRecentChat(Chat recentChat) {
		this.recentChat = recentChat;
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
		return "ChatRoom [id=" + id + ", userNo=" + userNo + ", chatRoomNo=" + chatRoomNo + ", myChatRoomNo="
				+ myChatRoomNo + ", chatRoomName=" + chatRoomName + ", recentChat=" + recentChat + ", latestEnter="
				+ latestEnter + ", latestLeave=" + latestLeave + "]";
	}
	
}
