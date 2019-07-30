package com.phoenix.mvc.service.domain;

public class Account {
	private int accountNo;
	private int userNo;
	private String accountType;
	private String accountId;
	private String accountPw;
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getAccountPw() {
		return accountPw;
	}
	public void setAccountPw(String accountPw) {
		this.accountPw = accountPw;
	}
	
	@Override
	public String toString() {
		return "Account [accountNo=" + accountNo + ", userNo=" + userNo + ", accountType=" + accountType
				+ ", accountId=" + accountId + ", accountPw=" + accountPw + "]";
	}
}
