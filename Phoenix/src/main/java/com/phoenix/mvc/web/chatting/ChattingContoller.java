package com.phoenix.mvc.web.chatting;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.ChatRoom;
import com.phoenix.mvc.service.domain.User;

@Controller
@RequestMapping("/chat/*")
public class ChattingContoller {
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	public ChattingContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("main")
	public String getChatMain() {
		
		return "chat/chatMain";
	}
	
	@RequestMapping("chatFriendsList")
	public String getChatFriendsList() {
		
		return "chat/listChatFriends";
	}
	
	@RequestMapping("chatRoomList")
	public String getChatRoomList(@SessionAttribute("user") User user, Model model, HttpSession session) throws Exception {
		
		Search search = new Search();
		search.setUserNo(user.getUserNo());
		Map map = chattingService.getMyChatRoomList(search);
		List<ChatRoom> chatRoomList = (List) map.get("chatRoomList");
		List<Integer> roomNoList = new ArrayList<Integer>();
		String roomNos = "";
		for (int i =0; i<chatRoomList.size() ;i++) {
			int a = chatRoomList.get(i).getChatRoomNo();
			roomNoList.add(a);
			roomNos += a+",";
		}
		session.setAttribute("roomNos",roomNos);
		session.setAttribute("roomNoList",roomNoList);
		model.addAttribute("chatRoomList",chatRoomList);
		model.addAttribute("roomNos",roomNos);
		return "chat/listChatRoom";
	}
	
	@RequestMapping("chatRoom")
	public String getChatRoom(@SessionAttribute("user") User user, @ModelAttribute("chatRoom") ChatRoom chatRoom) throws Exception {
		
		//Search search = new Search();
		//search.setUserNo(user.getUserNo());
		//Map map = chattingService.getMyChatRoomList(search);
		//List chatRoomList = (List) map.get("chatRoomList");
		//model.addAttribute("chatRoom", chatRoom);
		return "chat/chatRoom";
	}
	
	@RequestMapping("addChatRoom")
	public String addChatRoom(@SessionAttribute("user") User user, @ModelAttribute ChatRoom chatRoom, Model model) throws Exception {
		
		return "chat/chatRoom";
	}
	
	@RequestMapping("config")
	public String getChatConfig() {
		
		return "chat/chatConfig";
	}
	
}
