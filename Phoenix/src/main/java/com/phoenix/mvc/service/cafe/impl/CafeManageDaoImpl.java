package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

@Repository("cafeManageDaoImpl")
public class CafeManageDaoImpl implements CafeManageDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CafeManageDaoImpl() {
		
		System.out.println(this.getClass().getName());
	}

	@Override
	public List getCafeBoard(int cafeNo) { //카페번호
		
		List boardList = sqlSession.selectList("getBoardList", cafeNo);
		
		return boardList;
		
	}
	
	@Override
	public List getCafeBoard(String cafeURL) { //mapper구현x
	
		List boardList = sqlSession.selectList("getBoardListByURL", cafeURL);
		
		return boardList;
	}

	@Override
	public int getCafeNo(String cafeURL) {
		
		return sqlSession.selectOne("getCafeNo", cafeURL);
		
	}
	///////////////////////////////준호시작///////////////////////////////////////	
	@Override//준호
	public void updateCafeInfo(Cafe cafe)throws Exception{
		sqlSession.update("CafeMapper.updateCafeInfo", cafe);
	}
	
	@Override//준호
	public Cafe getCafeInfo(String cafeNo) throws Exception {
		return sqlSession.selectOne("CafeMapper.getCafeInfo", cafeNo);
	}
	
	@Override//준호
	public void updateCafeApplicationForm(Cafe cafe)throws Exception{
		sqlSession.update("CafeMapper.updateCafeApplicationForm", cafe);
	}
	///////////////////////////////준호끝///////////////////////////////////////	
	@Override
	public List<CafeApplication> getCafeApplicationList(Search search) {
		
		return sqlSession.selectList("CafeApplicationMapper.getCafeApplicationList", search);
	}

	@Override
	public int getTotalCount(Search search) {
		
		return sqlSession.selectOne("CafeApplicationMapper.getTotalCount", search);
	}

	@Override
	public List getBoardPost(int boardNo) { 
		//...이거 공지 가져오기 근데 그럼 카페의 공지게시판의 boardno를 알아야함 (게시판코드,게시판No)
		
		List postList = sqlSession.selectList("getBoardPostList", boardNo);
		
		return postList;
	}

	

}
