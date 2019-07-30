package com.phoenix.mvc.service.mail;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Mail;

public interface MailService {
	public List<Mail> getMailList(Search search) throws Exception;
	
	public Map<String, Object> getMail(int mailNo) throws Exception;
	
	public boolean setSeenFlag(int mailNo);
	
	public boolean setSeenFlags(int[] mailNoArray);
	
	public boolean setUnSeenFlag(int mailNo);
	
	public boolean setUnSeenFlags(int[] mailNoArray);

	public boolean deleteMail(int mailNo);
	
	public boolean deleteMail(int[] mailNoArray);

}
