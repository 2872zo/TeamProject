package com.phoenix.mvc.service.domain;

import java.util.Date;

import javax.mail.Folder;

public class Mail {

	private int mailNo;
	private Folder folder;
	private Date sentDate;
	private String sender;
	private String senderAddr;
	private String subject;
	private String content;
	
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}
	public Folder getFolder() {
		return folder;
	}
	public void setFolder(Folder folder) {
		this.folder = folder;
	}
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getSenderAddr() {
		return senderAddr;
	}
	public void setSenderAddr(String senderAddr) {
		this.senderAddr = senderAddr;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Mail [mailNo=" + mailNo + ", folder=" + folder + ", sentDate=" + sentDate + ", sender=" + sender
				+ ", senderAddr=" + senderAddr + ", subject=" + subject + ", content=" + content + "]";
	}
}
