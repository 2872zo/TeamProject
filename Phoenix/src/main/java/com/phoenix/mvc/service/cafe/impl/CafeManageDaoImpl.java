package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Event;
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


	/////////////////////////////////지니//////////////////////////////
	@Override
	public List<CafeApplication> getCafeApplicationList(Search search) {
		
		return sqlSession.selectList("CafeApplicationMapper.getCafeApplicationList", search);
	}

	@Override
	public int getTotalCount(Search search) {
		
		return sqlSession.selectOne("CafeApplicationMapper.getTotalCount", search);
	}
	
	@Override
	public void updateAcceptStatusCode(CafeApplication cafeApplication) {
		sqlSession.update("CafeApplicationMapper.updateCafeApplication", cafeApplication);
		
	}

	@Override
	public CafeApplication getCafeApplication(int userNo) {
		
		return sqlSession.selectOne("CafeApplicationMapper.getCafeApplication",userNo);
	}
	
	////////////////////////////////지니끝//////////////////////////////////

	
	
	/////////////////////////////////////예림/////////////////////////////////////
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
	
	@Override
	public List getBoardPost(int boardNo) { 
		//...이거 공지 가져오기 근데 그럼 카페의 공지게시판의 boardno를 알아야함 (게시판코드,게시판No)
		
		List postList = sqlSession.selectList("getBoardPostList", boardNo);
		
		return postList;
	}

	@Override
	public boolean addEventLog(Event event) {//예림예림  add되면(1) true return. 근데안되면 어짜피 error아닌가여(아직test x)
		
		int addOk = sqlSession.insert("addEventLog",event);
		
		if(addOk==1) //
		{
			return true;
		}
		else
		{
			return false;
		}

	}

	@Override
	public boolean checkCafeTodayVisitLog(Event event) { //예림예림 오늘방문했는지 아닌지 판별 (아직 test x)
		
		Event visitEvent  = sqlSession.selectOne("checkCafeTodayVisitLog", event); //있으면 returnType event겠지ㅡ므ㅏ
		
		if(visitEvent == null) //오늘 방문한적 없음
		{
			return false;
		}
		else
		{
			return true;  //오늘 방문함
		}
		
	}

	@Override
	public List getCafeStatistics(Event event) { //예림예림 작업중
		
		//sqlSession.select
		return null;
	}
	
	//////////////////////////////////////////////////////////예림끝////////////////////////////////////
	
	///////////////////////////////준호시작///////////////////////////////////////	
	@Override//준호
	public void updateCafeInfo(Cafe cafe)throws Exception{
		sqlSession.update("CafeMapper.updateCafeInfo", cafe);
	}
	
	@Override//준호
	public Cafe getCafeInfo(int cafeNo) throws Exception {
		return sqlSession.selectOne("CafeMapper.getCafeInfo", cafeNo);
	}
	
	@Override//준호
	public void updateCafeApplicationForm(Cafe cafe)throws Exception{
		sqlSession.update("CafeMapper.updateCafeApplicationForm", cafe);
	}
	///////////////////////////////준호끝///////////////////////////////////////	

}
