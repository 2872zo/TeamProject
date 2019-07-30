package com.phoenix.mvc.service.mail;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Store;

//MailProto가 IMAP과 POP중 어느 프로토콜을 사용하더라도 공통적으로 이용가능
//메일서버와 연결을 한뒤 기본적인 작동을 추상화 해놓은것
public class MailAgent {
	protected MailProto mailProto;
	protected String host;
	protected String id;
	protected String passwd;
	
	public MailAgent() {
	}
	
	public MailAgent(MailProto mailProto, String host, String id, String passwd) {
		if(mailProto == null || host == null || id == null || passwd == null) {
			throw new IllegalArgumentException();
		}
		
		this.mailProto = mailProto;
		this.host = host;
		this.id = id;
		this.passwd = passwd;
	}
	
	public void open() throws MessagingException, FileNotFoundException, IOException{
		mailProto.open(host, id, passwd);
	}
	
	public void close() throws MessagingException{
		mailProto.close();
	}
	
	public Message getMessage(int msgNum) throws MessagingException {  
        return mailProto.getMessages(msgNum);  
    }  
      
    public Message[] getMessage() throws MessagingException {  
        return mailProto.getMessages();  
    }  
      
    public Message[] getRecentMessages(int count) throws MessagingException {  
        return mailProto.getRecentMessages(count);  
    }  
      
    public String getUID(Message msg) throws MessagingException {  
        return mailProto.getUID(msg);  
    }  
      
    public int getMessageCount() throws MessagingException {  
        return mailProto.getMessageCount();  
    }  
      
    public Folder getDefaultFolder() throws MessagingException {  
        return mailProto.getFolder();  
    }  
      
    public Store getStore() throws MessagingException {  
        return mailProto.getStore();  
    }  
      
    public MailProto getMailProto() {  
        return mailProto;  
    }  
      
    public void setMailProto(MailProto mailProto) {  
        this.mailProto = mailProto;  
    }  
    
}
