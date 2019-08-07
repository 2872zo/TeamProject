package com.phoenix.mvc.service.user;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.User;


public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;

	public User getUser(String userId) throws Exception;
	
	public User getUserInfo(int userNo) throws Exception;

	public boolean checkUserIdDuplication(String userId) throws Exception;
	
	public boolean checkUserNicknameDuplication(String userNickname) throws Exception;
	
	public boolean checkUserPwDuplication(String userId) throws Exception;
	
	public Map<String, Object>getUserList(Search search) throws Exception;
	
	public User getKakao(String kakaoId) throws Exception;
	
	public User getNaver(String naverId) throws Exception;
	
	public List<Account> getMailAccount(int userNo);
	
	public void updateUserKakao(User user) throws Exception;

	public List<List<Account>> getAllAccount(int userNo) throws Exception;
	
	public boolean deleteAccount(Account account);
}