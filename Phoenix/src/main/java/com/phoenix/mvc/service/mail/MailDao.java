package com.phoenix.mvc.service.mail;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Mail;

public interface MailDao {
	public List<Mail> getMailList(Search search) throws Exception;
	
	public Map<String, Object> getMail(int mailNo) throws Exception;
}
