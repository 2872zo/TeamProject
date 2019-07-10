package com.phoenix.mvc.service.cafe.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;


@Service("cafeTabServiceImpl")
public class CafeTabServiceImpl implements CafeTabService{
	
	@Autowired
	@Qualifier("cafeTabDaoImpl")	
	private CafeTabDao cafeTabDao;
	
	public void setCafeDao(CafeTabDao cafeDao) {
	this.cafeTabDao= cafeDao;
	}
	
	public CafeTabServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@Override
	public void addCafe(Cafe cafe) throws Exception {
		cafeTabDao.addCafe(cafe);
	}

	@Override
	public Map searchCafe(Search search) throws Exception {
		// TODO Auto-generated method stub
		int totalCount;
		Map map = new HashMap();
		List cafeList = new ArrayList();
		List postList = new ArrayList();
		if (search.getSearchCondition().equals("0")) {
			cafeList = cafeTabDao.searchCafe(search);
			postList = cafeTabDao.seachPost(search);
			map.put("cafeList", cafeList);
			map.put("postList", postList);
			map.put("totalCount", new Integer(10));
		}
		if (search.getSearchCondition().equals("1")) {
			cafeList = cafeTabDao.searchCafe(search);
			totalCount = cafeTabDao.cafeTotalCount(search);
			map.put("cafeList", cafeList);
			map.put("totalCount", new Integer(totalCount));
		}
		if (search.getSearchCondition().equals("2")) {
			postList = cafeTabDao.seachPost(search);
			totalCount = cafeTabDao.postTotalCount(search);
			map.put("postList", postList);
			map.put("totalCount", new Integer(totalCount));
		}
		
		return map;
	}
}
