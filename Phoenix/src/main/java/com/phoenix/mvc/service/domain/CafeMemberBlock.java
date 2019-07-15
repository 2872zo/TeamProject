package com.phoenix.mvc.service.domain;

import java.util.Date;

public class CafeMemberBlock {
	
	private int cafeNo;
	private int memberNo;
	private int blockNo;
	private Date blockStartDate;
	private Date blockEndDate;
	private int period;
	private String blockReason;
	
	public int getCafeNo() {
		return cafeNo;
	}
	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}
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
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public String getBlockReason() {
		return blockReason;
	}
	public void setBlockReason(String blockReason) {
		this.blockReason = blockReason;
	}
	
	@Override
	public String toString() {
		return "CafeMemberBlock [cafeNo=" + cafeNo + ", memberNo=" + memberNo + ", blockNo=" + blockNo
				+ ", blockStartDate=" + blockStartDate + ", blockEndDate=" + blockEndDate + ", period=" + period
				+ ", blockReason=" + blockReason + "]";
	}
		
}
