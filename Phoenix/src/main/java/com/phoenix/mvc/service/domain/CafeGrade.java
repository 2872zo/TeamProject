package com.phoenix.mvc.service.domain;

public class CafeGrade {

	private int cafeGradeNo;
	private int cafeNo;
	private String memberGradeCode;
	private String gradeName;
	private int requiredVisitCount;
	private int requiredReplyCount;
	private int requiredPostCount;

	public int getCafeGradeNo() {
		return cafeGradeNo;
	}

	public void setCafeGradeNo(int cafeGradeNo) {
		this.cafeGradeNo = cafeGradeNo;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	public String getMemberGradeCode() {
		return memberGradeCode;
	}

	public void setMemberGradeCode(String memberGradeCode) {
		this.memberGradeCode = memberGradeCode;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getRequiredVisitCount() {
		return requiredVisitCount;
	}

	public void setRequiredVisitCount(int requiredVisitCount) {
		this.requiredVisitCount = requiredVisitCount;
	}

	public int getRequiredReplyCount() {
		return requiredReplyCount;
	}

	public void setRequiredReplyCount(int requiredReplyCount) {
		this.requiredReplyCount = requiredReplyCount;
	}

	public int getRequiredPostCount() {
		return requiredPostCount;
	}

	public void setRequiredPostCount(int requiredPostCount) {
		this.requiredPostCount = requiredPostCount;
	}

	@Override
	public String toString() {
		return "CafeGrade [cafeGradeNo=" + cafeGradeNo + ", cafeNo=" + cafeNo + ", memberGradeCode=" + memberGradeCode
				+ ", gradeName=" + gradeName + ", requiredVisitCount=" + requiredVisitCount + ", requiredReplyCount="
				+ requiredReplyCount + ", requiredPostCount=" + requiredPostCount + "]";
	}

}