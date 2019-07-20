package com.phoenix.mvc.service.chatting.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;

@Repository
public class ChattingDaoImpl implements ChattingDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ChattingDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List getMyChatRoomList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ChatRoomMapper.getMyRoomList", search);
	}

	@Override
	public Map getMyFriendsList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
