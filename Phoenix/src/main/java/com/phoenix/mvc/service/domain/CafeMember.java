package com.phoenix.mvc.service.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CafeMember {

	private int memberNo;
	private int cafeNo;
	private int userNo;
	private String memberNickname;
	private String memberStatusCode;
	private boolean noticeFlag;
	private boolean favoriteFlag;
	private int cafeMemberGradeNo;
	private int changeGradeNo;
	private String memberGrade;
	private String gradeName;
	private Date regDate;
	private int visitCount;
	private int postCount;
	private int replyCount;
	private int blockPeriod;
	private Date blockStartDate;
	private Date blockEndDate;
	private String blockReason;
	private ArrayList<CafeMemberBlock> blocks;
	private List<CafeMember> cafeMemberList;
	private boolean memberNicknameFlag;
	
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
	public boolean isNoticeFlag() {
		return noticeFlag;
	}
	public void setNoticeFlag(boolean noticeFlag) {
		this.noticeFlag = noticeFlag;
	}
	public boolean isFavoriteFlag() {
		return favoriteFlag;
	}
	public void setFavoriteFlag(boolean favoriteFlag) {
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
	public int getChangeGradeNo() {
		return changeGradeNo;
	}
	public void setChangeGradeNo(int changeGradeNo) {
		this.changeGradeNo = changeGradeNo;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getRegDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		return format.format(regDate);
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
	public int getBlockPeriod() {
		return blockPeriod;
	}
	public void setBlockPeriod(int blockPeriod) {
		this.blockPeriod = blockPeriod;
	}
	public Date getBlockStartDate() {
		return blockStartDate;
	}
	public void setBlockStartDate(Date blockStartDate) {
		this.blockStartDate = blockStartDate;
	}
	public Date getBlockEndDate() {
		return blockEndDate;
	}
	public void setBlockEndDate(Date blockEndDate) {
		this.blockEndDate = blockEndDate;
	}
	public String getBlockReason() {
		return blockReason;
	}
	public void setBlockReason(String blockReason) {
		this.blockReason = blockReason;
	}
	public ArrayList<CafeMemberBlock> getBlocks() {
		return blocks;
	}
	public void setBlocks(ArrayList<CafeMemberBlock> blocks) {
		this.blocks = blocks;
	}
	public List<CafeMember> getCafeMemberList() {
		return cafeMemberList;
	}
	public void setCafeMemberList(List<CafeMember> cafeMemberList) {
		this.cafeMemberList = cafeMemberList;
	}

	public boolean isMemberNicknameFlag() {
		return memberNicknameFlag;
	}
	public void setMemberNicknameFlag(boolean memberNicknameFlag) {
		this.memberNicknameFlag = memberNicknameFlag;
	}
	@Override
	public String toString() {
		return "CafeMember [memberNo=" + memberNo + ", cafeNo=" + cafeNo + ", userNo=" + userNo + ", memberNickname="
				+ memberNickname + ", memberStatusCode=" + memberStatusCode + ", noticeFlag=" + noticeFlag
				+ ", favoriteFlag=" + favoriteFlag + ", cafeMemberGradeNo=" + cafeMemberGradeNo + ", changeGradeNo="
				+ changeGradeNo + ", memberGrade=" + memberGrade + ", gradeName=" + gradeName + ", regDate=" + regDate
				+ ", visitCount=" + visitCount + ", postCount=" + postCount + ", replyCount=" + replyCount
				+ ", blockPeriod=" + blockPeriod + ", blockStartDate=" + blockStartDate + ", blockEndDate="
				+ blockEndDate + ", blockReason=" + blockReason + ", blocks=" + blocks + ", cafeMemberList="
				+ cafeMemberList + ", memberNicknameFlag=" + memberNicknameFlag + "]";
	}
	
	
}
