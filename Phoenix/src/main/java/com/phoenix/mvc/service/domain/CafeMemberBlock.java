package com.phoenix.mvc.service.domain;

import java.util.Date;

public class CafeMemberBlock {

	private int memberNo;
	private int blockNo;
	private Date blockStartDate;
	private Date blockEndDate;
	private String blockReason;

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBlockNo() {
		return blockNo;
	}

	public void setBlockNo(int blockNo) {
		this.blockNo = blockNo;
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

	@Override
	public String toString() {
		return "CafeMemberBlock [memberNo=" + memberNo + ", blockNo=" + blockNo + ", blockStartDate=" + blockStartDate
				+ ", blockEndDate=" + blockEndDate + ", blockReason=" + blockReason + "]";
	}

}
