package com.phoenix.mvc.web.mail;

import javax.mail.MessagingException;
import javax.mail.Store;
import javax.mail.Folder;
import javax.mail.Message;

public interface MailProto {
	public void open(String host, String port, String id, String passwd) throws MessagingException;
	
	public void close() throws MessagingException;
	
	public Message getMessages(int msgNum) throws MessagingException;
	
	public Message[] getMessages() throws MessagingException;
	
	public Message[] getRecentMessages(int count) throws MessagingException;
	
	public int getMessageCount() throws MessagingException;
	
	public String getUID(Message msg) throws MessagingException;
	
	public Folder getFolder() throws MessagingException;
	
	public Folder[] getPersonalFolders() throws MessagingException;
	
	public Folder[] getSharedFolders() throws MessagingException;
	
	public Folder[] getUserFolders(String user) throws MessagingException;
	
	public Store getStore() throws MessagingException;
}
