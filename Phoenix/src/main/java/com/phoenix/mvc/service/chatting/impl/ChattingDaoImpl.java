package com.phoenix.mvc.service.chatting.impl;

import java.util.List;

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
import com.phoenix.mvc.service.domain.ChatFriend;
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
	public List getFriendSearchList(Search search) throws Exception {
		return sqlSession.selectList("ChatFriendMapper.searchChatFriend", search);
	}
	@Override
	public void testMethod(Chat chat) throws Exception {
		mongoTemplate.insert(chat);	
	}
	
	@Override
	public void addChat(Chat chat) throws Exception {
		mongoTemplate.insert(chat);	
	}
	
	public List getChatList(Search search) throws Exception {
		
		Query query = new Query();
		//정렬
		query.with(new Sort(Sort.Direction.ASC, "regDate"));
		//갯수제한
		//query.limit(2);
		Criteria criteria = new Criteria();
		//검색조건
		//criteria.where("chatRoomNo").is(10007);
		//query.addCriteria(criteria);
		//criteria.andOperator(Criteria.where("chatProfileImg").is("abc"), Criteria.where("chatRoomNo").is(search.getChatRoomNo()));
		criteria.andOperator(Criteria.where("chatRoomNo").is(search.getChatRoomNo()));
		query.addCriteria(criteria);
		return mongoTemplate.find(query, Chat.class);
		
	}
	


	@Override
	public void addChatRoom(ChatRoom chatRoom) throws Exception {
		mongoTemplate.insert(chatRoom);
	}

	@Override
	public void deleteChatRoomFromList(ChatRoom chatRoom) throws Exception {
		
	}

	@Override
	public int getMyChatRoomCount(Search search) throws Exception {
		return 0;
	}

	@Override
	public ChatFriend getFriend(ChatFriend chatFriend) throws Exception {
		return null;
	}

	@Override
	public int addFriend(ChatFriend chatFriend) throws Exception {
		return sqlSession.insert("ChatFriendMapper.addFriend",chatFriend);
	}

	@Override
	public int updateFriend(ChatFriend chatFriend) throws Exception {
		return sqlSession.update("ChatFriendMapper.updateFriend", chatFriend);
	}

	@Override
	public int deleteFriend(ChatFriend chatFriend) throws Exception {
		return sqlSession.delete("ChatFriendMapper.deleteFriend", chatFriend);
	}

	@Override
	public int getMyChatCount(Search search) throws Exception {
		return 0;
	}

	@Override
	public List getChatRoomUserList(Search search) throws Exception {
		return null;
	}

	@Override
	public List getWannaBeFriendList(Search search) throws Exception {
		return sqlSession.selectList("ChatFriendMapper.getWannaBeFriendList", search);
	}

	
	
}
