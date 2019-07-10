package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageDao {

	public List getCafeBoard(int cafeNo);
	
	public List getCafeBoard(String cafeURL);
	
	public int getCafeNo(String cafeURL);
	
	public List getBoardPost(int boardNo);
	
	public List<CafeApplication> getCafeApplicationList(Search search);
	
	public int getTotalCount(Search search);
	
	public void updateCafeInfo(Cafe cafe) throws Exception ;
	
	public Cafe getCafeInfo(String cafeNo)throws Exception;
	
}
