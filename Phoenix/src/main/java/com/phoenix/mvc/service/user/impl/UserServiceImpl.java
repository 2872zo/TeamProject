package com.phoenix.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
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
	}
/////////////////////////////준호끝///////////////////////////////////
	



}