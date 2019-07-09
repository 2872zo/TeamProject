package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.domain.Post;

@Repository
public class CafePostDaoImpl implements CafePostDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public CafePostDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List<Post> getBoard(Search search) {
		return sqlSession.selectList("getBoard",search);
	}
}
