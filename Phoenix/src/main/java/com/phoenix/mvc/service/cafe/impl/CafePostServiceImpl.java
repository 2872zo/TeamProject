package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.cafe.CafePostService;

@Service
public class CafePostServiceImpl implements CafePostService {
	@Autowired
	@Qualifier("cafePostDaoImpl")
	private CafePostDao cafePostDao;

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDaoImpl cafeManageDaoImpl;

	public CafePostServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map<String, Object> listPostBySearch(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();

//		map.put("boardList", cafeManageDaoImpl.getBoardList(search.getCafeURL()) );
		map.put("postList", cafePostDao.listPostBySearch(search));
		map.put("postTotalCount", cafePostDao.searchTotalCount(search));

		return map;
	}

	@Override
	public Map<String, Object> listPostByBoard(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("postList", cafePostDao.listPostByBoard(search));
		map.put("postTotalCount", cafePostDao.postTotalCount(search));

		return map;
	}
}
