package com.phoenix.mvc.service.explore;

import java.util.List;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;

public interface ExploreService {
	
	public List<Blog> getBlogExploreList(Search search);
	
	public List getCafeExploreList(Search search);
	
	public List getUnifiedExploreList(Search search);
	
	public List getImageExploreList(Search search);
	
	public List getWebsiteExploreList(Search search);
	
	public List getInfiniteImageList(Search search); //->를 꼭만들어야하나?? ImageExploreList를 사용하면되잖아.
	
	
}
