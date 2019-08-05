package com.phoenix.mvc.service.mail;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;

public interface MailService {
	public Map<String, Object> getMailList(Account account, int currentPage) throws Exception;
	
	public Map<String, Object> getAllAccountMailList(List<Account> accountList, int currentPage) throws MessagingException, FileNotFoundException, IOException;
	
	public Map<String, Object> getMail(Account account, int mailNo) throws Exception;
	
	public boolean setSeenFlag(int mailNo);
	
	public boolean setSeenFlags(int[] mailNoArray);
	
	public boolean setUnSeenFlag(int mailNo);
	
	public boolean setUnSeenFlags(int[] mailNoArray);

	public boolean deleteMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException;

	public boolean addMailAccount(Account account) throws Exception;

	public boolean deleteMailAccount(Account account);

	public boolean sendMail(Account account, Mail mail) throws MessagingException;

	public Map<String, Object> getAllAccountSentMailList(List<Account> accountList, int currentPage) throws FileNotFoundException, MessagingException, IOException;

	public Map<String, Object> getAllAccountFlagMailList(List<Account> accountList, int currentPage) throws FileNotFoundException, MessagingException, IOException;

	public Map<String, Object> getAllAccountDeletedMailList(List<Account> accountList, int currentPage) throws FileNotFoundException, MessagingException, IOException;

	public boolean setSeenMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException;

	public boolean setUnSeenMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException;

	public boolean trashMail(List<Map<String, Object>> mailInfoList, List<Account> accountList) throws FileNotFoundException, MessagingException, IOException;
}
