package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;

@Controller
@RequestMapping("/cafe/*")
public class CafeContoller {
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;
	
	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;
	
	public CafeContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("/{cafeURL}")
	public String getCafeMain(@PathVariable String cafeURL, HttpSession session,Model model) throws Exception
	{
		System.out.println("/cafe/{cafeURL}");
		
		User user = (User)session.getAttribute("user");

		Map map = cafeTabService.getCafeMain(user, cafeURL);
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>cafemain cafemember: " + map.get("cafeMember"));
		
		model.addAttribute("cafe", map.get("cafe"));
		model.addAttribute("cafeURL", cafeURL);
		model.addAttribute("noticePostList", map.get("noticePostList"));//공지게시글리스트
		model.addAttribute("cafeMember", map.get("cafeMember"));//내정보
		model.addAttribute("boardList", map.get("boardList"));//카페게시판리스트
		model.addAttribute("cafeApplication",map.get("cafeApplication"));//가입신청
		
		return "cafe/mainCafe";
	}
	
	///////////////////////////////예림시작///////////////////////////////////
	@RequestMapping("/{cafeURL}/getCafeGrade")
	public String getCafeGrade(@PathVariable String cafeURL, Model model, HttpSession session) throws Exception
	{
		System.out.println("/{cafeURL}/manage/updateCafeGradeView : GET");

		//int cafeNo = cafeMemberService.getCafeNo(cafeURL);
		List cafeGrade = cafeManageService.getCafeGrade(cafeURL) ;
		
		if(session.getAttribute("user")!=null)
		{
			User user = (User) session.getAttribute("user");
			Map map = cafeTabService.getCafeMain(user, cafeURL); //getCafemember랑 비교 해서 cafeMember정보 심으세여
			model.addAttribute("cafe",map.get("cafe"));
			model.addAttribute("cafeMember", map.get("cafeMember"));// 내정보
		}
		
		model.addAttribute("cafeGradeList", cafeGrade);
		model.addAttribute("cafeURL", cafeURL);
		
		return "cafe/getCafeGrade";
	}
	
	//////////////////////////////예림끝/////////////////////////////////////
	
	@RequestMapping("/{cafeURL}/closedCafe")
	public String ClosedCafe() {
		return "/cafe/common/closedCafe";
	}
	
	@RequestMapping("/{cafeURL}/needApply")
	public String NeedApply() {
		return "/cafe/common/needApply";
	}
	
	@RequestMapping("/{cafeURL}/memberBlock")
	public String MemberBlock() {
		return "/cafe/common/memberBlock";
	}
	
	@RequestMapping("/{cafeURL}/accessDenied")
	public String AccessDenied(HttpServletRequest req, @RequestParam int boardNo, Map<String, Object> map) {
		List<Board> boardList = (List<Board>) req.getAttribute("boardList");
		
		Board targetBoard = null;
		
		for(Board board : boardList) {
			if(board.getBoardNo() == boardNo) {
				targetBoard = board;
				break;
			}
		}
		
		map.put("board", targetBoard);
		
		return "/cafe/common/accessDenied";
	}
	
	@RequestMapping("/{cafeURL}/deletedPost")
	public String DeletedPost() {
		return "/cafe/common/deletedPost";
	}
}
