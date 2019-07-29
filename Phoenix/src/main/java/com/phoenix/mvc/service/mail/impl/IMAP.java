package com.phoenix.mvc.service.mail.impl;

import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;

import com.phoenix.mvc.service.mail.MailProto;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.IMAPStore;


//pop이나 imap방식을 추상화해놓은 mailProto를 imap방식에 맞게 구체화한 클래스
public class IMAP implements MailProto {
	protected Session session;
	protected Store store;
	protected Folder folder;
	
	private static String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	private String mailPort;
	
	@Override
	public void open(String host, String port, String id, String passwd) throws MessagingException {
		//session 생성을 위한 propertie 생성 및 설정
		Properties props = new Properties();
		props.setProperty("mail.imap.socketFactory.class", SSL_FACTORY);
		props.setProperty("mail.imap.socketFactory.fallback", "false");
		props.setProperty("mail.imap.port", port);
		props.setProperty("mail.imap.socketFactory.port", port);
		
		//session생성
		session = Session.getInstance(props, null);
		URLName urlName = new URLName("imap", host, Integer.parseInt(port), "", id, passwd);
		
		//메일 서버와 연결
		store = new IMAPStore(session,urlName);
		store.connect();
		
		//연결에서 메일을 가져와 폴더에 저장하고 연결을 유지함
		folder = store.getDefaultFolder().getFolder("INBOX");
		folder.open(Folder.READ_WRITE);
	}

	@Override
	public void close() throws MessagingException {
		if(folder != null && folder.isOpen()) {
			folder.close(true);
		}
		if(store != null && store.isConnected()) {
			store.close();
		}
	}

	@Override
	public Message getMessages(int msgNum) throws MessagingException {
		if(!folder.isOpen()) {
			throw new MessagingException("Already closed folder");
		}
		
		return folder.getMessage(msgNum);
	}

	@Override
	public Message[] getMessages() throws MessagingException {
		if(!folder.isOpen()) {
			throw new MessagingException("Already closed folder");
		}
		
		return folder.getMessages();
	}

	@Override
	public Message[] getRecentMessages(int count) throws MessagingException {
		if(!folder.isOpen()) {
			throw new MessagingException("Already closed folder");
		}
		
		int folderSize = folder.getMessageCount();
		
		return folder.getMessages(folderSize - count + 1, folderSize);
	}

	@Override
	public int getMessageCount() throws MessagingException {
		if(!folder.isOpen()) {
			throw new MessagingException("Already closed folder");
		}
		
		return folder.getMessageCount();
	}

	@Override
	public String getUID(Message msg) throws MessagingException {
		if(folder instanceof IMAPFolder) {
			return new Long(((IMAPFolder)folder).getUID(msg)).toString();
		}else {
			throw new MessagingException("Can not support");
		}
	}

	@Override
	public Folder getFolder() throws MessagingException {
		if(!folder.isOpen()) {
			throw new MessagingException("Already closed folder");
		}
		
		return folder;
	}

	@Override
	public Store getStore() throws MessagingException {
		if(!store.isConnected()) {
			throw new MessagingException("Already closed store");
		}
		
		return store;
	}
}
