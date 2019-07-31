package com.phoenix.mvc.service.explore;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.WebExplore;

public interface ExploreService {
	
	public Map getBlogExploreList(Search search) throws Exception;
	
	public Map getCafeExploreList(Search search) throws Exception ;
	
	public Map getUnifiedExploreList(Search search) throws Exception;
	
	public Map getImageExploreList(Search search)throws Exception;
	
	public Map getWebsiteExploreList(Search search)throws Exception;
	
	//public List getInfiniteImageList(Search search) throws Exception; //->를 꼭만들어야하나?? ImageExploreList를 사용하면되잖아.
	
}
