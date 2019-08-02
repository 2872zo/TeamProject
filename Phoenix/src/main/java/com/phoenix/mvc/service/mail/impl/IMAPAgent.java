package com.phoenix.mvc.service.mail.impl;

import javax.mail.Flags;
import javax.mail.Flags.Flag;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.search.FlagTerm;

import com.phoenix.mvc.service.mail.MailAgent;

//MailAgent를 상속하여 pop과 imap의 공통기능을 사용하고
//IMAP만의 고유기능을 구현해 놓은 클래스
public class IMAPAgent extends MailAgent{
	public IMAPAgent(String host, String id, String passwd) {  
        super(new IMAP(), host, id, passwd);  
    }  
      
    public Folder getFolder(String name) throws MessagingException {  
        return getStore().getFolder(name);  
    }  
      
    public Message[] getUnReadMessages() throws MessagingException {  
        return getDefaultFolder().search(new FlagTerm(new Flags(Flags.Flag.SEEN), false));  
    }  
      
    public void createFolder(String name) throws MessagingException {  
        Folder folder = getStore().getFolder(name);  
        if( !folder.exists() ) {  
            folder.create(Folder.HOLDS_MESSAGES);  
        }  
    }  
      
    public void moveMessage(Message[] message, Folder src, Folder dest) throws MessagingException {  
        src.copyMessages(message, dest);  
        src.setFlags(message, new Flags(Flags.Flag.DELETED), true);  
    }  
      
    //메세지 하나만 읽음 처리할때
    public void setSeenFlag(Message message) throws MessagingException {  
        setFlags(message, Flags.Flag.SEEN, true);  
    }  
    
    //여러개 한번에 읽음 처리할때
    public void setSeenFlag(Folder folder, int[] msgnums) throws MessagingException {
    	folder.setFlags(msgnums, new Flags(Flags.Flag.SEEN), true);
    }

    //메세지 하나만 읽지않음 처리할때
    public void setUnSeenFlag(Message message) throws MessagingException {  
        setFlags(message, Flags.Flag.SEEN, false);  
    }  
    
    //여러개 한번에 읽지않음 처리할떄
    public void setUnSeenFlag(Folder folder, int[] msgnums) throws MessagingException {
    	folder.setFlags(msgnums, new Flags(Flags.Flag.SEEN), false);
    }
      
    public void setFlags(Message message, Flag flag, boolean set) throws MessagingException {  
        message.setFlag(flag, set);  
    }  
      
    public boolean hasNewMessage(Folder folder) throws MessagingException {  
        return folder.hasNewMessages();  
    }
}
