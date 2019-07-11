package com.phoenix.mvc.service.cafe;

import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

public interface CafeMemberService {
	
	/////////////////////////////////지니//////////////////////////////
	//카페가입신청
	public void addCafeApplication(CafeApplication cafeApplication);
	
	//카페탈퇴
	public void updateCafeMember(CafeMember cafeMember);
	////////////////////////////////지니끝//////////////////////////////////

}
