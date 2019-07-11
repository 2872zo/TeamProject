package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

public interface CafeMemberDao {
	//카페가입신청
	public void addCafeApplication(CafeApplication cafeApplication);
	
	//카페탈퇴
	public void updateCafeMember(CafeMember cafeMember);

	public CafeMember getCafeMember(int cafeNo,int userNo);  //예림예림
	
	////////////////////////////기황////////////////////////////////////
	public List getCafeMemberList(Search search) throws Exception;
	
	public int getCafeMemberCount(Search search) throws Exception;
	
	public CafeMember getCafeMember(Search search) throws Exception;
	////////////////////////////끝////////////////////////////////////

}
