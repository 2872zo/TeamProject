package com.phoenix.mvc.service.cafe;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageService {

	public List getCafeBoard(String cafeURL);
	
	public Map<String, Object> getCafeApplicationList(Search search);
	
	public void updateCafeInfo(Cafe cafe) throws Exception ;
	
	public Cafe getCafeInfo(String cafeNo)throws Exception;
	
}
