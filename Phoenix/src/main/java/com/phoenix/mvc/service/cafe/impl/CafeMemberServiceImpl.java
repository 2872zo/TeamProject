package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;

@Service
public class CafeMemberServiceImpl implements CafeMemberService {

	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

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

	@Override
	public void addCafeApplication(CafeApplication cafeApplication) throws Exception {

		if (cafeApplication.getMemberNickname() == null) {

			User user = userDao.getUserInfo(cafeApplication.getUserNo());
			cafeApplication.setMemberNickname(user.getUserNickname());

		}

		cafeMemberDao.addCafeApplication(cafeApplication);

		Event event = new Event();
		event.setCafeNo(cafeApplication.getCafeNo());
		event.setEventUserNo(cafeApplication.getUserNo());
		event.setEventType("et105");// 가입신청코드
		cafeManageDao.addEventLog(event);
	}

	@Override
	public boolean updateCafeMember(CafeMember cafeMember) {// 탈퇴

		boolean result = false;

		cafeMember.setMemberStatusCode("cs102");
		cafeMemberDao.updateCafeMember(cafeMember);
		cafeMemberDao.updateMembersDecrease(cafeMember.getCafeNo());

		Event event = new Event();
		event.setCafeNo(cafeMember.getCafeNo());
		event.setEventUserNo(cafeMember.getUserNo());
		event.setEventType("et107");// 탈퇴코드
		cafeManageDao.addEventLog(event);

		CafeMember member = cafeMemberDao.getCafeMember(cafeMember.getCafeNo(), cafeMember.getUserNo());

		if (member.getMemberStatusCode().equals("cs102")) {
			result = true;
		}
		return result;

	}

	@Override
	public void addCafeMember(CafeMember cafeMember) {// 가입

		if (!cafeMember.isMemberNicknameFlag() && cafeMember.getMemberNickname() == null) {
			/// 일단 userNickname값 세팅! userDao.getUser(cafeMember.getUserNo));

			String userNickname = "바보";
			cafeMember.setMemberNickname(userNickname);

		}

		int lowNo = cafeMemberDao.lowGradeNo(cafeMember.getCafeNo());
		cafeMember.setCafeMemberGradeNo(lowNo);
		cafeMemberDao.addCafeMember(cafeMember);
		cafeMemberDao.updateMembersIncrease(cafeMember.getCafeNo());

		Event event = new Event();
		event.setCafeNo(cafeMember.getCafeNo());
		event.setEventUserNo(cafeMember.getUserNo());
		event.setEventType("et106");// 카페가입
		cafeManageDao.addEventLog(event);
	}

	@Override
	public void updateCafeMemberProfile(CafeMember cafeMember) {
		cafeMemberDao.updateCafeMemberProfile(cafeMember);

	}

	@Override
	public int changeGradeNo(CafeMember cafeMember) {

		return cafeMemberDao.changeGradeNo(cafeMember);
	}

	@Override
	public boolean checkNickname(CafeMember cafeMember) {

		boolean result = true;

		CafeMember cafeMember2 = cafeMemberDao.checkNickname(cafeMember);
		if (cafeMember2 != null) {
			result = false;
		}
		return result;
	}

////////////////////////////////////지니끝//////////////////////////////
////////////////////////////////////기황시작////////////////////////////

	@Override
	public CafeMember getCafeMember(Search search) throws Exception {
		// TODO Auto-generated method stub
		return cafeManageDao.getCafeMember(search);
	}

	@Override
	public int updatePostCountIncrease(int memberNo) throws Exception {
		return cafeMemberDao.updatePostCountIncrease(memberNo);
	}

	@Override
	public int updatePostCountDecrease(int memberNo) throws Exception {
		return cafeMemberDao.updatePostCountDecrease(memberNo);
	}

	@Override
	public int updateReplyCountIncrease(int memberNo) throws Exception {
		return cafeMemberDao.updateReplyCountIncrease(memberNo);
	}

	@Override
	public int updateReplyCountDecrease(int memberNo) throws Exception {
		return cafeMemberDao.updateReplyCountDecrease(memberNo);
	}

	@Override
	public int updateVisitCountIncrease(int memberNo) throws Exception {
		return cafeMemberDao.updateVisitCountIncrease(memberNo);
	}

	@Override
	public CafeMember getCafeMemberByURL(Search search) throws Exception {
		return cafeMemberDao.getCafeMemberByURL(search);
	}

	////////////////////////////////// 기황끝///////////////////////////////////////

}
