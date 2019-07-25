package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;

public interface CafeMemberService {

	///////////////////////////////// 지니//////////////////////////////

	public int getCafeNo(String URL);

	public void addCafeApplication(CafeApplication cafeApplication) throws Exception;// 카페가입신청

	public boolean updateCafeMember(CafeMember cafeMember) throws Exception;// 카페탈퇴

	public void addCafeMember(CafeMember cafeMember);// 가입승인

	public void updateCafeMemberProfile(CafeMember cafeMember);

	public int changeGradeNo(CafeMember cafeMember);
	
	public boolean checkNickname(CafeMember cafeMember);

	//////////////////////////////// 지니끝//////////////////////////////////

	////////////////////////////// 기황시작//////////////////////////////////
	
	public CafeMember getCafeMember(Search search) throws Exception;

	public int updatePostCountIncrease(int memberNo) throws Exception;

	public int updatePostCountDecrease(int memberNo) throws Exception;

	public int updateReplyCountIncrease(int memberNo) throws Exception;

	public int updateReplyCountDecrease(int memberNo) throws Exception;

	public int updateVisitCountIncrease(int memberNo) throws Exception;
	
	public CafeMember getCafeMemberByURL(Search search) throws Exception;

	//////////////////////////// 기황끝///////////////////////////////


}
