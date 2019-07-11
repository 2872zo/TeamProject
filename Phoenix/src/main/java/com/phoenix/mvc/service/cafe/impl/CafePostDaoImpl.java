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
	public List<Post> getPostListBySearch(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListBySearch", search);
	}
	
	@Override
	public List<Post> getPostListByBoard(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListByBoard",search);
	}

	@Override
	public int postTotalCount(Search search) {
		return sqlSession.selectOne("CafePostMapper.postTotalCount", search);
	}

	@Override
	public int searchTotalCount(Search search) {
		return sqlSession.selectOne("CafePostMapper.searchTotalCount", search);
	}

	@Override
	public List<Post> getPostListByNotice(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListByNotice", search);
	}

	@Override
	public boolean addPost(Post post) {
		return (sqlSession.insert("CafePostMapper.addPost", post) == 1? true : false);
	}

	@Override
	public Post getPost(int postNo) {
		return sqlSession.selectOne("CafePostMapper.getPost", postNo);
	}

	@Override
	public boolean updatePost(Post post) {
		return (sqlSession.insert("CafePostMapper.updatePost", post) == 1? true : false);
	}

	@Override
	public boolean deletePost(int postNo) {
		return (sqlSession.insert("CafePostMapper.deletePost", postNo) == 1? true : false);
	}
}
