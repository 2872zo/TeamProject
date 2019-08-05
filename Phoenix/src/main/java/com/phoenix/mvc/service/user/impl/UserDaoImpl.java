package com.phoenix.mvc.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;

//==> ȸ������ DAO CRUD ����
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	///Constructor
	public UserDaoImpl(SqlSession sqlSession) {
		System.out.println(this.getClass());
		this.sqlSession = sqlSession;
	}

	///Method
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}
	//get userId구현해야함
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public User getUserInfo(int userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserInfo", userNo);
	}	
	
	@Override // 준호
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}
	public List<User>getUserList(Search search) throws Exception{
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	public int getUserTotalCount(Search search)throws Exception{
		return sqlSession.selectOne("UserMapper.getUserTotalCount", search);
	}
	
	public User selectKakao(String kakaoId) throws Exception{
		return sqlSession.selectOne("UserMapper.selectKakao",kakaoId);
	}
	public User selectNaver(String naverId) throws Exception{
		return sqlSession.selectOne("UserMapper.selectNaver",naverId);
	}
	
	@Override // 준호
	public void updateUserKakao(User user) throws Exception {
		sqlSession.update("UserMapper.updateUserKakao", user);
	}
	

	///////////////////////////////////////////승규 시작///////////////////////////////////////////////
	@Override
	public boolean addMailAccount(Account account) {
		return sqlSession.insert("UserMapper.addMailAccount", account) == 1? true : false;
	}

	@Override
	public boolean deleteMailAccount(Account account) {
		return sqlSession.delete("UserMapper.deleteMailAccount", account) == 1? true : false;
	}

	@Override
	public List<Account> getMailAccount(int userNo) {
		return sqlSession.selectList("UserMapper.getMailAccount", userNo);
	}
	///////////////////////////////////////////승규 끝///////////////////////////////////////////////	
}