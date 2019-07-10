package com.phoenix.mvc.service.cafe;

import java.util.Map;

import com.phoenix.mvc.common.Search;

public interface CafePostService {
	public Map<String, Object> listPostByBoard(Search search);
	
	public Map<String, Object> listPostBySearch(Search search);
}
