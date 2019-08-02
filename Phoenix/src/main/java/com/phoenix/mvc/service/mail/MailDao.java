package com.phoenix.mvc.service.mail;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;

public interface MailDao {
	public Map<String, Object> getMailList(Account account, int currentPage) throws Exception;
	
	public Map<String, Object> getMail(Account account, int mailNo) throws Exception;
	
	public boolean accountVaildationCheck(Account account) throws Exception;

	public boolean sendGmail(Account account, Mail mail) throws MessagingException;

	public boolean sendNaver(Account account, Mail mail) throws MessagingException;

	public boolean sendDaum(Account account, Mail mail) throws MessagingException;

	public Map<String, Object> getAllAccountMailList(List<Account> accountList, int currentPage) throws MessagingException, FileNotFoundException, IOException;

	public Map<String, Object> getAllAccountSentMailList(List<Account> accountList, int currentPage) throws FileNotFoundException, MessagingException, IOException;
	
	public Map<String, Object> getSentMail(Account account, int mailNo) throws Exception;
}
