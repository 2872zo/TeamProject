package com.phoenix.mvc.service.cafe;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageService {

/////////////////////////////////지니//////////////////////////////
	public Map<String, Object> getCafeApplicationList(Search search);

	public void updateAcceptStatusCode(CafeApplication cafeApplication);

	public CafeApplication getCafeApplication(int userNo);

	public CafeApplication getCafeApplication2(int applicationNo);
////////////////////////////////지니끝//////////////////////////////////

/////////////////////////////////////예림시작/////////////////////////////////////////
	public List getCafeBoard(String cafeURL);

	public boolean checkCafePost(String cafeURL, int boardNo); // 아니면 null이면?? 으로할까 일단 조원들상의 void도 int return

	public List getCafeStatistics(Event event, String cafeURL);
/////////////////////////////예림끝///////////////////////////////////////////

///////////////////////////////준호시작///////////////////////////////////////
	public void updateCafeInfo(Cafe cafe) throws Exception;

	public Cafe getCafeInfo(int cafeNo) throws Exception;

	public void updateCafeApplicationForm(Cafe cafe) throws Exception;
	/////////////////////////////// 준호끝///////////////////////////////////////
}
