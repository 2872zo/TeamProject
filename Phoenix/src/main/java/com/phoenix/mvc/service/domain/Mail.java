package com.phoenix.mvc.service.domain;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.Address;
import javax.mail.Folder;

public class Mail {

	private int mailNo;
	private int accountNo;
	private Folder folder;
	private Date sentDate;
	private String sender;
	private String senderAddr;
	private List<Map<String, String>> recipients;
	private String to;
	private String subject;
	private String content;
	private List<Map<String, Object>> attachmentList;
	private String inlineList;
	private String accountDomain;
	private boolean seen;
	private boolean trash;
	private boolean flag;
	
	
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
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
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public boolean isSeen() {
		return seen;
	}
	public void setSeen(boolean seen) {
		this.seen = seen;
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
	public List<Map<String, String>> getRecipients() {
		return recipients;
	}
	public void setRecipients(List<Map<String, String>> recipients) {
		this.recipients = recipients;
	}
	public List<Map<String, Object>> getAttachmentList() {
		return attachmentList;
	}
	public void setAttachmentList(List<Map<String, Object>> attachmentList) {
		this.attachmentList = attachmentList;
	}
	public String getInlineList() {
		return inlineList;
	}
	public void setInlineList(String inlineList) {
		this.inlineList = inlineList;
	}
	
	public String getAccountDomain() {
		return accountDomain;
	}
	public void setAccountDomain(String accountDomain) {
		this.accountDomain = accountDomain;
	}
	public boolean isTrash() {
		return trash;
	}
	public void setTrash(boolean trash) {
		this.trash = trash;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "Mail [mailNo=" + mailNo + ", accountNo=" + accountNo + ", folder=" + folder + ", sentDate=" + sentDate
				+ ", sender=" + sender + ", senderAddr=" + senderAddr + ", recipients=" + recipients + ", to=" + to
				+ ", subject=" + subject + ", content=" + content + ", attachmentList=" + attachmentList
				+ ", inlineList=" + inlineList + ", accountDomain=" + accountDomain + ", seen=" + seen + ", trash="
				+ trash + ", flag=" + flag + "]";
	}
}
