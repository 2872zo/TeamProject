package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;

public interface CafePostDao {
	public List<Post> getPostListBySearch(Search search);
	
	public int searchTotalCount(Search search);

	public List<Post> getPostListByBoard(Search search);

	public int postTotalCount(Search search);
	
	public List<Post> getPostListByNotice(Search search);
	
	public boolean addPost(Post post);

	public Post getPost(int postNo);

	public boolean updatePost(Post post);

	public boolean deletePost(int postNo);
	
	public boolean deletePostList(String postNoList);

	public boolean addReply(Reply reply);
	
	public List<Reply> getReplyList(Search search);

	public int replyTotalCount(Search search);	
	
	public boolean updateReply(Reply reply);

	public boolean deleteReply(int replyNo);

	public Reply getReply(int replyNo);

	public boolean addReReply(Reply reply);
	
	public List<Post> getMyPostList(int userNo);
}
