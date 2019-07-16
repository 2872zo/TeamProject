package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;

public interface CafePostService {
	public Map<String, Object> getPostListByBoard(Search search);
	
	public Map<String, Object> getPostListBySearch(Search search);
	
	public boolean addPost(Post post);
	
	public Post getPost(int postNo);
	
	public boolean updatePost(Post post);
	
	public boolean deletePost(int postNo);
	
	public boolean addReply(Reply reply);
	
	public Map<String, Object> getReplyList(Search search);
	
	public boolean updateReply(Reply reply);
	
	public boolean deleteReply(int replyNo);

	public Reply getReply(int replyNo);

	public boolean addReReply(Reply reply);
}
