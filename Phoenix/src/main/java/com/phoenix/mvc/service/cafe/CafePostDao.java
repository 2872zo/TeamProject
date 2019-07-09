package com.phoenix.mvc.service.cafe;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Post;

public interface CafePostDao {
	public List<Post> getBoard(Search search);
}
