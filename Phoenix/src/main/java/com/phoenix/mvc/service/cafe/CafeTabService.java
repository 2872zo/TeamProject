package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.User;


public interface CafeTabService {
	
	///////////////////////////////준호시작///////////////////////////////////////	
	public void addCafe(Cafe cafe)throws Exception;
	
	public boolean checkCafeNameDuplication(String cafeName) throws Exception;
	
	public boolean checkCafeURLDuplication(String URL) throws Exception;
	///////////////////////////////준호끝///////////////////////////////////////
	
	//////////////////////////////기황시작//////////////////////////////
	
	public Map getCafeHome(Search search) throws Exception;
	
	public Map searchCafe(Search search) throws Exception;
	
	public Map getCategorizedCafeList(Search search) throws Exception;

	public Map getCafeApplicationListForUser(Search search) throws Exception;
	
	public Map getNewsFeed(int userNo) throws Exception;
	
	public int updateFavorite(CafeMember cafeMember) throws Exception;
	
	//////////////////////////////기황끝//////////////////////////////
	
	////////////////////////////////////예림시작////////////////////////
	public Map getCafeMain(User user,String cafeURL);
	////////////////////////////////////예림끝/////////////////////////////	


}
