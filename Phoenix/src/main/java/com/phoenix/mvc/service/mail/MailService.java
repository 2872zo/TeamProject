package com.phoenix.mvc.service.mail;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;

public interface MailService {
	public List<Mail> getMailList(Account account) throws Exception;
	
	public Map<String, Object> getMail(Account account, int mailNo) throws Exception;
	
	public boolean setSeenFlag(int mailNo);
	
	public boolean setSeenFlags(int[] mailNoArray);
	
	public boolean setUnSeenFlag(int mailNo);
	
	public boolean setUnSeenFlags(int[] mailNoArray);

	public boolean deleteMail(int mailNo);
	
	public boolean deleteMail(int[] mailNoArray);

	public boolean addMailAccount(Account account) throws Exception;

	public boolean deleteMailAccount(Account account);

	public boolean sendMail(Account account, Mail mail) throws MessagingException;

	

}
