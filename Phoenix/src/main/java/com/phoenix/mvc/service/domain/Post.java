package com.phoenix.mvc.service.domain;

import java.util.Date;

public class Post {
	private int postNo;
	private int boardNo;
	private int memberNo;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private int viewCount;
	private int likeCount;
	private String memberNickname;
	private boolean postStatusFlag;
	private boolean postNoticeFlag;
	private int noticeIndex;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public boolean isPostStatusFlag() {
		return postStatusFlag;
	}
	public void setPostStatusFlag(boolean postStatusFlag) {
		this.postStatusFlag = postStatusFlag;
	}
	public boolean isPostNoticeFlag() {
		return postNoticeFlag;
	}
	public void setPostNoticeFlag(boolean postNoticeFlag) {
		this.postNoticeFlag = postNoticeFlag;
	}
	public int getNoticeIndex() {
		return noticeIndex;
	}
	public void setNoticeIndex(int noticeIndex) {
		this.noticeIndex = noticeIndex;
	}
	
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", regDate=" + regDate + ", viewCount=" + viewCount + ", likeCount="
				+ likeCount + ", memberNickname=" + memberNickname + ", postStatusFlag=" + postStatusFlag
				+ ", postNoticeFlag=" + postNoticeFlag + ", noticeIndex=" + noticeIndex + "]";
	}
}
