package com.phoenix.mvc.service.explore;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.WebExplore;

public interface ExploreDao {
	
	public Map getDaumBlogExploreList(Search search) throws Exception;
	
	public Map getNaverBlogExploreList(Search search) throws Exception ;
	
	public Map getDaumCafeExploreList(Search search) throws Exception;
	
	public Map getNaverCafeExploreList(Search search) throws Exception;
	
	public Map getPhoenixCafeExploreList(Search search);
	
	public List<WebExplore> getDaumWebExploreList(Search search);
	
	public List<WebExplore> getNaverWebExploreList(Search search) throws Exception;
	
	public Map getDaumImageExploreList(Search search);
	
	public Map getNaverImageExploreList(Search search) throws Exception;

}
