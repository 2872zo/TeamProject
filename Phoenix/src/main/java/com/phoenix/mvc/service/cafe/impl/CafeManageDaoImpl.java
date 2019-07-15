package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;

import oracle.net.aso.e;

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
	
	///////////////////////////////// 지니//////////////////////////////
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
		sqlSession.update("CafeApplicationMapper.updateAcceptStatusCode", cafeApplication);

	}

	@Override
	public CafeApplication getCafeApplication2(int applicationNo) {

		return sqlSession.selectOne("CafeApplicationMapper.getCafeApplication2", applicationNo);
	}

	@Override
	public List getCafeGrade(int cafeNo) {

		List GradeList = sqlSession.selectList("CafeGradeMapper.getCafeGrade", cafeNo);

		return GradeList;

	}

	@Override
	public void addCafeGrade(CafeGrade cafeGrade) {

		sqlSession.insert("CafeGradeMapper.addCafeGrade", cafeGrade);

	}

	@Override
	public void updateCafeGrade(CafeGrade cafeGrade) {

		sqlSession.update("CafeGradeMapper.updateCafeGrade", cafeGrade);

	}

	@Override
	public List checkCafeGrade(int cafeNo) {

		List checkList = sqlSession.selectList("CafeGradeMapper.checkCafeGrade", cafeNo);

		return checkList;
	}

	//////////////////////////////// 지니끝//////////////////////////////////

	///////////////////////////////////// 예림/////////////////////////////////////
	@Override
	public List getCafeBoard(int cafeNo) { // 카페번호

		List boardList = sqlSession.selectList("getBoardList", cafeNo);

		return boardList;

	}

	@Override
	public List getCafeBoard(Search search) { // mapper구현x

		List boardList = sqlSession.selectList("getBoardListBySearch", search);

		return boardList;
	}

	@Override
	public int getCafeNo(String cafeURL) {

		return sqlSession.selectOne("getCafeNo", cafeURL);

	}

	@Override
	public List getBoardPost(int boardNo) {
		// ...이거 공지 가져오기 근데 그럼 카페의 공지게시판의 boardno를 알아야함 (게시판코드,게시판No)

		List postList = sqlSession.selectList("getBoardPostList", boardNo);

		return postList;
	}

	@Override
	public boolean addEventLog(Event event) {// 예림예림 add되면(1) true return. 근데안되면 어짜피 error아닌가여(아직test x)

		int addOk = sqlSession.insert("addEventLog", event);

		if (addOk == 1) //
		{
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean checkCafeTodayVisitLog(Event event) { // 예림예림 오늘방문했는지 아닌지 판별 (아직 test x)

		Event visitEvent = sqlSession.selectOne("checkCafeTodayVisitLog", event); // 있으면 returnType event겠지ㅡ므ㅏ

		if (visitEvent == null) // 오늘 방문한적 없음
		{
			return false;
		} else {
			return true; // 오늘 방문함
		}

	}

	@Override
	public Map<String, String> getCafeStatistics(Event event) { // 예림예림 작업중

		List<Map<String, String>> result = sqlSession.selectList("getCafeStatistics", event);
		// System.out.println(statisticResult);
		Map<String, String> statisticResultMap = new HashMap<String, String>();

		for (int i = 0; i < result.size(); i++) {
			statisticResultMap.put(result.get(i).get("EVENT_TYPE"), String.valueOf(result.get(i).get("COUNTS")));
		}
		return statisticResultMap;
	}

	////////////////////////////////////////////////////////// 예림끝////////////////////////////////////

	/////////////////////////////// 준호시작///////////////////////////////////////
	@Override // 준호
	public void updateCafeInfo(Cafe cafe) throws Exception {
		sqlSession.update("CafeMapper.updateCafeInfo", cafe);
	}

	@Override // 준호
	public Cafe getCafeInfo(int cafeNo) throws Exception {
		return sqlSession.selectOne("CafeMapper.getCafeInfo", cafeNo);
	}

	@Override // 준호
	public void updateCafeApplicationForm(Cafe cafe) throws Exception {
		sqlSession.update("CafeMapper.updateCafeApplicationForm", cafe);
	}

	public Cafe getCafeName(String cafeName) throws Exception {
		return sqlSession.selectOne("CaferMapper.getCafeName", cafeName);
	}
	/////////////////////////////// 준호끝///////////////////////////////////////

	

}
