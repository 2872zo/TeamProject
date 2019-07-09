package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.cafe.CafeManageDao;

@Repository("cafeManageDaoImpl")
public class CafeManageDaoImpl implements CafeManageDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CafeManageDaoImpl() {
		
		System.out.println(this.getClass().getName());
	}

	@Override
	public List getCafeBoard(String cafeURL) { //카페번호
		
		List boardList = sqlSession.selectList("getBoard", cafeURL);
		
		return boardList;
	}

}
