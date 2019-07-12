package com.phoenix.mvc.service.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
	private int replyNo;
	private int postNo;
	private int memberNo;
	private String memberNickname;
	private String replyContent;
	private Date regDate;
	private int likeCount;
	private boolean replyStatusFlag;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getRegDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(regDate);
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public boolean isReplyStatusFlag() {
		return replyStatusFlag;
	}
	public void setReplyStatusFlag(boolean replyStatusFlag) {
		this.replyStatusFlag = replyStatusFlag;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", postNo=" + postNo + ", memberNo=" + memberNo + ", memberNickname="
				+ memberNickname + ", reply_content=" + replyContent + ", regDate=" + regDate + ", likeCount="
				+ likeCount + ", replyStatusFlag=" + replyStatusFlag + "]";
	}
}
