package com.phoenix.mvc.service.user;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.User;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;

	public User getUser(String userId) throws Exception;
	
	public User getUserInfo(int userNo) throws Exception;

	public boolean checkUserIdDuplication(String userId) throws Exception;
	
	public boolean checkUserPwDuplication(String userId) throws Exception;
}