package com.phoenix.mvc.service.cafe;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageService {

/////////////////////////////////지니//////////////////////////////
public Map<String, Object> getCafeApplicationList(Search search);

public void updateAcceptStatusCode(CafeApplication cafeApplication);

public CafeApplication getCafeApplication2(int applicationNo);

public List getCafeGrade(int cafeNo);

public void addCafeGrade(CafeGrade cafeGrade);

public void updateCafeGrade(CafeGrade cafeGrade);

public List checkCafeGrade(int cafeNo);

public boolean dropCafe(Cafe cafe, String cafeURL);

////////////////////////////////지니끝//////////////////////////////////

/////////////////////////////////////예림시작/////////////////////////////////////////
	public List getCafeBoard(Search search);

	public boolean checkCafePost(String cafeURL, int boardNo); // 아니면 null이면?? 으로할까 일단 조원들상의 void도 int return

	public Map getCafeStatistics(Event event, String cafeURL);

	public boolean addCafeBoard(List<Board> newBoard);

	public boolean updateCafeBoard(List<Board> existBoard);
	
	public List getCafeGrade(String cafeURL);
	
	public Cafe getCafeInfo(String cafeURL) throws Exception;
	
	public List getCafeMemberAutocomplete(String cafeURL) throws Exception;
/////////////////////////////예림끝///////////////////////////////////////////

///////////////////////////////준호시작///////////////////////////////////////
	public void updateCafeInfo(Cafe cafe) throws Exception;

	public Cafe getCafeInfo(int cafeNo) throws Exception;

	public void updateCafeApplicationForm(Cafe cafe) throws Exception;

	public Cafe getCafeName(String cafeName) throws Exception;
	/////////////////////////////// 준호끝///////////////////////////////////////
}
