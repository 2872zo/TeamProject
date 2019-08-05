package com.phoenix.mvc.service.sns.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.sns.SnsDao;

@Repository("snsDaoImpl")
public class SnsDaoImpl implements SnsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public SnsDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Account addSnsAccount(Account account) {
		sqlSession.insert("UserMapper.addSnsAccount", account);
		return account;
	}

	@Override
	public List getSnsAccount(int userNo) {
		
		return sqlSession.selectList("UserMapper.getSnsAccount", userNo);
	}

	@Override
	public boolean deleteSnsAccount(Account account) {
		
		int drop = sqlSession.delete("UserMapper.deleteSnsAccount", account);
		
		if(drop==1) {
			return true;
		}else {
		return false;
		}
	}
}
