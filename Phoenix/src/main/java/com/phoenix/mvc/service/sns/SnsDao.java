package com.phoenix.mvc.service.sns;

import java.util.List;

import com.phoenix.mvc.service.domain.Account;

public interface SnsDao {
	
	public Account addSnsAccount(Account account);
	
	public List getSnsAccount(int userNo);
	
	public boolean deleteSnsAccount(Account account);
	
	

}
