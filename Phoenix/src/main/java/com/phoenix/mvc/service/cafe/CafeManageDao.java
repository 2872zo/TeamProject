package com.phoenix.mvc.service.cafe;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageDao {
/////////////////////////////////기황시작//////////////////////////////	
	public List getCafeMemberList(Search search) throws Exception;

	public int getCafeMemberCount(Search search) throws Exception;

	public List getCafeGradesByURL(Search search) throws Exception;

	public CafeMember getCafeMember(Search search) throws Exception;

	public int addCafeMemberBlock(CafeMember cafeMember) throws Exception;

	public List getCafeMemberBlocks(Search search) throws Exception;

	public int updateCafeMemberBlock(CafeMemberBlock cafeMemberBlock) throws Exception;

	public int updateCafeMemeberGrade(CafeMember cafeMember) throws Exception;

/////////////////////////////////기황끝//////////////////////////////	
///////////////////////////////// 지니//////////////////////////////
	public List<CafeApplication> getCafeApplicationList(Search search);

	public int getTotalCount(Search search);

	public void updateAcceptStatusCode(CafeApplication cafeApplication);

	public CafeApplication getCafeApplication2(int applicationNo);

	public List getCafeGrade(int cafeNo);

	public void addCafeGrade(CafeGrade cafeGrade);

	public void updateCafeGrade(CafeGrade cafeGrade);

	public List checkCafeGrade(int cafeNo);

	public boolean dropCafe(Cafe cafe);
	
	public CafeGrade getNextGrade(int cafeGradeNo);

////////////////////////////////지니끝//////////////////////////////////

/////////////////////////////////// 예림시작//////////////////////////////////////////

	public List getCafeBoard(int cafeNo);

	public List getCafeBoardList(Search search);

	public int getCafeNo(String cafeURL);

	public List getBoardPost(int boardNo);

	public boolean addEventLog(Event event);// 예림예림 add되면 true return

	public boolean checkCafeTodayVisitLog(Event event); // 예림예림 return true- 오늘방문함 false -오늘첫방문

	public Map getCafeStatistics(Event event);

	public boolean addCafeBoard(List<Board> newBoardList);

	public boolean updateCafeBoard(List<Board> existBoardList);

	public boolean deleteCafeBoard(List<Board> deleteBoardList);

///////////////////////////////////////// 예림 끝////////////////////////////////////////////////

/////////////////////////////// 준호시작///////////////////////////////////////
	public void updateCafeInfo(Cafe cafe) throws Exception;

	public Cafe getCafeInfo(int cafeNo) throws Exception;
	
	public Cafe getCafeInfo(String cafeURL);

	public int getCafeNoNo(String cafeName) throws Exception;

	public void updateCafeApplicationForm(Cafe cafe) throws Exception;

	public Cafe getCafeName(String cafeName) throws Exception;

	public Cafe getCafeURL(String CafeURL) throws Exception;

/////////////////////////////// 준호끝///////////////////////////////////////
}
