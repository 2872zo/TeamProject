package com.phoenix.mvc.service.domain;

import java.util.Date;

public class Cafe {

	/// Field
	private String cafeNo;
	private String cafeName;
	private String cafeIcon;
	private String manageUserNo;
	private String managerNickname;
	private Date regDate;
	private String url;
	private String cafeDetail;
	private String bannerImg;
	private String mainImg;
	private String cafeType;
	private String applicationDetail;
	private String closeReason;
	private String applicationQuestion1;
	private String applicationQuestion2;
	private String applicationQuestion3;
	private String memberNickNameFlag;
	private String autoApplicationAcceptFlag;
	private String closedFlag;
	private int members;
	
	/// Constructor
	public Cafe() {
	}

	public String getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(String cafeNo) {
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

	public String getManageUserNo() {
		return manageUserNo;
	}

	public void setManageUserNo(String manageUserNo) {
		this.manageUserNo = manageUserNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	public String getCafeNickNameFlag() {
		return memberNickNameFlag;
	}

	public void setCafeNickNameFlag(String cafeNickNameFlag) {
		this.memberNickNameFlag = cafeNickNameFlag;
	}

	public String getAutoApplicationAcceptFlag() {
		return autoApplicationAcceptFlag;
	}

	public void setAutoApplicationAcceptFlag(String autoApplicationAcceptFlag) {
		this.autoApplicationAcceptFlag = autoApplicationAcceptFlag;
	}

	public String getClosedFlag() {
		return closedFlag;
	}

	public void setClosedFlag(String closedFlag) {
		this.closedFlag = closedFlag;
	}

	public int getMembers() {
		return members;
	}

	public void setMembers(int members) {
		this.members = members;
	}

	public String getManagerNickname() {
		return managerNickname;
	}

	public void setManagerNickname(String managerNickname) {
		this.managerNickname = managerNickname;
	}

	@Override
	public String toString() {
		return "Cafe [cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafeIcon=" + cafeIcon + ", manageUserNo="
				+ manageUserNo + ", regDate=" + regDate + ", url=" + url + ", cafeDetail=" + cafeDetail + ", bannerImg="
				+ bannerImg + ", mainImg=" + mainImg + ", cafeType=" + cafeType + ", applicationDetail="
				+ applicationDetail + ", closeReason=" + closeReason + ", applicationQuestion1=" + applicationQuestion1
				+ ", applicationQuestion2=" + applicationQuestion2 + ", applicationQuestion3=" + applicationQuestion3
				+ ", cafeNickNameFlag=" + memberNickNameFlag + ", autoApplicationAcceptFlag=" + autoApplicationAcceptFlag
				+ ", closedFlag=" + closedFlag + ", members=" + members + ", getCafeNo()=" + getCafeNo()
				+ ", getCafeName()=" + getCafeName() + ", getCafeIcon()=" + getCafeIcon() + ", getManageUserNo()="
				+ getManageUserNo() + ", getRegDate()=" + getRegDate() + ", getUrl()=" + getUrl() + ", getCafeDetail()="
				+ getCafeDetail() + ", getBannerImg()=" + getBannerImg() + ", getMainImg()=" + getMainImg()
				+ ", getCafeType()=" + getCafeType() + ", getApplicationDetail()=" + getApplicationDetail()
				+ ", getCloseReason()=" + getCloseReason() + ", getApplicationQuestion1()=" + getApplicationQuestion1()
				+ ", getApplicationQuestion2()=" + getApplicationQuestion2() + ", getApplicationQuestion3()="
				+ getApplicationQuestion3() + ", getCafeNickNameFlag()=" + getCafeNickNameFlag()
				+ ", getAutoApplicationAcceptFlag()=" + getAutoApplicationAcceptFlag() + ", getClosedFlag()="
				+ getClosedFlag() + ", getMembers()=" + getMembers() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

}