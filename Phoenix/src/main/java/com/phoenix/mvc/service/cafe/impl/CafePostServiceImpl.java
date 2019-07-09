package com.phoenix.mvc.service.cafe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Post;

@Service
public class CafePostServiceImpl implements CafePostService{
	@Autowired
	@Qualifier("cafePostDaoImpl")
	private CafePostDao cafePostDao;
	
	public CafePostServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List<Post> getBoard(Search search) {
		return cafePostDao.getBoard(search);
	}
}
