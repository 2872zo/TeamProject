package com.phoenix.mvc.service.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ChatRoomInfo {
	
	String id;
	String chatRoomId;
	int userNo;
	String userNickname;
	String profileImg;
	String chatRoomName;
	Date regDate;
	String latestMessage;
	Date latestMessagingDate;
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
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public String getRegDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return format.format(regDate);
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getLatestMessage() {
		return latestMessage;
	}
	public void setLatestMessage(String latestMessage) {
		this.latestMessage = latestMessage;
	}
	public String getLatestMessagingDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return format.format(latestMessagingDate);
	}
	public void setLatestMessagingDate(Date latestMessagingDate) {
		this.latestMessagingDate = latestMessagingDate;
	}
	public String getLatestEnter() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return format.format(latestEnter);
	}
	public void setLatestEnter(Date latestEnter) {
		this.latestEnter = latestEnter;
	}
	public String getLatestLeave() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return format.format(latestLeave);
	}
	public void setLatestLeave(Date latestLeave) {
		this.latestLeave = latestLeave;
	}
	
	@Override
	public String toString() {
		return "ChatRoomInfo [id=" + id + ", chatRoomId=" + chatRoomId + ", userNo=" + userNo + ", userNickname="
				+ userNickname + ", profileImg=" + profileImg + ", chatRoomName=" + chatRoomName + ", regDate="
				+ regDate + ", latestMessage=" + latestMessage + ", latestMessagingDate=" + latestMessagingDate
				+ ", latestEnter=" + latestEnter + ", latestLeave=" + latestLeave + "]";
	}
	
}
