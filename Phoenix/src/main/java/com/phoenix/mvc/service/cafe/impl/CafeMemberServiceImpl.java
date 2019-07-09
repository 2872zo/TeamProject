package com.phoenix.mvc.service.cafe.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	
	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {
		cafeMemberDao.addCafeApplication(cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {
		cafeMemberDao.updateCafeMember(cafeMember);
		
	}

}
