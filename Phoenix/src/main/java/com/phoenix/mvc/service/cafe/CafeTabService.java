package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeTabService {
	
	public void addCafe(Cafe cafe)throws Exception;
	
	public List searchCafe(Search search)throws Exception;
}
