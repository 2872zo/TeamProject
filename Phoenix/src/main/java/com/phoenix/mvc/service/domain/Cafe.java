package com.phoenix.mvc.service.domain;

import java.util.Date;

public class Cafe {

	/// Field
	private int cafeNo;
	private String cafeName;
	private String cafeIcon;
	private int manageUserNo;
	private String managerNickname;
	private Date regDate;
	private String URL;
	private String cafeDetail;
	private String bannerImg;
	private String mainImg;
	private String cafeType;
	private String applicationDetail;
	private String closeReason;
	private String applicationQuestion1;
	private String applicationQuestion2;
	private String applicationQuestion3;
	private boolean memberNicknameFlag;
	private boolean autoApplicationAcceptFlag;
	private boolean closedFlag;
	private int members;
	private int memberNo;
	private boolean favorited;
	
	
	/// Constructor
	public Cafe(){		
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getCafeIcon() {
		return cafeIcon;
	}

	public void setCafeIcon(String cafeIcon) {
		this.cafeIcon = cafeIcon;
	}

	public int getManageUserNo() {
		return manageUserNo;
	}

	public void setManageUserNo(int manageUserNo) {
		this.manageUserNo = manageUserNo;
	}

	public String getManagerNickname() {
		return managerNickname;
	}

	public void setManagerNickname(String managerNickname) {
		this.managerNickname = managerNickname;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public String getCafeDetail() {
		return cafeDetail;
	}

	public void setCafeDetail(String cafeDetail) {
		this.cafeDetail = cafeDetail;
	}

	public String getBannerImg() {
		return bannerImg;
	}

	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getCafeType() {
		return cafeType;
	}

	public void setCafeType(String cafeType) {
		this.cafeType = cafeType;
	}

	public String getApplicationDetail() {
		return applicationDetail;
	}

	public void setApplicationDetail(String applicationDetail) {
		this.applicationDetail = applicationDetail;
	}

	public String getCloseReason() {
		return closeReason;
	}

	public void setCloseReason(String closeReason) {
		this.closeReason = closeReason;
	}

	public String getApplicationQuestion1() {
		return applicationQuestion1;
	}

	public void setApplicationQuestion1(String applicationQuestion1) {
		this.applicationQuestion1 = applicationQuestion1;
	}

	public String getApplicationQuestion2() {
		return applicationQuestion2;
	}

	public void setApplicationQuestion2(String applicationQuestion2) {
		this.applicationQuestion2 = applicationQuestion2;
	}

	public String getApplicationQuestion3() {
		return applicationQuestion3;
	}

	public void setApplicationQuestion3(String applicationQuestion3) {
		this.applicationQuestion3 = applicationQuestion3;
	}

	public boolean isMemberNicknameFlag() {
		return memberNicknameFlag;
	}

	public void setMemberNicknameFlag(boolean memberNicknameFlag) {
		this.memberNicknameFlag = memberNicknameFlag;
	}

	public boolean isAutoApplicationAcceptFlag() {
		return autoApplicationAcceptFlag;
	}

	public void setAutoApplicationAcceptFlag(boolean autoApplicationAcceptFlag) {
		this.autoApplicationAcceptFlag = autoApplicationAcceptFlag;
	}

	public boolean isClosedFlag() {
		return closedFlag;
	}

	public void setClosedFlag(boolean closedFlag) {
		this.closedFlag = closedFlag;
	}

	public int getMembers() {
		return members;
	}

	public void setMembers(int members) {
		this.members = members;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public boolean isFavorited() {
		return favorited;
	}

	public void setFavorited(boolean favorited) {
		this.favorited = favorited;
	}

	@Override
	public String toString() {
		return "Cafe [cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafeIcon=" + cafeIcon + ", manageUserNo="
				+ manageUserNo + ", managerNickname=" + managerNickname + ", regDate=" + regDate + ", URL=" + URL
				+ ", cafeDetail=" + cafeDetail + ", bannerImg=" + bannerImg + ", mainImg=" + mainImg + ", cafeType="
				+ cafeType + ", applicationDetail=" + applicationDetail + ", closeReason=" + closeReason
				+ ", applicationQuestion1=" + applicationQuestion1 + ", applicationQuestion2=" + applicationQuestion2
				+ ", applicationQuestion3=" + applicationQuestion3 + ", memberNicknameFlag=" + memberNicknameFlag
				+ ", autoApplicationAcceptFlag=" + autoApplicationAcceptFlag + ", closedFlag=" + closedFlag
				+ ", members=" + members + "]";
	}

	

}