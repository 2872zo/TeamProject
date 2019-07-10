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
	public String CafeInnerSearchList(@ModelAttribute Search search, Map<String, Object> map) {
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

		Map<String, Object> queryResultMap = cafePostService.listPostBySearch(search);

		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		
		System.out.println(boardList);
		
		
		map.put("boardList", boardList);
		map.put("postList", (List<Post>) queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("page", page);

		return "cafe/listCafeInnerSearch";
	}

	@RequestMapping("/cafe/{cafeURL}/getBoard/{boardNo}")
	public String listPostByBoard(Map<String, String> result, @ModelAttribute Search search, Map<String, Object> map) {
		
		System.out.println("PageSize : " + this.pageSize);

		search.setPageSize(pageSize);
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("[getBoard] Search : " + search);

		Map<String, Object> queryResultMap = cafePostService.listPostByBoard(search);
		int postTotalCount = (int) queryResultMap.get("postTotalCount");
		Page page = new Page(search.getCurrentPage(), postTotalCount, pageUnit, pageSize);

		map.put("postList", (List<Post>) queryResultMap.get("postList"));
		map.put("postTotalCount", postTotalCount);
		map.put("page", page);

		return "cafe/listCafePostByBoard";
	}
}
