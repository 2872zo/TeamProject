package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

@Repository("cafeMemberDaoImpl")
public class CafeMemberDaoImpl implements CafeMemberDao {

	@Autowired
	private SqlSession sqlSession;

	public CafeMemberDaoImpl(SqlSession sqlSession) {
		System.out.println(this.getClass());
		this.sqlSession = sqlSession;
	}

/////////////////////////////////지니 시작//////////////////////////////
	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {
		sqlSession.insert("CafeApplicationMapper.addCafeApplication", cafeApplication);
	}

	@Override
	public void updateCafeMember(CafeMember cafeMember) {
		sqlSession.update("CafeMemberMapper.updateCafeMember", cafeMember);

	}
////////////////////////////////지니끝//////////////////////////////////

	////////////////////////////////////////////////// 예림 시작///////////////////////////////////
	@Override // 예림예림
	public CafeMember getCafeMember(int cafeNo, int userNo) {

		HashMap map = new HashMap();
		map.put("cafeNo", cafeNo);
		map.put("userNo", userNo);

		CafeMember cafeMember = new CafeMember();

		cafeMember = sqlSession.selectOne("getCafeMember", map);

		if (cafeMember.getUserNo() == null) // 유저가 해당하는 카페 멤버가아닌경우(db값이 없으면)
		{
			cafeMember.setUserNo("500"); // cafe
		}

		return cafeMember;
	}
	/////////////////////////////////////////예림 끝///////////////////////////////////////////////

////////////////////////////////////기황 시작///////////////////////////////////////
	@Override
	public List getCafeMemberList(Search search) throws Exception {
// TODO Auto-generated method stub
		return sqlSession.selectList("CafeMemberMapper.listCafeMemeber", search);
	}

	@Override
	public int getCafeMemberCount(Search search) throws Exception {
// TODO Auto-generated method stub
		return sqlSession.selectOne("CafeMemberMapper.getMemberCount", search);
	}

	@Override
	public CafeMember getCafeMember(Search search) throws Exception {
// TODO Auto-generated method stub
		return sqlSession.selectOne("CafeMemberMapper.getCafeMemeber", search);
	}
//////////////////////////////기황 끝///////////////////////////////////////	

}
