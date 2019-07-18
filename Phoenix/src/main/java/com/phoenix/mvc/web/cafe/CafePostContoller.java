package com.phoenix.mvc.web.cafe;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
public class CafePostContoller {
	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;
	
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
	public String getCafeInnerSearchList(@ModelAttribute Search search, Map<String, Object> map) throws Exception {
		System.out.println("[CafeInnerSearchList] Search : " + search);

		if(search.getSearchCondition() == null) {
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
	public String getPostList(Map<String, String> result, @ModelAttribute Search search, Map<String, Object> map) throws Exception {
		System.out.println("[getBoard] Search : " + search);
		
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
	public String addPost(@ModelAttribute Search search, @ModelAttribute Post post, @RequestParam String fileList) throws Exception {
		System.out.println("[addPost] POST : " + post);

		System.out.println(">>>>>>>>>>>>>>>>>>>fileList : " + fileList);
		
		List<String> deleteFileList = new ArrayList<String>();
		for(String fileName : fileList.split(",")) {
			if(post.getPostContent().indexOf(fileName) == -1) {
				deleteFileList.add(fileName);
			}
		}
		
		System.out.println(">>>>>>>>>>>>>>>>>>>fileList : " + deleteFileList);
		
		for(String fileName : deleteFileList) {
			File file = new File(uploadDir + "/" + fileName);
			
			if(file.exists()) {
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				if(file.delete()) {
					System.out.println("삭제성공\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				}else {
					System.out.println("삭제실패\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				}
			}
		}
		
		
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
		map.put("boardOption", boardOption);

		return "/cafe/updateCafePost";
	}

	@PostMapping("/cafe/{cafeURL}/updatePost/{postNo}")
	public String updatePost(@ModelAttribute Post post, @RequestParam String fileList) {
		System.out.println("[ updatePost 실행 ] ");
//		System.out.println("[updatePost] post : " + post);
		
		///////////////////////////todo
		//add에서 하는 기존 파일삭제 프로세스 필요
		//삭제 이전에 기존 content에서 삭제된 img태그의 src를 찾아서 deleteFileList에 추가해줘야함.
		//기존 이미지를 찾는 과정은 jsp에서 content의 img태그를 찾게해서 src의 파일이름을 input에 넣기. ==> 기존 프로세스만 있으면 됨 
		
		System.out.println(">>>>>>>>>>>>>>>>>>>fileList : " + fileList);
		
		List<String> deleteFileList = new ArrayList<String>();
		for(String fileName : fileList.split(",")) {
			if(post.getPostContent().indexOf(fileName) == -1) {
				deleteFileList.add(fileName);
			}
		}
		
		System.out.println(">>>>>>>>>>>>>>>>>>>deleteFileList : " + deleteFileList);
		
		for(String fileName : deleteFileList) {
			File file = new File(uploadDir + "/" + fileName);
			
			if(file.exists()) {
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				if(file.delete()) {
					System.out.println("삭제성공\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				}else {
					System.out.println("삭제실패\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				}
			}
		}
		
		post.setPostContent(post.getPostContent().replaceAll(System.getProperty("line.separator"), ""));
		System.out.println(cafePostService.updatePost(post));

		return "redirect:/cafe/" + post.getCafeURL() + "/getPost/" + post.getPostNo();
	}

	@GetMapping("/cafe/{cafeURL}/deletePost")
	public String deletePost(@PathVariable String cafeURL, @RequestParam int postNo, @RequestParam int boardNo) throws Exception {
		System.out.println("[deletePost] postNo : " + postNo);

		System.out.println("[deletePost 결과 : " + cafePostService.deletePost(postNo));

		return "redirect:/cafe/" + cafeURL + "/getBoard/" + boardNo;
	}
	
	@PostMapping("/cafe/{cafeURL}/deletePostList")
	public String deletePostList(@PathVariable String cafeURL, @RequestParam String postNoList, @RequestParam int boardNo) throws Exception {
		System.out.println("[deletePostList] postNoList : " + postNoList);

		System.out.println("[deletePostList 결과 : " + cafePostService.deletePostList(postNoList));

		return "redirect:/cafe/" + cafeURL + "/getBoard/" + boardNo;
	}	

	@GetMapping("/cafe/{cafeURL}/movePost/{boardNo}")
	public String movePostView(@PathVariable String cafeURL, @PathVariable int boardNo, @ModelAttribute Search search, @RequestParam String targetPostList, Map<String, Object> map) {
		System.out.println("[movePostView] : " + targetPostList);
		
		map.put("boardList", cafeManageService.getCafeBoard(search));
		map.put("targetPostList", targetPostList);
		
		return "/cafe/movePost";
	}
	
	@PostMapping("/cafe/{cafeURL}/movePost")
	public String movePost(@PathVariable String cafeURL, @RequestParam int targetBoardNo, @ModelAttribute Search search, @RequestParam String targetPostList) {
		System.out.println("[movePostView] : " + targetPostList);		
		
		Map map = new HashMap<String, String>();
		map.put("targetBoardNo", targetBoardNo);
		map.put("targetPostList", targetPostList);
		
		System.out.println("[movePost] 실행 결과 : " + cafePostService.movePost(map));
		
		return "redirect:/cafe/" + cafeURL + "/getBoard/" + targetBoardNo;
	}
	
	@PostMapping("/cafe/{cafeURL}/addReply")
	public String addReply(@PathVariable String cafeURL, @ModelAttribute Reply reply) throws Exception {
		//임시 데이터
		reply.setMemberNo(10000);
		reply.setMemberNickname("매니저1");
		System.out.println("[addReply] : " + reply);
		
		System.out.println("[addReply 결과] : " + cafePostService.addReply(reply));
		return "forward:/cafe/" + cafeURL + "/getReplyList/" + reply.getPostNo();
	}
	
	@PostMapping("/cafe/{cafeURL}/addReReply")
	public String addReReply(@PathVariable String cafeURL, @ModelAttribute Reply reply) {
		//임시 데이터
		reply.setMemberNo(10000);
		reply.setMemberNickname("매니저1");
		System.out.println("[addReply] : " + reply);
		
		System.out.println("[addReply 결과] : " + cafePostService.addReReply(reply));
		return "redirect:/cafe/" + cafeURL + "/getReplyList/"+ reply.getPostNo();
	}
	
	@RequestMapping("/cafe/{cafeURL}/getReply/{postNo}")
	public String getReply(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map) {
		Reply reply = cafePostService.getReply(search.getReplyNo());
		
		map.put("reply", reply);
		
		return "/cafe/getCafeReply";
	}
	
	@RequestMapping("/cafe/{cafeURL}/getReplyList/{postNo}")
	public String getReplyList(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map){
		System.out.println("[getReplyList] search : " +  search);
		
		search.setPageSize(pageSize);
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		
		Map<String, Object> queryResultMap = cafePostService.getReplyList(search);
		Page page = new Page(search.getCurrentPage(), (int)queryResultMap.get("replyTotalCount"), pageUnit, pageSize);
		
		List<Reply> replyList = (List<Reply>) queryResultMap.get("replyList");
		for (Reply reply : replyList) {
			if(reply.isReplyStatusFlag()) {
				reply.setReplyContent("삭제된 댓글입니다.");
			}
		}
		
		map.put("replyList", replyList);
		map.put("replyTotalCount", queryResultMap.get("replyTotalCount"));
		map.put("page", page);
		map.put("postNo", search.getPostNo());
		
		return "/cafe/listCafeReply";
	}
	
	@GetMapping("/cafe/{cafeURL}/updateReply/{replyNo}")
	public String updateReplyView(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map) {
		Reply reply = cafePostService.getReply(search.getReplyNo());
		
		map.put("reply", reply);
		
		return "/cafe/updateCafeReply";
	}
	
	@PostMapping("/cafe/{cafeURL}/updateReply/{replyNo}")
	public String updateReply(@PathVariable String cafeURL, @ModelAttribute Search search, @ModelAttribute Reply reply) {
		System.out.println("[updateReply] 결과 : " + cafePostService.updateReply(reply));
		
		return "forward:/cafe/"+cafeURL+"/getReply/"+reply.getReplyNo();
	}
	
	@PostMapping("/cafe/{cafeURL}/deleteReply/{replyNo}")
	public String deleteReply(@PathVariable String cafeURL, @ModelAttribute Search search, Map<String, Object> map) throws Exception {
		System.out.println("[deleteReply] 결과 : " + cafePostService.deleteReply(search.getReplyNo()));
		
		map.put("currentPage", search.getCurrentPage());
		return "forward:/cafe/{cafeURL}/getReplyList/{search.postNo}";
	}
}
