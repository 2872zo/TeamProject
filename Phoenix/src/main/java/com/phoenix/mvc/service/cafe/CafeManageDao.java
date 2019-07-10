package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageDao {

	public List getCafeBoard(int cafeNo);
	
	public int getCafeNo(String cafeURL);
	
	public void updateCafeInfo(Cafe cafe) throws Exception ;
	
	public Cafe getCafeInfo(String cafeNo)throws Exception;
	
}
