package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.Cafe;

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
	///////////////////////////////준호시작///////////////////////////////////////	
	@Override//준호
	public void updateCafeInfo(Cafe cafe) throws Exception {
		cafeManageDao.updateCafeInfo(cafe);
	}
	
	@Override//준호
	public void updateCafeApplicationForm(Cafe cafe) throws Exception {
		cafeManageDao.updateCafeApplicationForm(cafe);
	}
	
	@Override//준호
	public Cafe getCafeInfo(String cafeNo) throws Exception {
		return cafeManageDao.getCafeInfo(cafeNo);
	}
	///////////////////////////////준호끝///////////////////////////////////////	
	@Override
	public Map<String, Object> getCafeApplicationList(Search search) {
		
		List<CafeApplication> list = cafeManageDao.getCafeApplicationList(search);
		int totalCount = cafeManageDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public boolean checkCafePost(String cafeURL,int boardNo) { // false이면  게시글 없음,  true 이면 게시글 존재
		
		//cafeManageDao.getCafeNo(cafeURL); // 꼭 받아야하나? 그냥 post table에서만 체크하면 된다 안해도댐
		
		List postList = cafeManageDao.getBoardPost(boardNo); //boardNo에 해당하는 post list를 가져옴
		
		if(postList!=null)
		{
			System.out.println(postList.size());

			if(postList.size()==0) // 해당하는 게시판에 게시글이 없음
			{
				return false;
			}
			else //게시글 있음.
			{
				return true;
			}
		}
		else
		{
			return false;
		}
		
	}

}
