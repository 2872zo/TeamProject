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
import com.phoenix.mvc.service.user.UserDao;

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

	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {

		cafeMemberDao.addCafeApplication(cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {// 탈퇴
		
		cafeMember.setMemberStatusCode("cs102");
		cafeMemberDao.updateCafeMember(cafeMember);
		cafeMemberDao.updateMembersDecrease(cafeMember.getCafeNo());
	}

	@Override
	public void addCafeMember(CafeMember cafeMember) {// 가입
		
		if(!cafeMember.isMemberNicknameFlag() && cafeMember.getMemberNickname()== null ) {
			///일단 userNickname값 세팅! userDao.getUser(cafeMember.getUserNo));
			
			String userNickname = "바보";
			cafeMember.setMemberNickname(userNickname);
			
		}

		int lowNo = cafeMemberDao.lowGradeNo(cafeMember.getCafeNo());
		cafeMember.setCafeMemberGradeNo(lowNo);
		cafeMemberDao.addCafeMember(cafeMember);
		cafeMemberDao.updateMembersIncrease(cafeMember.getCafeNo());
	}

	@Override
	public void updateCafeMemberProfile(CafeMember cafeMember) {
		cafeMemberDao.updateCafeMemberProfile(cafeMember);

	}

	@Override
	public int changeGradeNo(CafeMember cafeMember) {

		return cafeMemberDao.changeGradeNo(cafeMember);
	}

////////////////////////////////////지니끝//////////////////////////////
////////////////////////////////////기황시작////////////////////////////
	@Override
	public Map getCafeMemberList(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();

		int totalCount = cafeMemberDao.getCafeMemberCount(search);
		List memberList = cafeMemberDao.getCafeMemberList(search);
		List gradeList = cafeManageDao.getCafeGrade(search.getCafeNo());

		map.put("memberList", memberList);
		map.put("totalCount", new Integer(totalCount));
		map.put("gradeList", gradeList);

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
		List cafeGrades = cafeManageDao.getCafeGrade(search.getCafeNo());

		map.put("member", member);
		map.put("blocks", blocks);
		map.put("cafeGrades", cafeGrades);

		return map;
	}

	@Override
	public int updateCafeMemberBlock(CafeMemberBlock cafeMemberBlock) throws Exception {

		int updateCheck = cafeMemberDao.updateCafeMemberBlock(cafeMemberBlock);

		CafeMember cafeMember = new CafeMember();
		cafeMember.setMemberNo(cafeMemberBlock.getMemberNo());
		cafeMember.setMemberStatusCode("cs100");
		cafeMemberDao.updateCafeMember(cafeMember);

		return updateCheck;
	}

	@Override
	public int updateCafeMemeberGrade(CafeMember cafeMember) throws Exception {
		return cafeMemberDao.updateCafeMemeberGrade(cafeMember);
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

	////////////////////////////////// 기황끝///////////////////////////////////////

}
