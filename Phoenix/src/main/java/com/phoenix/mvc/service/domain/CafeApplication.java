package com.phoenix.mvc.service.domain;

import java.util.Date;

public class CafeApplication {

	private String applicationNo;
	private String userNo;
	private String cafeNo;
	private Date regDate;
	private String question1;
	private String question2;
	private String question3;
	private String answer1;
	private String answer2;
	private String answer3;
	private String acceptStatusCode;
	private String cafeNickname;
	
	public CafeApplication() {

	}
	
	public String getApplicationNo() {
		return applicationNo;
	}


	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getCafeNo() {
		return cafeNo;
	}


	public void setCafeNo(String cafeNo) {
		this.cafeNo = cafeNo;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getQuestion1() {
		return question1;
	}


	public void setQuestion1(String question1) {
		this.question1 = question1;
	}


	public String getQuestion2() {
		return question2;
	}


	public void setQuestion2(String question2) {
		this.question2 = question2;
	}


	public String getQuestion3() {
		return question3;
	}


	public void setQuestion3(String question3) {
		this.question3 = question3;
	}


	public String getAnswer1() {
		return answer1;
	}


	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}


	public String getAnswer2() {
		return answer2;
	}


	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}


	public String getAnswer3() {
		return answer3;
	}


	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}


	public String getAcceptStatusCode() {
		return acceptStatusCode;
	}


	public void setAcceptStatusCode(String acceptStatusCode) {
		this.acceptStatusCode = acceptStatusCode;
	}

	public String getCafeNickname() {
		return cafeNickname;
	}

	public void setCafeNickname(String cafeNickname) {
		this.cafeNickname = cafeNickname;
	}

	@Override
	public String toString() {
		return "CafeApplication [applicationNo=" + applicationNo + ", userNo=" + userNo + ", cafeNo=" + cafeNo
				+ ", regDate=" + regDate + ", question1=" + question1 + ", question2=" + question2 + ", question3="
				+ question3 + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3=" + answer3
				+ ", acceptStatusCode=" + acceptStatusCode + ", cafeNickname=" + cafeNickname + "]";
	}




}
