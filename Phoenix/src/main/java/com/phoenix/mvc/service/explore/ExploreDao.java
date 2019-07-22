package com.phoenix.mvc.service.explore;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;

public interface ExploreDao {
	
	public List<Blog> getDaumBlogExploreList(Search search);
	
	public List<Blog> getNaverBlogExploreList(Search search);
	
	

}
