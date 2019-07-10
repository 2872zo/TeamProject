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
	@Override
	public void updateCafeInfo(Cafe cafe) throws Exception {
		cafeManageDao.updateCafeInfo(cafe);
	}
	
	@Override
	public Cafe getCafeInfo(String cafeNo) throws Exception {
		return cafeManageDao.getCafeInfo(cafeNo);
	}
	
	@Override
	public Map<String, Object> getCafeApplicationList(Search search) {
		
		List<CafeApplication> list = cafeManageDao.getCafeApplicationList(search);
		int totalCount = cafeManageDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
