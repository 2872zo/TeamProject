package com.phoenix.mvc.service.cafe.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.domain.Cafe;

@Repository("cafeTabDaoImpl")
public class CafeTabDaoImpl implements CafeTabDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public CafeTabDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	public void addCafe(Cafe cafe) throws Exception {
		sqlSession.insert("CafeMapper.addCafe", cafe);
	}
	
	@Override
	public List searchCafe(Search search) throws Exception {
		// TODO Auto-generated method stub			
		return sqlSession.selectList("CafeTabMapper.searchCafe", search);
	}
	
	public int cafeTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CafeTabMapper.searchCafeTotalCount",search);
	}
	
	
	@Override
	public List seachPost(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PostMapper.searchCafePost", search);
	}
	
	public int postTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("PostMapper.searchPostTotalCount",search);
	}
	
}
