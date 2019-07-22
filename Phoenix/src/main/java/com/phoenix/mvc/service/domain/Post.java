package com.phoenix.mvc.service.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Post {
	private int postNo;
	private String cafeName;
	private String cafeURL;
	private String cafeIcon;
	private int boardNo;
	private String boardName;
	private int memberNo;
	private String memberNickname;
	private String postTitle;
	private String postContent;
	private Date regDate;
	private int viewCount;
	private int likeCount;
	private boolean postStatusFlag;
	private boolean postNoticeFlag;
	private int noticeIndex;
	private List<Reply> replyList;
	
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
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
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
	public String getRegDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		
		return format.format(regDate);
	}
	public void setRegDate(Date regDate) throws ParseException {
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
	public String getCafeName() {
		return cafeName;
	}
	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}
	public String getCafeURL() {
		return cafeURL;
	}
	public void setCafeURL(String cafeURL) {
		this.cafeURL = cafeURL;
	}
	public String getCafeIcon() {
		return cafeIcon;
	}
	public void setCafeIcon(String cafeIcon) {
		this.cafeIcon = cafeIcon;
	}
	public int getNoticeIndex() {
		return noticeIndex;
	}
	public void setNoticeIndex(int noticeIndex) {
		this.noticeIndex = noticeIndex;
	}
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", cafeName=" + cafeName + ", cafeURL=" + cafeURL + ", cafeIcon=" + cafeIcon
				+ ", boardNo=" + boardNo + ", boardName=" + boardName + ", memberNo=" + memberNo + ", memberNickname="
				+ memberNickname + ", postTitle=" + postTitle + ", postContent=" + postContent + ", regDate=" + regDate
				+ ", viewCount=" + viewCount + ", likeCount=" + likeCount + ", postStatusFlag=" + postStatusFlag
				+ ", postNoticeFlag=" + postNoticeFlag + ", noticeIndex=" + noticeIndex + ", replyList=" + replyList
				+ "]";
	}
}
