package com.phoenix.mvc.service.chatting.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingDao;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoomForMongo;
import com.phoenix.mvc.service.domain.ChatRoomInfo;
import com.phoenix.mvc.service.domain.User;

@Service
@Transactional
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	@Qualifier("chattingDaoImpl")	
	private ChattingDao chattingDao;
	
	@Value("${enterChatAmount}")
	private int enterChatAmount;
	
	@Value("${readChatAmount}")
	private int readChatAmount;
	
	public ChattingServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map getMyChatRoomList(Search search) throws Exception {
		Map map = new HashMap();
		
		List<ChatRoomInfo> chatRoomList = chattingDao.getMyChatRoomList(search);
		
		for (ChatRoomInfo chatRoomInfo : chatRoomList) {
			List<String> stringList = new ArrayList();
			List<ChatRoomInfo> imgList = chattingDao.getFourImgForChatRoomList(chatRoomInfo);
			for (ChatRoomInfo imgChatRoomInfo : imgList) {
				stringList.add(imgChatRoomInfo.getProfileImg());
			}
			System.out.println("네개 나오니???"+stringList);
			chatRoomInfo.setImgs(stringList);
		}
		
		map.put("chatRoomList",chatRoomList);
		
		return map;
	}

	@Override
	public Map getMyFriendsList(Search search) throws Exception {
		Map map = new HashMap();
		List friendsList = chattingDao.getMyFriendsList(search);
		map.put("friendsList", friendsList);
		return map;
	}
	
	@Override
	public Map getFriendSearchList(Search search) throws Exception {
		Map map = new HashMap();
		List searchList = chattingDao.getFriendSearchList(search);
		map.put("searchList", searchList);
		return map;
	}

	@Override
	public Map getWannaBeFriendList(Search search) throws Exception {
		Map map = new HashMap();
		List wannaBeFreindList = chattingDao.getWannaBeFriendList(search);
		map.put("wannaBeFreindList", wannaBeFreindList);
		return map;
	}

	@Override
	public int addFriend(ChatFriend chatFriend) throws Exception {
		return chattingDao.addFriend(chatFriend);
	}

	@Override
	public int updateFriend(ChatFriend chatFriend) throws Exception {
		return chattingDao.updateFriend(chatFriend);
	}

	@Override
	public int deleteFriend(ChatFriend chatFriend) throws Exception {
		return chattingDao.deleteFriend(chatFriend);
	}
	
	@Override
	public void addChat(Chat chat) throws Exception {
		chattingDao.addChat(chat);
		chattingDao.updateChatRoomRecentMsg(chat);
	}
	

	@Override
	public Map getChatList(Search search) throws Exception {
		
		Map map = new HashMap();
		List chatList = chattingDao.getChatList(search);
		return map;
	
	}
	
	@Override
	public Map getChatRoom(Search search) throws Exception {
	
		Map map = new HashMap();
		List<ChatFriend> nickNameList = chattingDao.getFriendNickNameList(search);
		long chatCount = chattingDao.getChatCount(search);
		if (chatCount<=enterChatAmount) {
			search.setChatIndexNow(0);
		} else {
			search.setChatIndexNow(chatCount-enterChatAmount);
		}
		
		List<Chat> chatList = chattingDao.getChatList(search);
		List<ChatRoomInfo> userList = chattingDao.getChatRoomUserList(search);
		
		List<Integer> targetUserNos = new ArrayList<Integer>();
		for(int i =0;i<userList.size() ;i++) {
			ChatRoomInfo chatRoomInfo = (ChatRoomInfo) userList.get(i);
			targetUserNos.add(chatRoomInfo.getUserNo());
		}
		search.setTargetUserNos(targetUserNos);
		
		List inviteList = chattingDao.getFriendsListForInvite(search);
		
		ChatRoomInfo chatRoomInfo = chattingDao.getMyChatRoomInfo(search);
		
		for (Chat chat : chatList) {
			for (ChatFriend chatFriend:nickNameList) {
				if(chat.getUserNo()==chatFriend.getUserNo()) {
					chat.setUserNickname(chatFriend.getFriendNickname());
				}
			}
		}
		for (ChatRoomInfo eachChatRoomInfo : userList) {
			for (ChatFriend eachChatFriend:nickNameList) {
				if(eachChatRoomInfo.getUserNo()==eachChatFriend.getUserNo()) {
					eachChatRoomInfo.setUserNickname(eachChatFriend.getFriendNickname());
				}
			}
		}
		map.put("chatIndex", search.getChatIndexNow());
		map.put("nickNameList", nickNameList);		
		map.put("chatRoomInfo", chatRoomInfo);
		map.put("chatList", chatList);
		map.put("userList", userList);
		map.put("inviteList", inviteList);
		return map;
		
	}
	
	@Override
	public String addChatRoom(Map map) throws Exception {
		
		ChatRoomForMongo chatRoomForMongo = (ChatRoomForMongo)map.get("chatRoomForMongo");
		chattingDao.addChatRoom(chatRoomForMongo);
		User user = (User)map.get("user");
		ChatRoomInfo chatRoomInfo = new ChatRoomInfo();		
		chatRoomInfo.setChatRoomId(chatRoomForMongo.getId());
		chatRoomInfo.setUserNo(chatRoomForMongo.getOpenUserNo());
		chatRoomInfo.setProfileImg(user.getProfileImg());
		chatRoomInfo.setUserNickname(user.getUserNickname());
		chatRoomInfo.setRegDate(new Date());
		chatRoomInfo.setChatRoomName(new SimpleDateFormat("yyyy.MM.dd HH:mm").format(chatRoomInfo.getRegDate())+"에 "+user.getUserNickname()+" 님이 개설한 채팅방");
		chatRoomInfo.setLatestEnter(new Date());
		chatRoomInfo.setLatestLeave(new Date());
		chatRoomInfo.setLatestMessage("");
		chatRoomInfo.setLatestMessagingDate(new Date());
		chattingDao.addMyChatRoom(chatRoomInfo);
		
		return chatRoomInfo.getChatRoomId();
	}

	@Override
	public void addMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception {
		chattingDao.addMyChatRoom(chatRoomInfo);
	}

	@Override
	public List getMyChatRoomList(ChatRoomInfo chatRoomInfo) throws Exception {
		return null;
	}

	@Override
	public void updateMyChatRoomName(ChatRoomInfo chatRoomInfo) throws Exception {
		chattingDao.updateMyChatRoomName(chatRoomInfo);
	}

	@Override
	public void deleteMyChatRoom(ChatRoomInfo chatRoomInfo) throws Exception {
		ChatRoomInfo chatRoomInfoRe = chattingDao.getMyChatRoomInfoByChatRoomInfo(chatRoomInfo);
		chattingDao.deleteMyChatRoom(chatRoomInfoRe);
	}

	@Override
	public Map getFriendsListForInvite(Search search) throws Exception {
		Map map = new HashMap();
		List FriendsForInvite = chattingDao.getFriendsListForInvite(search);
		map.put("FriendsForInvite", FriendsForInvite);
		return map;
	}

	@Override
	public Map getMoreChat(Search search) throws Exception {
		Map map = new HashMap();
		long indexNow = search.getChatIndexNow();
		if (readChatAmount>=indexNow) {
			search.setChatIndexNow(0);
			search.setReadChatAmount((int)indexNow);
		}
		else {
			search.setChatIndexNow(indexNow-readChatAmount);
			search.setReadChatAmount(readChatAmount);
		}
		List chatList = chattingDao.getChatList(search);
		Collections.reverse(chatList);
		map.put("indexNow", search.getChatIndexNow());
		map.put("chatList", chatList);
		return map;
	}

}
