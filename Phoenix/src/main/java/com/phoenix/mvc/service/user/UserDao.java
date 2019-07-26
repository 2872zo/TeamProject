package com.phoenix.mvc.service.user;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception;

	public void updateUser(User user) throws Exception;

	public User getUser(String userId) throws Exception;
	
	public User getUserInfo(int userNo) throws Exception;

	public List<User>getUserList(Search search) throws Exception;
	
	public int getUserTotalCount(Search search) throws Exception;
	
}