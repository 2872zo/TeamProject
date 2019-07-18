package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;

public interface CafePostService {
	public Map<String, Object> getPostListByBoard(Search search);
	
	public Map<String, Object> getPostListBySearch(Search search);
	
	public boolean addPost(Post post) throws Exception;
	
	public Post getPost(int postNo);
	
	public boolean updatePost(Post post);
	
	public boolean deletePost(int postNo) throws Exception;
	
	public boolean deletePostList(String postNoList) throws Exception;
	
	public boolean addReply(Reply reply) throws Exception;
	
	public Map<String, Object> getReplyList(Search search);
	
	public boolean updateReply(Reply reply);
	
	public boolean deleteReply(int replyNo) throws Exception;

	public Reply getReply(int replyNo);

	public boolean addReReply(Reply reply);

	public boolean movePost(Map map);
	
	public Map<String, Object> addLike(Search search);
}
