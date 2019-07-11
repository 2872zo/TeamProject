package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;


public interface CafeTabService {
	///////////////////////////////준호시작///////////////////////////////////////	
	public void addCafe(Cafe cafe)throws Exception;
	///////////////////////////////준호끝///////////////////////////////////////	
	public Map searchCafe(Search search)throws Exception;
	
	public Map getCategorizedCafeList(Search search)throws Exception;
	
	////////////////////////////////////예림//////////////////////////////////
	public Map getCafeMain(User user,String cafeURL);
	/////////////////////////////////////////끝/////////////////////////////////////
	
}
