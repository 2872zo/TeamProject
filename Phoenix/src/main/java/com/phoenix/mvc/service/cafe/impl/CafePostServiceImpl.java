package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;

@Service
@Transactional
public class CafePostServiceImpl implements CafePostService {
	@Autowired
	@Qualifier("cafePostDaoImpl")
	private CafePostDao cafePostDao;

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	
	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;

	public CafePostServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map<String, Object> getPostListBySearch(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();

//		map.put("boardList", cafeManageDaoImpl.getBoardList(search.getCafeURL()) );
		map.put("postList", cafePostDao.getPostListBySearch(search));
		map.put("postTotalCount", cafePostDao.searchTotalCount(search));

		return map;
	}

	@Override
	public Map<String, Object> getPostListByBoard(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();

		if(search.getCurrentPage() == 1) {
			map.put("noticePostList", cafePostDao.getNoticePostList(search));
//			map.put("bestPostList", cafePostDao.getBestPostList(search.getBoardNo()));
		}
		map.put("postList", cafePostDao.getPostListByBoard(search));
		map.put("postTotalCount", cafePostDao.postTotalCount(search));

		return map;
	}

	@Override
	public boolean addPost(Post post) throws Exception {
		cafeMemberDao.updatePostCountIncrease(post.getMemberNo());
		return cafePostDao.addPost(post);
	}

	@Override
	public Post getPost(int postNo) {
		return cafePostDao.getPost(postNo);
	}

	@Override
	public boolean updatePost(Post post) {
		return cafePostDao.updatePost(post);
	}

	@Override
	public boolean deletePost(int postNo) throws Exception {
		cafePostDao.deletePost(postNo);
		cafeMemberDao.updatePostCountDecrease(postNo);
		return true;
	}
	
	@Override
	public boolean deletePostList(String postNoList) throws Exception {
		return cafePostDao.deletePostList(postNoList);
	}

	@Override
	public boolean addReply(Reply reply) throws Exception {
		cafeMemberDao.updateReplyCountIncrease(reply.getMemberNo());
		return cafePostDao.addReply(reply);
	}
	
	@Override
	public Map<String, Object> getReplyList(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("replyTotalCount", cafePostDao.replyTotalCount(search));
		
		while(search.getSearchCondition() != null && search.getSearchCondition().equals("1")) {
			System.out.println(">>>>>>>>pageUp!");
			if(search.getEndRowNum() > (int)map.get("replyTotalCount")){
				search.setCurrentPage(search.getCurrentPage() - 1);
				break;
			}
			search.setCurrentPage(search.getCurrentPage() + 1);
		}
		
		map.put("replyList", cafePostDao.getReplyList(search));
		
		return map;
	}
	
	@Override
	public boolean updateReply(Reply reply) {
		return cafePostDao.updateReply(reply);
	}

	@Override
	public boolean deleteReply(int replyNo) throws Exception {
//		cafeMemberDao.updateReplyCountDecrease(replyNo);
		return cafePostDao.deleteReply(replyNo);
	}

	@Override
	public Reply getReply(int replyNo) {
		return cafePostDao.getReply(replyNo);
	}

	@Override
	public boolean addReReply(Reply reply) {
		return cafePostDao.addReReply(reply);
	}

	@Override
	public boolean movePost(Map map) {
		return cafePostDao.movePost(map);
	}

	@Override
	public Map<String, Object> addLike(Search search) {
		Event event = new Event();
		
		if(search.getSearchCondition().equals("0")  ) {
			event.setEventType("et101");
			event.setTargetNo(search.getPostNo());
		}else if(search.getSearchCondition().equals("1")){
			event.setEventType("et102");
			event.setTargetNo(search.getReplyNo());
		}
		event.setEventUserNo(search.getUserNo());
		event.setCafeNo(cafeManageDao.getCafeNo(search.getCafeURL()));
		search.setCafeNo(event.getCafeNo());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		boolean result = true;
		result = cafePostDao.eventValidationCheck(search) == 0 ? true : false;
		
		if(result) {
			result = cafeManageDao.addEventLog(event);
			System.out.println("addLike Event 결과 : " + result);
			
			result = cafePostDao.addLike(search);
			System.out.println("addLike 결과 : " + result);
			
			if(search.getSearchCondition().equals("0")) {
				resultMap.put("likeCount", cafePostDao.getPost(search.getPostNo()).getLikeCount());
			}else if(search.getSearchCondition().equals("1") ){
				resultMap.put("likeCount", cafePostDao.getReply(search.getReplyNo()).getLikeCount());
			}
		}
		
		resultMap.put("result", result);
		
		return resultMap;
	}

	@Override
	public boolean updateNoticeOrder(List<Post> postList) {
		return cafePostDao.updateNoticeOrder(postList);
	}

	@Override
	public List<Post> getAllNoticePost(Search search) {
		return cafePostDao.getAllNoticePost(search);
	}

	@Override
	public Map<String, Object> getPostListByMember(Search search) {
		Map<String, Object>	map = new HashMap<>();
		map.put("postList", cafePostDao.getPostListByMember(search));
		map.put("postTotalCount", cafePostDao.memberPostTotalCount(search));
				
		return map;
	}

	@Override
	public Board getBoard(int boardNo) {
		return cafePostDao.getBoard(boardNo);
	}

	@Override
	public Board getBoardByPostNo(int postNo) {
		return cafePostDao.getBoardByPostNo(postNo);
	}
	
}
