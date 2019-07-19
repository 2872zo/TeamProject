package com.phoenix.mvc.service.cafe.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeGrade;

@Repository("cafeTabDaoImpl")
public class CafeTabDaoImpl implements CafeTabDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CafeTabDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	/////////////////////////////// 준호시작///////////////////////////////////////
	public void addCafe(Cafe cafe) throws Exception {
		sqlSession.insert("CafeMapper.addCafe", cafe);
		
		System.out.println("여긴 디에이오임플 카페다아아아앙"+cafe);
	}
	
	public void addMemberGrade(CafeGrade cafeGrade) throws Exception{
		sqlSession.insert("CafeMapper.addMemberGrade", cafeGrade);
		
		System.out.println("카페등급들어갔니 ??"+cafeGrade);
	}
	
	public void addBoard(Board board) throws Exception{
		sqlSession.insert("CafeMapper.addBoard", board);
		
	}


	/////////////////////////////// 준호끝///////////////////////////////////////

	//////////////////////////////기황시작//////////////////////////////

	@Override
	public List getMyCafeList(Search search) throws Exception {
		return sqlSession.selectList("CafeTabMapper.cafeSortingByStatus", search);
	}
	
	@Override
	public List getMyOwnCafeList(Search search) throws Exception {
		return sqlSession.selectList("CafeTabMapper.ownCafe", search);
	}
		
	@Override
	public int myCafeListTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CafeTabMapper.myCafeListTotalCount", search);
	}

	@Override
	public int ownCafeTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CafeTabMapper.ownCafeTotalCount", search);
	}

	@Override
	public List getCategorizedCafeList(Search search) throws Exception {
		return sqlSession.selectList("CafeTabMapper.categorizedCafeList", search);
	}

	@Override
	public int countCategorizedCafe(Search search) throws Exception {
		return sqlSession.selectOne("CafeTabMapper.countCategorizedCafe", search);
	}
	
	@Override
	public List getCafeApplicationListForUser(int userNo) {
		return sqlSession.selectList("CafeApplicationMapper.getCafeApplication",userNo);
	}

	@Override
	public int countCafeApplicationListForUser(int userNo) {
		return sqlSession.selectOne("CafeApplicationMapper.countCafeApplicationForUser",userNo);
	}
	
	@Override
	public List searchCafe(Search search) throws Exception {
		return sqlSession.selectList("CafeTabMapper.searchCafe", search);
	}

	public int cafeTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CafeTabMapper.searchCafeTotalCount", search);
	}

	//////////////////////////////기황끝//////////////////////////////

}
