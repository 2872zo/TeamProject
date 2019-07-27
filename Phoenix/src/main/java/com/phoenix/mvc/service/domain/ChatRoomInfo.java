package com.phoenix.mvc.service.domain;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ChatRoomInfo {
	
	String id;
	String chatRoomId;
	int userNo;
	String userNickname;
	String profileImg;
	String ChatRoomName;
	Date regDate;
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
		return ChatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		ChatRoomName = chatRoomName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getLatestMessagingDate() {
		return latestMessagingDate;
	}
	public void setLatestMessagingDate(Date latestMessagingDate) {
		this.latestMessagingDate = latestMessagingDate;
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
		return "ChatRoomInfo [id=" + id + ", chatRoomId=" + chatRoomId + ", userNo=" + userNo + ", userNickname="
				+ userNickname + ", profileImg=" + profileImg + ", ChatRoomName=" + ChatRoomName + ", regDate="
				+ regDate + ", latestMessagingDate=" + latestMessagingDate + ", latestEnter=" + latestEnter
				+ ", latestLeave=" + latestLeave + "]";
	}
	
}
