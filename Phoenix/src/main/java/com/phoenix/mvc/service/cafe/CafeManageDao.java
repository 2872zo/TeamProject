package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageDao {

///////////////////////////////// 지니//////////////////////////////
	public List<CafeApplication> getCafeApplicationList(Search search);

	public CafeApplication getCafeApplication(int userNo);

	public int getTotalCount(Search search);

	public void updateAcceptStatusCode(CafeApplication cafeApplication);

	public CafeApplication getCafeApplication2(int applicationNo);
////////////////////////////////지니끝//////////////////////////////////

/////////////////////////////////// 예림시작//////////////////////////////////////////

	public List getCafeBoard(int cafeNo);

	public List getCafeBoard(String cafeURL);

	public int getCafeNo(String cafeURL);

	public List getBoardPost(int boardNo);

	public boolean addEventLog(Event event);// 예림예림 add되면 true return

	public boolean checkCafeTodayVisitLog(Event event); // 예림예림 return true- 오늘방문함 false -오늘첫방문

	public List getCafeStatistics(Event event);

///////////////////////////////////////// 예림 끝////////////////////////////////////////////////

	/////////////////////////////// 준호시작///////////////////////////////////////
	public void updateCafeInfo(Cafe cafe) throws Exception;

	public Cafe getCafeInfo(String cafeNo) throws Exception;

	public void updateCafeApplicationForm(Cafe cafe) throws Exception;
	/////////////////////////////// 준호끝///////////////////////////////////////

}
