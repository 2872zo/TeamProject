package com.phoenix.mvc.service.domain;

import java.util.List;

public class CafeGrade {

	private int cafeGradeNo;
	private int cafeNo;
	private String memberGradeCode;
	private String gradeName;
	private int requiredVisitCount;
	private int requiredReplyCount;
	private int requiredPostCount;
	private boolean gradeFlag;
	private boolean autoUpgradeFlag;
	private List<CafeGrade> gradeList;
	
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
	public boolean isGradeFlag() {
		return gradeFlag;
	}
	public void setGradeFlag(boolean gradeFlag) {
		this.gradeFlag = gradeFlag;
	}
	public boolean isAutoUpgradeFlag() {
		return autoUpgradeFlag;
	}
	public void setAutoUpgradeFlag(boolean autoUpgradeFlag) {
		this.autoUpgradeFlag = autoUpgradeFlag;
	}
	public List<CafeGrade> getGradeList() {
		return gradeList;
	}
	public void setGradeList(List<CafeGrade> gradeList) {
		this.gradeList = gradeList;
	}
	@Override
	public String toString() {
		return "CafeGrade [cafeGradeNo=" + cafeGradeNo + ", cafeNo=" + cafeNo + ", memberGradeCode=" + memberGradeCode
				+ ", gradeName=" + gradeName + ", requiredVisitCount=" + requiredVisitCount + ", requiredReplyCount="
				+ requiredReplyCount + ", requiredPostCount=" + requiredPostCount + ", gradeFlag=" + gradeFlag
				+ ", autoUpgradeFlag=" + autoUpgradeFlag + ", gradeList=" + gradeList + "]";
	}
	
	
	
}