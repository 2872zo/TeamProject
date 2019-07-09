package com.phoenix.mvc.service.cafe;

import java.util.List;

public interface CafeManageDao {

	public List getCafeBoard(int cafeNo);
	
	public int getCafeNo(String cafeURL);
	
}
