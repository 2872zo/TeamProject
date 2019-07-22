package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;

public interface CafeMemberDao {

	/////////////////////////////////////// 예림 시작////////////////////////////////////////
	public CafeMember getCafeMember(int cafeNo, int userNo); // 예림예림
	///////////////////////////////// 예림 끝/////////////////////////////////////////////

/////////////////////////////////지니//////////////////////////////
	public void addCafeApplication(CafeApplication cafeApplication);// 카페가입신청

	public int updateCafeMember(CafeMember cafeMember);// 카페탈퇴

	public void addCafeMember(CafeMember cafeMember);// 가입승인
	
	public void updateCafeMemberProfile(CafeMember cafeMember);
	
	public int changeGradeNo(CafeMember cafeMember);
	
	public int updateMembersIncrease (int cafeNo);
	
	public int updateMembersDecrease (int cafeNo);
	
	public int lowGradeNo (int cafeNo);
	
	public CafeMember checkNickname(CafeMember cafeMember);
	

////////////////////////////////지니끝//////////////////////////////////

////////////////////////////기황 시작////////////////////////////////////
	
	public CafeMember getCafeMember(Search search) throws Exception;
	
	public int updatePostCountIncrease (int memberNo) throws Exception;
	
	public int updatePostCountDecrease (int memberNo) throws Exception;
	
	public int updateReplyCountIncrease (int memberNo) throws Exception;
	
	public int updateReplyCountDecrease (int memberNo) throws Exception;
	
	public int updateVisitCountIncrease (int memberNo) throws Exception;
	
	public int updateFavorite (CafeMember cafeMember) throws Exception;
	
	public CafeMember getCafeMemberByURL (CafeMember cafeMember) throws Exception;



////////////////////////////기황 끝////////////////////////////////////

}
