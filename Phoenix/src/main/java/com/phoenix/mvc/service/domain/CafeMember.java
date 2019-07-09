package com.phoenix.mvc.service.domain;

import java.util.Date;

public class CafeMember {

	private String memberNo;
	private String cafeNo;
	private String userNo;
	private String cafeMemberGradeNo;
	private Character noticeFlag;
	private String memberNickname;
	private String memberStatusCode;
	private Character favoriteFlag;
	private Date regDate;
	private String visitCount;
	
	public CafeMember() {

	}
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getCafeNo() {
		return cafeNo;
	}
	public void setCafeNo(String cafeNo) {
		this.cafeNo = cafeNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getCafeMemberGradeNo() {
		return cafeMemberGradeNo;
	}
	public void setCafeMemberGradeNo(String cafeMemberGradeNo) {
		this.cafeMemberGradeNo = cafeMemberGradeNo;
	}
	public Character getNoticeFlag() {
		return noticeFlag;
	}
	public void setNoticeFlag(Character noticeFlag) {
		this.noticeFlag = noticeFlag;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberStatusCode() {
		return memberStatusCode;
	}
	public void setMemberStatusCode(String memberStatusCode) {
		this.memberStatusCode = memberStatusCode;
	}
	public Character getFavoriteFlag() {
		return favoriteFlag;
	}
	public void setFavoriteFlag(Character favoriteFlag) {
		this.favoriteFlag = favoriteFlag;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}

	@Override
	public String toString() {
		return "CafeMember [memberNo=" + memberNo + ", cafeNo=" + cafeNo + ", userNo=" + userNo + ", cafeMemberGradeNo="
				+ cafeMemberGradeNo + ", noticeFlag=" + noticeFlag + ", memberNickname=" + memberNickname
				+ ", memberStatusCode=" + memberStatusCode + ", favoriteFlag=" + favoriteFlag + ", regDate=" + regDate
				+ ", visitCount=" + visitCount + "]";
	}
	
	

}
