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
	public List<Post> listPostBySearch(Search search) {
		return sqlSession.selectList("PostMapper.listPostBySearch", search);
	}
	
	@Override
	public List<Post> listPostByBoard(Search search) {
		return sqlSession.selectList("PostMapper.listPostByBoard",search);
	}

	@Override
	public int postTotalCount(Search search) {
		return sqlSession.selectOne("PostMapper.postTotalCount", search);
	}

	@Override
	public int searchTotalCount(Search search) {
		return sqlSession.selectOne("PostMapper.searchTotalCount", search);
	}
}
