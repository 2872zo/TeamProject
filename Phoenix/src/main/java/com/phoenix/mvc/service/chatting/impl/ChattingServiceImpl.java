package com.phoenix.mvc.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.chatting.ChattingService;

@Service
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	@Qualifier("chattingDaoImpl")	
	private ChattingDao chattingDao;
	
	
	public ChattingServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map getMyChatRoomList(int userNo) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		
		List chatRoomList = chattingDao.getMyChatRoomList(userNo);
		
		map.put("chatRoomList",chatRoomList);
		
		return map;
	}
}
