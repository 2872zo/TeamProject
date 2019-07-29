package com.phoenix.mvc.web.explore;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.explore.ExploreService;

@RestController
@RequestMapping("/explore/*")
public class ExploreRestController {

	@Autowired
	@Qualifier("exploreServiceImpl")
	private ExploreService exploreService;
	
	@Value("${imagePageSize}")
	private int imagePageSize;
	
	@Value("${explorePageUnit}")
	private int explorePageUnit;
	
	public ExploreRestController() {
		System.out.println(this.getClass().getName()+"생성자 시작");
	}
	
	@RequestMapping(value="/json/infiniteImageList")
	public Map getInfiniteImageList(@RequestBody Search search) throws Exception
	{
		
		System.out.println("/json/infiniteImageList 실행");
		
		Map returnMap = new HashMap();
		
		if(search.getSearchKeyword()==null) { //URL 치고 들어오는경우 1.검색어
			search.setSearchKeyword("");
		}
		if(search.getSearchTheme()==0) { 
			search.setSearchTheme(3);
		}
		if(search.getOrderState()==0) { // 처음 치고 들어오는경우 관련도 순으로 뽑음
			search.setOrderState(0);
		}
		if(!search.isEngineAll() && !search.isEngineDaum() && !search.isEngineNaver()) { //다 false면 
			search.setEngineAll(true);
		}
		if(search.isEngineDaum() && search.isEngineNaver()) { //둘다 true면 전체선택체크되도록
			search.setEngineAll(true);
		}
		if(search.getCurrentPage()==0) { //page설정
			search.setCurrentPage(1);
		}
		
		search.setPageSize(imagePageSize);
		
		Map map = exploreService.getImageExploreList(search);
		
		Page page = new Page(search.getCurrentPage(),(int)map.get("totalCount"),explorePageUnit,imagePageSize); //갔다와서 리턴에  total값 줘야함 ㅠ 
		
		System.out.println("레스트에서 maxPAge : "+page.getMaxPage());
		
		returnMap.put("imageList", map.get("imageList"));
		returnMap.put("page", page);
		returnMap.put("search",search);
		
		return returnMap;
	}
	
	

}
