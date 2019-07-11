package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

@Service
public class CafeMemberServiceImpl implements CafeMemberService {
	
	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;
	
	public void setCafeMemberDao(CafeMemberDao cafeMemberDao) {
		this.cafeMemberDao = cafeMemberDao;
	}
	
	public CafeMemberServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	/////////////////////////////////지니//////////////////////////////
	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {
		cafeMemberDao.addCafeApplication(cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {
		cafeMemberDao.updateCafeMember(cafeMember);	
	}
	
/////////////////////////////////////기황 /////////////////////////////////////
	@Override
	public Map getCafeMemberList(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		int totalCount = cafeMemberDao.getCafeMemberCount(search);
		List memberList = cafeMemberDao.getCafeMemberList(search);
		map.put("memberList", memberList);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	
	@Override
	public CafeMember getCafeMember(Search search) throws Exception {
		// TODO Auto-generated method stub
		return cafeMemberDao.getCafeMember(search);
	}
//////////////////////////////////기황끝///////////////////////////////////////
}
