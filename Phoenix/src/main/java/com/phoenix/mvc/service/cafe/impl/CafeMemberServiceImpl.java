package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;

@Service
public class CafeMemberServiceImpl implements CafeMemberService {
	
	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;
	
	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	
	public void setCafeMemberDao(CafeMemberDao cafeMemberDao) {
		this.cafeMemberDao = cafeMemberDao;
	}
	
	public CafeMemberServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	
	
	///////////////////////////////// 지니//////////////////////////////
	public int getCafeNo(String cafeURL) {

		return cafeManageDao.getCafeNo(cafeURL);

	}
	
	public CafeMember getCafeMember(int cafeNo, int userNo) {
		
		return cafeMemberDao.getCafeMember(cafeNo, userNo);
	
	}

	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {

		cafeMemberDao.addCafeApplication(cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {
		cafeMemberDao.updateCafeMember(cafeMember);
	}

	@Override
	public void addCafeMember(CafeMember cafeMember) {
		cafeMemberDao.addCafeMember(cafeMember);
	}

	@Override
	public void updateCafeMemberProfile(CafeMember cafeMember) {
		cafeMemberDao.updateCafeMemberProfile(cafeMember);
		
	}
////////////////////////////////////지니끝//////////////////////////////
/////////////////////////////////////기황 시작/////////////////////////////////////
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
	
	@Override
	public int addCafeMemberBlock(CafeMember cafeMember) throws Exception {
		// TODO Auto-generated method stub
		int blocked = cafeMemberDao.addCafeMemberBlock(cafeMember);
		cafeMember.setMemberStatusCode("cs101");
		cafeMemberDao.updateCafeMember(cafeMember);
		return blocked;
	}

	@Override
	public Map getCafeMemberBlocks(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		CafeMember member = cafeMemberDao.getCafeMember(search);
		List blocks = cafeMemberDao.getCafeMemberBlocks(search);
		map.put("member", member);
		map.put("blocks", blocks);
		return map;
	}

	@Override
	public int updateCafeMemberBlocks(CafeMemberBlock cafeMemberBlock) throws Exception {
		// TODO Auto-generated method stub
		return cafeMemberDao.updateCafeMemberBlocks(cafeMemberBlock);
	}
	
//////////////////////////////////기황끝///////////////////////////////////////




}
