package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Post;

public interface CafePostDao {
	public List<Post> listPostBySearch(Search search);

	public List<Post> listPostByBoard(Search search);

	public int postTotalCount(Search search);
	
	public int searchTotalCount(Search search);
}
