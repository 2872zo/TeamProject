package com.phoenix.mvc.service.cafe.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

@Repository("cafeMemberDaoImpl")
public class CafeMemberDaoImpl implements CafeMemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	public CafeMemberDaoImpl(SqlSession sqlSession) {
		System.out.println(this.getClass());
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {
		sqlSession.insert("addCafeApplication",cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {
		sqlSession.update("CafeMemberMapper.updateCafeMember", cafeMember);
		
	}
	
}
