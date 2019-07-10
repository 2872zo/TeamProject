package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;

@Service("cafeManageServiceImpl")
public class CafeManageServiceImpl implements CafeManageService {

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	

	public void setCafeManageDao(CafeManageDao cafeManageDao) {
		this.cafeManageDao = cafeManageDao;
	}

	public CafeManageServiceImpl() { //생성자
		
		System.out.println(this.getClass().getName());
	}

	@Override
	public List getCafeBoard(String cafeURL) {
		
		int cafeNo = cafeManageDao.getCafeNo(cafeURL);
	
		return cafeManageDao.getCafeBoard(cafeNo);
	}

	@Override
	public int checkCafePost(String cafeURL,int boardNo) {
		
		cafeManageDao.getCafeNo(cafeURL); // 꼭 받아야하나? 그냥 post table에서만 체크하면 된다 안해도댐
		
		List postList = cafeManageDao.getBoardPost(boardNo); //boardNo에 해당하는 post list를 가져옴
		
		if(postList.size()==0) // 해당하는 게시판에 게시글이 없음
		{
			return 0;
		}
		else //게시글 있음.
		{
			return 1;
		}
		
	}

}
