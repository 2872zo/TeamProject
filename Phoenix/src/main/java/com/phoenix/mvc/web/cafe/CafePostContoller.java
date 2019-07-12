package com.phoenix.mvc.web.cafe;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

import oracle.net.aso.n;

@Controller
@PropertySource("common.properties")
public class CafePostContoller {
	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;

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
	public String getCafeInnerSearchList(@ModelAttribute Search search, Map<String, Object> map) throws Exception {
		System.out.println("[CafeInnerSearchList] Search : " + search);

		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("[CafeInnerSearchList] Search : " + search);

		Map<String, Object> queryResultMap = cafePostService.getPostListBySearch(search);
		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		// 메뉴바를 위한 임시 데이터
		search.setMemberNo(10000);

		// 메뉴바를 위한 정보
		String cafeURL = search.getCafeURL();
		CafeMember cafeMember = cafeMemberService.getCafeMember(search);
		// 메뉴바용 게시판 목록 - 컨디션 "1", 카페URL 사용
		List<Board> boardList = cafeManageService.getCafeBoard(search);

		// 검색옵션의 게시판목록을 위한 작업
		List<Board> boardOption = new ArrayList<Board>();
		boardOption.addAll(boardList);
		// 구분선 모두 처리
		Predicate<Board> condition = board -> board.getBoardType().equals("cb102");
		boardOption.removeIf(condition);

		map.put("cafeURL", cafeURL);
		map.put("cafeMember", cafeMember);
		map.put("boardOption", boardOption);
		map.put("boardList", boardList);
		map.put("postList", queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("page", page);
		map.put("search", search);

		return "cafe/listCafeInnerSearch";
	}

	@RequestMapping("/cafe/{cafeURL}/getBoard/{boardNo}")
	public String getPostList(Map<String, String> result, @ModelAttribute Search search, Map<String, Object> map)
			throws Exception {
		// paging 설정
		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		System.out.println("[getBoard] Search : " + search);

		// 게시판별 게시글 가져오기
		Map<String, Object> queryResultMap = cafePostService.getPostListByBoard(search);

		// 전체 크기
		int postTotalCount = (int) queryResultMap.get("postTotalCount");

		// paging을 위한 객체
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		
		// 메뉴바를 위한 임시 데이터
		search.setMemberNo(10000);
		// 메뉴바를 위한 카페 멤버 정보
		CafeMember cafeMember = cafeMemberService.getCafeMember(search);
		// 메뉴바를 위한 게시판 목록 - 카페URL
		List<Board> boardList = cafeManageService.getCafeBoard(search);

		// 메뉴바를 위한 속성
		map.put("cafeURL", search.getCafeURL());
		map.put("cafeMember", cafeMember);
		map.put("boardList", boardList);

		map.put("postList", queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("search", search);
		map.put("page", page);

		return "cafe/listCafePostByBoard";
	}

	@GetMapping("/cafe/{cafeURL}/addPost")
	public String addPostView(@ModelAttribute Search search, Map<String, Object> map) {

		search.setSearchCondition("1");
		List<Board> boardList = cafeManageService.getCafeBoard(search);

		map.put("boardList", boardList);

		return "/cafe/addCafePost";
	}

	@PostMapping("/cafe/{cafeURL}/addPost")
	public String addPost(@ModelAttribute Search search, @ModelAttribute Post post) {
		System.out.println("[addPost] POST : " + post);

		post.setPostContent(post.getPostContent().replaceAll(System.getProperty("line.separator"), ""));
		System.out.println("Post Insert 결과 : " + cafePostService.addPost(post));

		return "redirect:/cafe/" + post.getCafeURL() + "/getPost/" + post.getPostNo();
	}

	@GetMapping("/cafe/{cafeURL}/getPost/{postNo}")
	public String getPost(@PathVariable int postNo, Map<String, Object> map, @ModelAttribute Search search) throws Exception {
		System.out.println("[getPost] postNo : " + postNo);

		Post post = cafePostService.getPost(postNo);

		// 메뉴바를 위한 임시 데이터
		search.setMemberNo(10000);
		// 메뉴바를 위한 카페 멤버 정보
		CafeMember cafeMember = cafeMemberService.getCafeMember(search);
		// 메뉴바를 위한 게시판 목록 - 카페URL
		List<Board> boardList = cafeManageService.getCafeBoard(search);

		// 메뉴바를 위한 속성
		map.put("cafeURL", search.getCafeURL());
		map.put("cafeMember", cafeMember);
		map.put("boardList", boardList);
		
		map.put("post", post);

		return "/cafe/getCafePost";
	}

	@GetMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePostView(@PathVariable int postNo, @PathVariable String cafeURL, Map<String, Object> map,
			@ModelAttribute Search search) throws Exception {
		System.out.println("[updatePostView] postNo : " + postNo);

		Post post = cafePostService.getPost(postNo);
		
		// 메뉴바를 위한 임시 데이터
		search.setMemberNo(10000);
		// 메뉴바를 위한 카페 멤버 정보
		CafeMember cafeMember = cafeMemberService.getCafeMember(search);
		// 메뉴바를 위한 게시판 목록 - condition("1"), 카페URL
		List<Board> boardList = cafeManageService.getCafeBoard(search);
		
		// 검색옵션의 게시판목록을 위한 작업
		List<Board> boardOption = new ArrayList<Board>();
		boardOption.addAll(boardList);
		// 구분선 모두 처리
		Predicate<Board> condition = board -> board.getBoardType().equals("cb102");
		boardOption.removeIf(condition);

		// 메뉴바를 위한 속성
		map.put("cafeURL", search.getCafeURL());
		map.put("cafeMember", cafeMember);
		map.put("boardList", boardList);
		
		map.put("post", post);
		map.put("boardList", boardList);

		return "/cafe/updateCafePost";
	}

	@PostMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePost(@ModelAttribute Post post) {
		System.out.println("[updatePost] post : " + post);

		post.setPostContent(post.getPostContent().replaceAll(System.getProperty("line.separator"), ""));
		System.out.println(cafePostService.updatePost(post));

		return "redirect:/cafe/" + post.getCafeURL() + "/getPost/" + post.getPostNo();
	}

	@GetMapping("/cafe/{cafeURL}/deletePost")
	public String deletePost(@PathVariable String cafeURL, @RequestParam int postNo, @RequestParam int boardNo) {
		System.out.println("[updatePost] postNo : " + postNo);

		System.out.println("[deletePost 결과 : " + cafePostService.deletePost(postNo));

		return "redirect:/cafe/" + cafeURL + "/getBoard/" + boardNo;
	}

	@GetMapping("/cafe/{cafeURL}/addReply")
	public String addReplyView() {

		return "/cafe/addReply";
	}

	@PostMapping("/cafe/{cafeURL}/addReply")
	public String addReply(@PathVariable String cafeURL, @ModelAttribute Reply reply) {
		System.out.println("[addReply 결과] : " + cafePostService.addReply(reply));
		return "redirect:/cafe/" + cafeURL + "/getBoard/" + reply.getPostNo();
	}
}
