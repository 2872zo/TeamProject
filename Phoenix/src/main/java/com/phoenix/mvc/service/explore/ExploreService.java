package com.phoenix.mvc.service.explore;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.WebExplore;

public interface ExploreService {
	
	public List<Blog> getBlogExploreList(Search search) throws Exception;
	
	public List<CafeExplore> getCafeExploreList(Search search) throws Exception ;
	
	public List getUnifiedExploreList(Search search) throws Exception;
	
	public List<Image> getImageExploreList(Search search)throws Exception;
	
	public List<WebExplore> getWebsiteExploreList(Search search)throws Exception;
	
	public List getInfiniteImageList(Search search) throws Exception; //->를 꼭만들어야하나?? ImageExploreList를 사용하면되잖아.
	
}
