package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;

public interface CafeManageDao {

	public List getCafeBoard(int cafeNo);
	
	public int getCafeNo(String cafeURL);
	
	public List<CafeApplication> getCafeApplicationList(Search search);
	
	public int getTotalCount(Search search);
	
}
