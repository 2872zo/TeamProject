package com.phoenix.mvc.service.explore;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.WebExplore;

public interface ExploreDao {
	
	public List<Blog> getDaumBlogExploreList(Search search) ;
	
	public List<Blog> getNaverBlogExploreList(Search search) throws Exception ;
	
	public List<CafeExplore> getDaumCafeExploreList(Search search);
	
	public List<CafeExplore> getNaverCafeExploreList(Search search) throws Exception;
	
	public List<CafeExplore> getPhoenixCafeExploreList(Search search);
	
	public List<WebExplore> getDaumWebExploreList(Search search);
	
	public List<WebExplore> getNaverWebExploreList(Search search) throws Exception;
	
	public List<Image> getDaumImageExploreList(Search search);
	
	public List<Image> getNaverImageExploreList(Search search) throws Exception;

}
