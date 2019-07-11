package com.phoenix.mvc.web.cafe;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Post;

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

	public CafePostContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("/cafe/{cafeURL}/search")
	public String getCafeInnerSearchList(@ModelAttribute Search search, Map<String, Object> map) {
		System.out.println("[CafeInnerSearchList] Search : " + search);

		//임시 데이터
		search.setTermStart(search.getTermStart());
		search.setTermEnd(search.getTermEnd());
		//임시데이터
		List<Board> boardList = new ArrayList<Board>();
		Board board = new Board();
		board.setBoardNo(10000);
		board.setBoardName("공지게시판");
		boardList.add(board);
		board = new Board();
		board.setBoardNo(10001);
		board.setBoardName("신고게시판");
		boardList.add(board);
		board = new Board();
		board.setBoardNo(10003);
		board.setBoardName("자유게시판");
		boardList.add(board);
		
		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("[CafeInnerSearchList] Search : " + search);

		Map<String, Object> queryResultMap = cafePostService.getPostListBySearch(search);

		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		
		System.out.println(boardList);
		
		map.put("boardList", boardList);
		map.put("postList", (List<Post>) queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("page", page);
		map.put("search", search);

		return "cafe/listCafeInnerSearch";
	}

	@RequestMapping("/cafe/{cafeURL}/getBoard/{boardNo}")
	public String getPostList(Map<String, String> result, @ModelAttribute Search search, Map<String, Object> map) {
		
		System.out.println("PageSize : " + this.pageSize);

		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("[getBoard] Search : " + search);

		Map<String, Object> queryResultMap = cafePostService.getPostListByBoard(search);
		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		map.put("postList", (List<Post>) queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("search", search);
		map.put("page", page);

		return "cafe/listCafePostByBoard";
	}
	
	@GetMapping("/cafe/{cafeURL}/addPost")
	public String addPostView(@ModelAttribute Search search, Map<String, Object> map) {
		//임시데이터
		List<Board> boardList = new ArrayList<Board>();
		Board board = new Board();
		board.setBoardNo(10000);
		board.setBoardName("공지게시판");
		boardList.add(board);
		board = new Board();
		board.setBoardNo(10001);
		board.setBoardName("신고게시판");
		boardList.add(board);
		board = new Board();
		board.setBoardNo(10003);
		board.setBoardName("자유게시판");
		boardList.add(board);
		
		map.put("boardList", boardList);
				
		return "/cafe/addCafePost";
	}
	
	@PostMapping("/cafe/{cafeURL}/addPost")
	public String addPost(@ModelAttribute Search search, @ModelAttribute Post post) {
		System.out.println("[addPost] POST : " + post);
		
		System.out.println("Post Insert 결과 : " + cafePostService.addPost(post));
				
		return "/cafe/"+post.getCafeUrl()+"/getPost/"+post.getPostNo();
	}
	
	@GetMapping("/cafe/{cafeURL}/getPost/{postNo}")
	public String getPost(@PathVariable int postNo, Map<String, Object> map) {
		System.out.println("[getPost] postNo : " + postNo);
		
		Post post = cafePostService.getPost(postNo);
		
		map.put("post", post);
		
		return "/cafe/getCafePost";
	}
	
	@GetMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePostView(@PathVariable int postNo, Map<String, Object> map) {
		System.out.println("[updatePostView] postNo : " + postNo);
		
		//임시데이터
		List<Board> boardList = new ArrayList<Board>();
		Board board = new Board();
		board.setBoardNo(10000);
		board.setBoardName("공지게시판");
		boardList.add(board);
		board = new Board();
		board.setBoardNo(10001);
		board.setBoardName("신고게시판");
		boardList.add(board);
		board = new Board();
		board.setBoardNo(10003);
		board.setBoardName("자유게시판");
		boardList.add(board);
		
		Post post = cafePostService.getPost(postNo);
		
		map.put("post", post);
		map.put("boardList", boardList);
		
		return "/cafe/updateCafePost";
	}
	
	@PostMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePost(@ModelAttribute Post post) {
		System.out.println("[updatePost] post : " + post);
		
		System.out.println(cafePostService.updatePost(post));
		
		return "/cafe/"+post.getCafeUrl()+"/getPost/"+post.getPostNo();
	}
}
