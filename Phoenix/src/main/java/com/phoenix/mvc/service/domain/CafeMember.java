package com.phoenix.mvc.service.domain;

import java.util.Date;

public class CafeMember {

	private int memberNo;
	private int cafeNo;
	private int userNo;
	private String memberNickname;
	private String memberStatusCode;
	private Character noticeFlag;
	private Character favoriteFlag;
	private int cafeMemberGradeNo;
	private String memberGrade;
	private String gradeName;
	private Date regDate;
	private int visitCount;
	private int postCount;
	private int replyCount;

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCafeNo() {
		return cafeNo;
	}
	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public Character getNoticeFlag() {
		return noticeFlag;
	}
	public void setNoticeFlag(Character noticeFlag) {
		this.noticeFlag = noticeFlag;
	}
	public Character getFavoriteFlag() {
		return favoriteFlag;
	}
	public void setFavoriteFlag(Character favoriteFlag) {
		this.favoriteFlag = favoriteFlag;
	}
	public int getCafeMemberGradeNo() {
		return cafeMemberGradeNo;
	}
	public void setCafeMemberGradeNo(int cafeMemberGradeNo) {
		this.cafeMemberGradeNo = cafeMemberGradeNo;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	public int getPostCount() {
		return postCount;
	}
	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	@Override
	public String toString() {
		return "CafeMember [memberNo=" + memberNo + ", cafeNo=" + cafeNo + ", userNo=" + userNo + ", memberNickname="
				+ memberNickname + ", memberStatusCode=" + memberStatusCode + ", noticeFlag=" + noticeFlag
				+ ", favoriteFlag=" + favoriteFlag + ", cafeMemberGradeNo=" + cafeMemberGradeNo + ", memberGrade="
				+ memberGrade + ", gradeName=" + gradeName + ", regDate=" + regDate + ", visitCount=" + visitCount
				+ ", postCount=" + postCount + ", replyCount=" + replyCount + "]";
	}
	
}
