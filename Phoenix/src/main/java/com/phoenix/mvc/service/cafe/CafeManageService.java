package com.phoenix.mvc.service.cafe;

import java.util.List;

public interface CafeManageService {

	public List getCafeBoard(String cafeURL);
	
	public int checkCafePost(String cafeURL,int boardNo); //아니면 null이면?? 으로할까 일단 조원들상의 void도 int return
}
