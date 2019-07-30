package com.phoenix.mvc.service.mail;

import javax.mail.MessagingException;
import javax.mail.Store;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.Folder;
import javax.mail.Message;

public interface MailProto {
	public void open(String host, String id, String passwd) throws MessagingException, FileNotFoundException, IOException;
	
	public void close() throws MessagingException;
	
	public Message getMessages(int msgNum) throws MessagingException;
	
	public Message[] getMessages() throws MessagingException;
	
	public Message[] getRecentMessages(int count) throws MessagingException;
	
	public int getMessageCount() throws MessagingException;
	
	public String getUID(Message msg) throws MessagingException;
	
	public Folder getFolder() throws MessagingException;
	
	public Store getStore() throws MessagingException;
}