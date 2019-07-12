package com.phoenix.mvc.service.cafe.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.User;


@Service("cafeTabServiceImpl")
public class CafeTabServiceImpl implements CafeTabService{
	
	@Autowired
	@Qualifier("cafeTabDaoImpl")	
	private CafeTabDao cafeTabDao;
	
	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	
	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;

	@Autowired
	@Qualifier("cafePostDaoImpl")
	private CafePostDao cafePostDao;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostServiceImpl;
	
	public void setCafeDao(CafeTabDao cafeDao) {
	this.cafeTabDao= cafeDao;
	}
	
	public void setCafeManageDao (CafeManageDao cafeManageDao)
	{
		this.cafeManageDao = cafeManageDao;
	}
	
	public void setCafeMemberDao(CafeMemberDao cafeMemberDao)
	{
		this.cafeMemberDao = cafeMemberDao;
	}

	public void setCafePostDao(CafePostDao cafePostDao) {
		this.cafePostDao = cafePostDao;
	}

	public CafeTabServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	///////////////////////////////준호시작///////////////////////////////////////		
	@Override
	public void addCafe(Cafe cafe) throws Exception {
		cafeTabDao.addCafe(cafe);
	}
	
	public boolean checkCafeNameDuplication(String cafeName) throws Exception {
		
		boolean JSONData=true;
		
		Cafe cafe = cafeManageDao.getCafeName(cafeName);			
		
		if(cafe != null) {
			JSONData=false;
		}
		return JSONData;
	}
	
	///////////////////////////////준호끝///////////////////////////////////////	


	List boardList = cafeManageDao.getCafeBoard(cafeNo);
	map.put("boardList", boardList);

	return map;
}

/////////////////////////////////////////////// 예림
/////////////////////////////////////////////// 끝/////////////////////////////////////

//////////////////////////////기황시작//////////////////////////////////////

@Override
public Map searchCafe(Search search) throws Exception {
//TODO Auto-generated method stub
	int totalCount;
	Map map = new HashMap();
	List cafeList = new ArrayList();
	List postList = new ArrayList();
	if (search.getSearchCondition().equals("0")) {
		cafeList = cafeTabDao.searchCafe(search);
		Map postMap = cafePostServiceImpl.getPostListBySearch(search);
		postList = (List) postMap.get("postList");
//totalCount = (int) postMap.get("postTotalCount");
//postList = cafeTabDao.seachPost(search);
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
		Map postMap = cafePostServiceImpl.getPostListBySearch(search);
		postList = (List) postMap.get("postList");
		totalCount = (int) postMap.get("postTotalCount");
		map.put("postList", postList);
		map.put("totalCount", new Integer(totalCount));
	}

	return map;
}

@Override
public Map getCategorizedCafeList(Search search) throws Exception {
//TODO Auto-generated method stub
	Map map = new HashMap();
	int totalCount = cafeTabDao.countCategorizedCafe(search);
	List cafeList = cafeTabDao.getCategorizedCafeList(search);
	map.put("cafeList", cafeList);
	map.put("totalCount", new Integer(totalCount));
	return map;
}
//////////////////////////////기황끝/////////////////////////////////////

}
