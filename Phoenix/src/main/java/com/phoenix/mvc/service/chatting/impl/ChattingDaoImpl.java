package com.phoenix.mvc.service.chatting.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatRoom;

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
	
	@Override
	public void addChat(Chat chat) throws Exception {
		mongoTemplate.insert(chat);	
	}
	
	public List getChatList(Chat chat) throws Exception {
		
		Query query = new Query();
		//정렬
		query.with(new Sort(Sort.Direction.ASC, "regDate"));
		//갯수제한
		query.limit(2);
		Criteria criteria = new Criteria();
		//검색조건
		criteria.where("chatProfileImg").is("abc");
		query.addCriteria(criteria);
		return mongoTemplate.find(query, Chat.class);
		
	}

	@Override
	public void addChatRoom(ChatRoom chatRoom) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteChatRoomFromList(ChatRoom chatRoom) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
}
