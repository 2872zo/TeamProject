package com.phoenix.mvc.web.cafe;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;
import com.phoenix.mvc.service.domain.User;

import oracle.net.aso.n;

@Controller
public class CafePostContoller {
	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;
	
	@Value("${replyPageSize}")
	private int replyPageSize;

	@Value("${replyPageUnit}")
	private int replyPageUnit;	

	@Value("${uploadDir}")
	private String uploadDir;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	public CafePostContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("/cafe/{cafeURL}/search")
	public String getCafeInnerSearchList(@ModelAttribute Search search, Map<String, Object> map, HttpServletRequest req)
			throws Exception {
		System.out.println("[CafeInnerSearchList] Search : " + search);

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("0");
		}
		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("[CafeInnerSearchList] Search : " + search);

		Map<String, Object> queryResultMap = cafePostService.getPostListBySearch(search);
		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		// 검색옵션의 게시판목록을 위한 작업
		List<Board> boardList = (List<Board>) req.getAttribute("boardList");
		List<Board> boardOption = new ArrayList<Board>();
		boardOption.addAll(boardList);
		// 구분선 모두 처리
		Predicate<Board> condition = board -> board.getBoardType().equals("cb102");
		boardOption.removeIf(condition);
		
		map.put("boardOption", boardOption);
		map.put("postList", queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("page", page);
		map.put("search", search);

		return "cafe/listCafeInnerSearch";
	}

	@RequestMapping("/cafe/{cafeURL}/getBoard/{boardNo}")
	public String getPostList(@ModelAttribute Search search, Map<String, Object> map) throws Exception {
		System.out.println("[getBoard] Search : " + search);

		// paging 설정
		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		System.out.println("[getBoard] Search : " + search);

		// 게시판별 게시글 가져오기 - boardNo 확인
		Map<String, Object> queryResultMap = cafePostService.getPostListByBoard(search);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>queryReslutMap : \n" + queryResultMap);

		// 전체 크기
		int postTotalCount = (int) queryResultMap.get("postTotalCount");

		// paging을 위한 객체
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>PAGE : " + page);

		map.put("bestPostList", queryResultMap.get("bestPostList"));
		map.put("noticePostList", queryResultMap.get("noticePostList"));
		map.put("postList", queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("search", search);
		map.put("page", page);

		return "cafe/listCafePostByBoard";
	}

	@GetMapping("/cafe/{cafeURL}/addPost")
	public String addPostView(@ModelAttribute Search search, Map<String, Object> map, HttpServletRequest req)
			throws Exception {

		// 검색옵션의 게시판목록을 위한 작업
		List<Board> boardList = (List<Board>) req.getAttribute("boardList");
		List<Board> boardOption = new ArrayList<Board>();
		boardOption.addAll(boardList);
		
		// 구분선 모두 처리
		Predicate<Board> condition = board -> board.getBoardType().equals("cb102");
		boardOption.removeIf(condition);

		//작성할수있는 게시판 등급 처리
		CafeMember cafeMember = (CafeMember)req.getAttribute("cafeMember");
		int cafeMemberGrade = Integer.parseInt(cafeMember.getMemberGrade().substring(2));
		if(cafeMemberGrade > 101) {
			Predicate<Board> gradeCondition = board -> Integer.parseInt(board.getAccessGrade().substring(2)) > cafeMemberGrade;
			boardOption.removeIf(gradeCondition);
		}
		
		map.put("boardOption", boardOption);

		return "/cafe/addCafePost";
	}

	@PostMapping("/cafe/{cafeURL}/addPost")
	public String addPost(@ModelAttribute Search search, @ModelAttribute Post post, @RequestParam String fileList)
			throws Exception {
		System.out.println("[addPost] POST : " + post);

		System.out.println(">>>>>>>>>>>>>>>>>>>fileList : " + fileList);

		List<String> deleteFileList = new ArrayList<String>();
		for (String fileName : fileList.split(",")) {
			if (post.getPostContent().indexOf(fileName) == -1) {
				deleteFileList.add(fileName);
			}
		}

		System.out.println(">>>>>>>>>>>>>>>>>>>fileList : " + deleteFileList);

		for (String fileName : deleteFileList) {
			File file = new File(uploadDir + "/" + fileName);

			if (file.exists()) {
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				if (file.delete()) {
					System.out
							.println("삭제성공\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				} else {
					System.out
							.println("삭제실패\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				}
			}
		}

		post.setPostContent(post.getPostContent().replaceAll(System.getProperty("line.separator"), ""));
		System.out.println("Post Insert 결과 : " + cafePostService.addPost(post));

		return "redirect:/cafe/" + post.getCafeURL() + "/getPost/" + post.getPostNo();
	}

	@GetMapping("/cafe/{cafeURL}/getPost/{postNo}")
	public String getPost(@PathVariable int postNo, Map<String, Object> map, @ModelAttribute Search search,
			HttpSession session) throws Exception {
		System.out.println("[getPost] postNo : " + postNo);

		return "/cafe/getCafePost";
	}

	@GetMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePostView(@PathVariable int postNo, @PathVariable String cafeURL, Map<String, Object> map,
			@ModelAttribute Search search, HttpServletRequest req) throws Exception {
		System.out.println("[updatePostView] postNo : " + postNo);

		Post post = cafePostService.getPost(postNo);

		// 검색옵션의 게시판목록을 위한 작업
		List<Board> boardList = (List<Board>) req.getAttribute("boardList");
		List<Board> boardOption = new ArrayList<Board>();
		boardOption.addAll(boardList);
		// 구분선 모두 처리
		Predicate<Board> condition = board -> board.getBoardType().equals("cb102");
		boardOption.removeIf(condition);

		map.put("post", post);
		map.put("boardOption", boardOption);

		return "/cafe/updateCafePost";
	}

	@PostMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePost(@ModelAttribute Post post, @RequestParam String fileList) {
		System.out.println("[ updatePost 실행 ] ");
//		System.out.println("[updatePost] post : " + post);

		System.out.println(">>>>>>>>>>>>>>>>>>>fileList : " + fileList);

		List<String> deleteFileList = new ArrayList<String>();
		for (String fileName : fileList.split(",")) {
			if (post.getPostContent().indexOf(fileName) == -1) {
				deleteFileList.add(fileName);
			}
		}

		System.out.println(">>>>>>>>>>>>>>>>>>>deleteFileList : " + deleteFileList);

		for (String fileName : deleteFileList) {
			File file = new File(uploadDir + "/" + fileName);

			if (file.exists()) {
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				if (file.delete()) {
					System.out
							.println("삭제성공\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				} else {
					System.out
							.println("삭제실패\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				}
			}
		}

		post.setPostContent(post.getPostContent().replaceAll(System.getProperty("line.separator"), ""));
		System.out.println(cafePostService.updatePost(post));

		return "redirect:/cafe/" + post.getCafeURL() + "/getPost/" + post.getPostNo();
	}

	@GetMapping("/cafe/{cafeURL}/deletePost")
	public String deletePost(@PathVariable String cafeURL, @RequestParam int postNo, @RequestParam int boardNo)
			throws Exception {
		System.out.println("[deletePost] postNo : " + postNo);

		System.out.println("[deletePost 결과 : " + cafePostService.deletePost(postNo));

		return "redirect:/cafe/" + cafeURL + "/getBoard/" + boardNo;
	}

	@PostMapping("/cafe/{cafeURL}/deletePostList")
	public String deletePostList(@PathVariable String cafeURL, @RequestParam String postNoList,
			@RequestParam int boardNo) throws Exception {
		System.out.println("[deletePostList] postNoList : " + postNoList);

		System.out.println("[deletePostList 결과 : " + cafePostService.deletePostList(postNoList));

		return "redirect:/cafe/" + cafeURL + "/getBoard/" + boardNo;
	}

	@GetMapping("/cafe/{cafeURL}/movePost/{boardNo}")
	public String movePostView(@PathVariable String cafeURL, @PathVariable int boardNo, @ModelAttribute Search search,
			@RequestParam String targetPostList, Map<String, Object> map) {
		System.out.println("[movePostView] : " + targetPostList);

		map.put("boardList", cafeManageService.getCafeBoardList(search));
		map.put("targetPostList", targetPostList);

		return "/cafe/movePost";
	}

	@PostMapping("/cafe/{cafeURL}/movePost")
	public String movePost(@PathVariable String cafeURL, @RequestParam int targetBoardNo,
			@RequestParam String targetBoardName, @RequestParam String targetPostList) {
		System.out.println("[movePostView] : " + targetPostList);

		Map map = new HashMap<String, String>();
		map.put("targetBoardNo", targetBoardNo);
		map.put("targetPostList", targetPostList);
		map.put("targetBoardName", targetBoardName);

		System.out.println("[movePost] 실행 결과 : " + cafePostService.movePost(map));

		return "redirect:/cafe/" + cafeURL + "/getBoard/" + targetBoardNo;
	}

	@PostMapping("/cafe/{cafeURL}/addReply")
	public String addReply(@PathVariable String cafeURL, @ModelAttribute Reply reply, HttpServletRequest req) throws Exception {

		CafeMember cafeMember = (CafeMember) req.getAttribute("cafeMember");
		reply.setMemberNo(cafeMember.getMemberNo());
		reply.setMemberNickname(cafeMember.getMemberNickname());
		
		System.out.println("[addReply] : " + reply);

		System.out.println("[addReply 결과] : " + cafePostService.addReply(reply));
		
		req.setAttribute("searchCondition", "1");
		return "forward:/cafe/" + cafeURL + "/getReplyList/" + reply.getPostNo();
	}

	@PostMapping("/cafe/{cafeURL}/addReReply")
	public String addReReply(@PathVariable String cafeURL, @ModelAttribute Reply reply, HttpServletRequest req,	@ModelAttribute Search search) throws Exception {
		CafeMember cafeMember = (CafeMember) req.getAttribute("cafeMember");
		reply.setMemberNo(cafeMember.getMemberNo());
		reply.setMemberNickname(cafeMember.getMemberNickname());

		System.out.println("[addReply] : " + reply);

		System.out.println("[addReply 결과] : " + cafePostService.addReReply(reply));
		
		req.setAttribute("currentPage", search.getCurrentPage());
		return "forward:/cafe/" + cafeURL + "/getReplyList/" + reply.getPostNo();
	}

	@RequestMapping("/cafe/{cafeURL}/getReply")
	public String getReply(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map) {
		Reply reply = cafePostService.getReply(search.getReplyNo());

		map.put("reply", reply);

		return "/cafe/getCafeReply";
	}

	@RequestMapping("/cafe/{cafeURL}/getReplyList/{postNo}")
	public String getReplyList(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map, HttpServletRequest req) {
		search.setSearchCondition((String)req.getAttribute("searchCondition"));
		
		search.setPageSize(replyPageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		System.out.println("[getReplyList] search : " + search);
		
		Map<String, Object> queryResultMap = cafePostService.getReplyList(search);
		Page page = new Page(search.getCurrentPage(), (int) queryResultMap.get("replyTotalCount"), replyPageUnit, replyPageSize);

		List<Reply> replyList = (List<Reply>) queryResultMap.get("replyList");

		map.put("bestReplyList", queryResultMap.get("bestReplyList"));
		map.put("replyList", replyList);
		map.put("replyTotalCount", queryResultMap.get("replyTotalCount"));
		map.put("page", page);
		map.put("postNo", search.getPostNo());

		return "/cafe/listCafeReply";
	}

	@GetMapping("/cafe/{cafeURL}/updateReply/{replyNo}")
	public String updateReplyView(@PathVariable String cafeURL, @ModelAttribute Search search,
			Map<String, Object> map) {
		Reply reply = cafePostService.getReply(search.getReplyNo());

		map.put("reply", reply);

		return "/cafe/updateCafeReply";
	}

	@PostMapping("/cafe/{cafeURL}/updateReply/{replyNo}")
	public String updateReply(@PathVariable String cafeURL, @ModelAttribute Search search,
			@ModelAttribute Reply reply) {
		System.out.println("[updateReply] 결과 : " + cafePostService.updateReply(reply));

		return "forward:/cafe/" + cafeURL + "/getReply?replyNo=" + reply.getReplyNo();
	}

	@PostMapping("/cafe/{cafeURL}/deleteReply/{replyNo}")
	public String deleteReply(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map)
			throws Exception {
		System.out.println("[deleteReply] 결과 : " + cafePostService.deleteReply(search.getReplyNo()));

		map.put("currentPage", search.getCurrentPage());
		return "forward:/cafe/" + cafeURL + "/getReply?replyNo=" + search.getReplyNo();
	}

	@GetMapping("/cafe/{cafeURL}/manage/updateNoticeOrder")
	public String updateNoticeOrderView(@ModelAttribute Search search, @PathVariable String cafeURL,
			Map<String, Object> map) {
		System.out.println("[updateNoticeOrderView] search : " + search);

		search.setCafeURL(cafeURL);

		map.put("postList", cafePostService.getAllNoticePost(search));

		return "/cafe/updateNoticeOrder";
	}

	@PostMapping("/cafe/{cafeURL}/getPostByMember")
	public String getPostByMember(@ModelAttribute Search search, @PathVariable String cafeURL, Map<String, Object> map,
			HttpServletRequest req) throws Exception {

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("0");
		}
		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("[CafeInnerSearchList] Search : " + search);

		Map<String, Object> queryResultMap = cafePostService.getPostListByMember(search);
		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		System.out.println("[getPostByMember] search : " + search);

		// 검색옵션의 게시판목록을 위한 작업
		List<Board> boardList = (List<Board>) req.getAttribute("boardList");
		List<Board> boardOption = new ArrayList<Board>();
		boardOption.addAll(boardList);
		// 구분선 모두 처리
		Predicate<Board> condition = board -> board.getBoardType().equals("cb102");
		boardOption.removeIf(condition);

		map.put("boardOption", boardOption);
		map.put("page", page);
		map.put("search", search);
		map.put("postList", queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);

		return "/cafe/listCafePostByMember";
	}
}
