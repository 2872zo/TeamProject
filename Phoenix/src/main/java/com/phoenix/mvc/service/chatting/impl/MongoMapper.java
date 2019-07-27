package com.phoenix.mvc.service.chatting.impl;

import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.phoenix.mvc.common.Search;

public class MongoMapper {
	private Query query;
	private Criteria criteria;
	
	public Query getChatList(Search search) {
		
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
		return query;
		
	}
	
	public Query getChatRoomUserList(Search search) {
		
		query = new Query();
		criteria = new Criteria();
		query.with(new Sort(Sort.Direction.ASC, "regDate"));
		criteria.andOperator(Criteria.where("chatRoomId").is(search.getChatRoomId()));
		query.addCriteria(criteria);
		return query;
	
	}
	
		public Query getMyChatRoomList(Search search) {
		
		query = new Query();
		criteria = new Criteria();
		//query.with(new Sort(Sort.Direction.DESC, "latestMessagingDate"));
		criteria.andOperator(Criteria.where("userNo").is(search.getUserNo()));
		query.addCriteria(criteria);
		return query;
	
	}
	
	
}
