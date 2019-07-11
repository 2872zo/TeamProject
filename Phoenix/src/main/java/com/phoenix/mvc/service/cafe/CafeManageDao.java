package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageDao {
	
	/////////////////////////////////지니//////////////////////////////
	public List<CafeApplication> getCafeApplicationList(Search search);
	
	public CafeApplication getCafeApplication(int userNo);

	public int getTotalCount(Search search);
	
	public void updateAcceptStatusCode(CafeApplication cafeApplication);
	////////////////////////////////지니끝//////////////////////////////////

	public List getCafeBoard(int cafeNo);

	public List getCafeBoard(String cafeURL);

	public int getCafeNo(String cafeURL);

	public List getBoardPost(int boardNo);
	
	public void updateCafeInfo(Cafe cafe) throws Exception;

	public Cafe getCafeInfo(String cafeNo) throws Exception;

	
	
	

}
