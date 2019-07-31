package com.phoenix.mvc.service.mail;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Mail;

public interface MailDao {
	public List<Mail> getMailList(Account account) throws Exception;
	
	public Map<String, Object> getMail(Account account, int mailNo) throws Exception;
	
	public boolean accountVaildationCheck(Account account);
}
