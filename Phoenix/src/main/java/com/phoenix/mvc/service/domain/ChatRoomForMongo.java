package com.phoenix.mvc.service.domain;

import org.joda.time.DateTime;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ChatRoomForMongo {

	private String id;
	private int openUserNo;
	private String roomName;
	private String roomImg;
	private DateTime regDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOpenUserNo() {
		return openUserNo;
	}

	public void setOpenUserNo(int openUserNo) {
		this.openUserNo = openUserNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomImg() {
		return roomImg;
	}

	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}

	public DateTime getRegDate() {
		return regDate;
	}

	public void setRegDate(DateTime regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ChatRoomForMongo [id=" + id + ", openUserNo=" + openUserNo + ", roomName=" + roomName + ", roomImg="
				+ roomImg + ", regDate=" + regDate + "]";
	}

}
