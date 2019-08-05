package com.phoenix.mvc.service.user.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;
import com.phoenix.mvc.service.user.UserService;


//==> ȸ������ ���� ����
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Autowired
	@Qualifier("chattingDaoImpl")	
	private ChattingDao chattingDao;
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);	
	}
/////////////////////////////준호시작///////////////////////////////////
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}
	
	public User getUserInfo(int userNo) throws Exception {
		return userDao.getUserInfo(userNo);
	}	
	
	@Override // 준호
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		chattingDao.updateChatRoomInfoByUser(user);
	}
	
	public boolean checkUserIdDuplication(String userId) throws Exception {
		
		boolean result=true;
		
		User user = userDao.getUser(userId);
		
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public boolean checkUserPwDuplication(String userId) throws Exception {
		
		boolean result=true;
		
		User user = userDao.getUser(userId);
		
		if(user == null) {
			result=false;
		}
		return result;
	}	
	
	public Map<String, Object>getUserList(Search search)throws Exception{
		
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getUserTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public User getKakao(String kakaoId) throws Exception{		
		return userDao.selectKakao(kakaoId);
	}
	
	@Override
	public User getNaver(String naverId) throws Exception {

		return userDao.selectNaver(naverId);
	}
	
	public void updateUserKakao(User user) throws Exception {
		userDao.updateUserKakao(user);		
	}
	

	
/////////////////////////////준호끝///////////////////////////////////
	
	////////////////////////////승규시작///////////////////////////////////
	@Override
	public List<Account> getMailAccount(int userNo) {
		return userDao.getMailAccount(userNo);
	}
	

	@Override
	public List<List<Account>> getAllAccount(int userNo) throws Exception {
		List<List<Account>> allAccountList = new ArrayList<List<Account>>();
		allAccountList.add(userDao.getMailAccount(userNo));
		allAccountList.add(userDao.getShoppingmallAccount(userNo));
		allAccountList.add(userDao.getSnsAccount(userNo));
		
		return allAccountList;
	}

	@Override
	public boolean deleteAccount(Account account) {
		return userDao.deleteAccount(account);
	}
	//////////////////////////////승규 끝/////////////////////////////////
}