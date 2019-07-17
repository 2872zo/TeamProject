package com.phoenix.mvc.service.domain;

import java.sql.Date;

public class User {
	
	///Field
	private int userNo;
	private String userId;
	private String userName;
	private String userNickname;
	private String password;
	private String email;
	private int phone;
	private String profileImg;
	private Date regDate;
	private String userRoleCode;
	private String userStatusCode;


	////////////////////////////////////////////////////////////////////userNo추가
	
	///Constructor
	public User(){
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserNickname() {
		return userNickname;
	}


	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getUserRoleCode() {
		return userRoleCode;
	}


	public void setUserRoleCode(String userRoleCode) {
		this.userRoleCode = userRoleCode;
	}


	public String getUserStatusCode() {
		return userStatusCode;
	}


	public void setUserStatusCode(String userStatusCode) {
		this.userStatusCode = userStatusCode;
	}


	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userNickname="
				+ userNickname + ", password=" + password + ", email=" + email + ", phone=" + phone + ", profileImg="
				+ profileImg + ", regDate=" + regDate + ", userRoleCode=" + userRoleCode + ", userStatusCode="
				+ userStatusCode + "]";
	}
	
	///Method 
	

}