package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

public interface CafeMemberService {
	
	/////////////////////////////////지니//////////////////////////////
	public int getCafeNo(String URL);

	public void addCafeApplication(CafeApplication cafeApplication);//카페가입신청

	public void updateCafeMember(CafeMember cafeMember);//카페탈퇴
	
	public void addCafeMember(CafeMember cafeMember);//가입승인
	////////////////////////////////지니끝//////////////////////////////////
	
	////////////////////////////기황////////////////////////////////////

	public Map getCafeMemberList(Search search) throws Exception;
	
	public CafeMember getCafeMember(Search search) throws Exception;
	////////////////////////////끝////////////////////////////////////


}
