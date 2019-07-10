package com.phoenix.mvc.service.cafe;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;


public interface CafeTabDao {

	public void addCafe(Cafe cafe)throws Exception;
	
	public List searchCafe(Search search)throws Exception;
	
	public int cafeTotalCount(Search search) throws Exception;
	
	public List seachPost(Search search)throws Exception;
	
	public int postTotalCount(Search search) throws Exception;
	
}
