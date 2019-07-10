package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.Map;

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
		sqlSession.insert("CafeApplicationMapper.addCafeApplication",cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {
		sqlSession.update("CafeMemberMapper.updateCafeMember", cafeMember);
		
	}

	@Override //예림예림
	public CafeMember getCafeMember(int cafeNo, int userNo) {
		
		HashMap map = new HashMap();
		map.put("cafeNo", cafeNo);
		map.put("userNo", userNo);
		
		CafeMember cafeMember = new CafeMember();
		
		cafeMember = sqlSession.selectOne("getCafeMember", map);
		
		if(cafeMember.getUserNo() == null) // 유저가 해당하는 카페 멤버가아닌경우(db값이 없으면)
		{
			cafeMember.setUserNo("500"); //cafe
		}
		
		return cafeMember;
	}
	
}
