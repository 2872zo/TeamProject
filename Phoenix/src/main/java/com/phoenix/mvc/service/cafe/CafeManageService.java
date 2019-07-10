package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.service.domain.Cafe;

public interface CafeManageService {

	public List getCafeBoard(String cafeURL);
	
	public void updateCafeInfo(Cafe cafe) throws Exception ;
	
	public Cafe getCafeInfo(String cafeNo)throws Exception;
	
}
