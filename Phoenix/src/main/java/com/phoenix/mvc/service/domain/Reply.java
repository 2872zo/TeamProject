package com.phoenix.mvc.service.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Reply {
	private int replyNo;
	private int postNo;
	private int memberNo;
	private String memberIcon;
	private String memberNickname;
	private int targetReplyNo;
	private String targetReplyMember;
	private String replyContent;
	private Date regDate;
	private int likeCount;
	private boolean replyStatusFlag;
	private List<Reply> reReplyList;
	
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
	public String getMemberIcon() {
		return memberIcon;
	}
	public void setMemberIcon(String memberIcon) {
		this.memberIcon = memberIcon;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getTargetReplyNo() {
		return targetReplyNo;
	}
	public void setTargetReplyNo(int targetReplyNo) {
		this.targetReplyNo = targetReplyNo;
	}
	public String getTargetReplyMember() {
		return targetReplyMember;
	}
	public void setTargetReplyMember(String targetReplyMember) {
		this.targetReplyMember = targetReplyMember;
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
	public List<Reply> getReReplyList() {
		return reReplyList;
	}
	public void setReReplyList(List<Reply> reReplyList) {
		this.reReplyList = reReplyList;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", postNo=" + postNo + ", memberNo=" + memberNo + ", memberIcon="
				+ memberIcon + ", memberNickname=" + memberNickname + ", targetReplyNo=" + targetReplyNo
				+ ", targetReplyMember=" + targetReplyMember + ", replyContent=" + replyContent + ", regDate=" + regDate
				+ ", likeCount=" + likeCount + ", replyStatusFlag=" + replyStatusFlag + ", reReplyList=" + reReplyList
				+ "]";
	}
}
