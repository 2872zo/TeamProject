package com.phoenix.mvc.service.sns;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.TimeLine;

public interface SnsService {

	public Map<String, Object> getFaceBookTimeLineList(Search search) throws InterruptedException;
	
	public Map<String, Object> getInstaTimeLineList(Search search) throws InterruptedException;
	
	public TimeLine writeFb(Search search);
	
	public Account fbLogIn(Account account);		
	
	public Account igLogIn(Account account) throws InterruptedException;

	public List getSnsAccount(Search search);
}
