package com.phoenix.mvc.service.chatting.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;
import com.phoenix.mvc.service.domain.ChatRoomInfo;

@Repository
public class ChattingDaoImpl implements ChattingDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
		
	@Autowired
	@Qualifier("mongoTemplate")
	private MongoTemplate mongoTemplate;
	
	private Query query;
	private Criteria criteria;
	private Update update;
	
	
	public ChattingDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List getMyChatRoomList(Search search) throws Exception {
		//query = mongoMapper.getMyChatRoomList(search);
		//정렬
		
		query = new Query();
		criteria = new Criteria();
		query.with(new Sort(Sort.Direction.DESC, "latestMessagingDate"));
		criteria.andOperator(Criteria.where("userNo").is(search.getUserNo()));
		query.addCriteria(criteria);
		
		
		System.out.println(query);
		return mongoTemplate.find(query, ChatRoomInfo.class);
	}
	
	@Override
	public ChatRoomInfo getMyChatRoomInfo(Search search) throws Exception {
		query = new Query();
		criteria = new Criteria();
		//query.with(new Sort(Sort.Direction.DESC, "latestMessagingDate"));
		criteria.andOperator(Criteria.where("userNo").is(search.getUserNo()), Criteria.where("chatRoomId").is(search.getChatRoomId()));
		query.addCriteria(criteria);
		return mongoTemplate.findOne(query, ChatRoomInfo.class);
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
		
		//query = mongoMapper.getChatList(search);
		//정렬
		query = new Query();
		criteria = new Criteria();
		query.with(new Sort(Sort.Direction.ASC, "regDate"));
		//갯수제한
		//query.limit(2);
		criteria = new Criteria();
		//검색조건
		//criteria.where("chatRoomNo").is(10007);
		//query.addCriteria(criteria);
		//criteria.andOperator(Criteria.where("chatProfileImg").is("abc"), Criteria.where("chatRoomNo").is(search.getChatRoomNo()));
		criteria.andOperator(Criteria.where("chatRoomId").is(search.getChatRoomId()));
		query.addCriteria(criteria);
		
		
		return mongoTemplate.find(query, Chat.class);
		
	}
	
	@Override
	public void addChatRoom(ChatRoomForMongo chatRoomForMongo) throws Exception {
		mongoTemplate.insert(chatRoomForMongo);
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

		query = new Query();
		criteria = new Criteria();
		query.with(new Sort(Sort.Direction.ASC, "regDate"));
		criteria.andOperator(Criteria.where("chatRoomId").is(search.getChatRoomId()));
		query.addCriteria(criteria);
		
		return mongoTemplate.find(query, ChatRoomInfo.class);
	}

	@Override
	public List getWannaBeFriendList(Search search) throws Exception {
		return sqlSession.selectList("ChatFriendMapper.getWannaBeFriendList", search);
	}

	@Override
	public void addMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception {
		mongoTemplate.insert(chatRoomInfo);
	}

	@Override
	public List getMyChatRoomList(ChatRoomInfo chatRoomInfo) throws Exception {
		return null;
	}

	@Override
	public void updateMyChatRoomName(ChatRoomInfo chatRoomInfo) throws Exception {
		query = new Query();
		criteria = new Criteria();
		criteria.andOperator(Criteria.where("id").is(chatRoomInfo.getId()));
		query.addCriteria(criteria);
		update = new Update();
		update.set("chatRoomName", chatRoomInfo.getChatRoomName());
		mongoTemplate.updateFirst(query, update, ChatRoomInfo.class);
	}

	@Override
	public void deleteMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception {
		mongoTemplate.remove(chatRoomInfo);
	}

	@Override
	public List getFriendsListForInvite(Search search) throws Exception {
		return sqlSession.selectList("ChatFriendMapper.getFriendsListForInvite", search);
	}

	@Override
	public List getFriendNickNameList(Search search) throws Exception {
		return sqlSession.selectList("ChatFriendMapper.getFriendNickNameList", search);
	}

	@Override
	public ChatRoomInfo getMyChatRoomInfoByChatRoomInfo(ChatRoomInfo chatRoomInfo) throws Exception {
		query = new Query();
		criteria = new Criteria();
		//query.with(new Sort(Sort.Direction.DESC, "latestMessagingDate"));
		criteria.andOperator(Criteria.where("userNo").is(chatRoomInfo.getUserNo()), Criteria.where("chatRoomId").is(chatRoomInfo.getChatRoomId()));
		query.addCriteria(criteria);
		return mongoTemplate.findOne(query, ChatRoomInfo.class);
	}

}
