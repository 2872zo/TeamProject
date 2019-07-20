package com.phoenix.mvc.service.chatting.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.domain.Chat;

@Repository
public class ChattingDaoImpl implements ChattingDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
		
	@Autowired
	@Qualifier("mongoTemplate")
	private MongoTemplate mongoTemplate;
	
	public ChattingDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List getMyChatRoomList(Search search) throws Exception {
		return sqlSession.selectList("ChatRoomMapper.getMyRoomList", search);
	}

	@Override
	public List getMyFriendsList(Search search) throws Exception {
		return sqlSession.selectList("ChatFriendMapper.getMyFriendList", search);
	}

	@Override
	public void testMethod(Chat chat) throws Exception {
		mongoTemplate.insert(chat);		
	}
}
