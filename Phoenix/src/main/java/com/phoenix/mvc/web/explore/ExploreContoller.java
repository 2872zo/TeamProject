package com.phoenix.mvc.web.explore;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.WebExplore;
import com.phoenix.mvc.service.explore.ExploreService;

@Controller
@RequestMapping("/explore/*")
public class ExploreContoller {
	
	@Autowired
	@Qualifier("exploreServiceImpl")
	private ExploreService exploreService;
	
	@Value("${explorePageSize}")
	private int explorePageSize;
	
	@Value("${explorePageUnit}")
	private int explorePageUnit;
	
	public ExploreContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	
	
	@RequestMapping("getUnifiedList") //처음 메인화면에서 검색하면 이거 실행
	public String getUnifiedExploreList(@ModelAttribute Search search, Model model)
	{
		System.out.println("/explore/getUnifiedExploreList 실행");
		
		if(search.getSearchKeyword()==null) //URL 치고 들어오는경우
			search.setSearchKeyword("");
		
		
		
		
		return "explore/listUnifiedExplore";
	}
	
	@RequestMapping("getBlogList")
	public String getBlogExploreList(@ModelAttribute Search search, Model model) throws Exception
	{
		System.out.println("/explore/getBlogExploreList 실행");
		
		if(search.getSearchKeyword()==null) { //URL 치고 들어오는경우 1.검색어
			search.setSearchKeyword("");
		}
		if(search.getSearchTheme()==0) { //검색종류 블로그 이 컨트롤러 탔으면 일단 무조건 1이지
			search.setSearchTheme(1);
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
		
		search.setPageSize(explorePageSize);
		
		//System.out.println("search OrderState : "+search.getOrderState());
		//System.out.println("all "+search.isEngineAll());
		//System.out.println("daum "+search.isEngineDaum());
		//System.out.println("naver "+search.isEngineNaver());
		//가짜데이터
		//search.setEngineAll(true);//전체(네이버+다음)
		//search.setOrderState(0);//정확도 ->설정했는딩
		//search.setCurrentPage(1);
		
		/////////////////////////////////////////////////
		
		Map returnMap = exploreService.getBlogExploreList(search); //-->total이랑 가져와서 밑에 page Set해줘야함
		
		Page page = new Page(search.getCurrentPage(),(int)returnMap.get("totalCount"),explorePageUnit,explorePageSize); //갔다와서 리턴에  total값 줘야함 ㅠ 
		
		//System.out.println(blogList);
		//System.out.println(blogList.size());
		
		//여기서 blogList의 사이즈를 구해야한다 size가 0이면 다른 jsp 로 return 한다.
		
		model.addAttribute("blogList", returnMap.get("blogList"));
		model.addAttribute("page", page);
		
		if(((List<Blog>)returnMap.get("blogList")).size()==0)
			return "explore/noSearchResultPage";
		else
			return "explore/listBlogExplore";
	}
	
	@RequestMapping("getCafeList")
	public String getCafeExploreList(@ModelAttribute Search search, Model model) throws Exception
	{
		System.out.println("/explore/getCafeExploreList 실행");
		
		if(search.getSearchKeyword()==null) { //URL 치고 들어오는경우 1.검색어
			search.setSearchKeyword("");
		}
		if(search.getSearchTheme()==0) { //검색종류 블로그 이 컨트롤러 탔으면 일단 무조건 1이지
			search.setSearchTheme(2);
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
		
		search.setPageSize(explorePageSize);
		
		
		//가짜데이터
		//search.setEngineAll(true);//전체(네이버+다음+피닉스)
		//search.setOrderState(0);//정확도
		//search.setCurrentPage(1);
		//search.setPageSize(5);
		/////////////////////////////////////////////////
		
		Map returnMap = exploreService.getCafeExploreList(search);
		
		Page page = new Page(search.getCurrentPage(),(int)returnMap.get("totalCount"),explorePageUnit,explorePageSize); //갔다와서 리턴에  total값 줘야함 ㅠ 
		
		model.addAttribute("cafeList", returnMap.get("cafeList"));
		
		if(((List<CafeExplore>)returnMap.get("cafeList")).size()==0)
			return "explore/noSearchResultPage";
		else
			return "explore/listCafeExplore";
	}
	
	@RequestMapping("getWebsiteList")
	public String getWebsiteExploreList(@ModelAttribute Search search, Model model) throws Exception
	{
		System.out.println("/explore/getWebsiteList 실행");
		
		if(search.getSearchKeyword()==null)
			search.setSearchKeyword("");
		if(search.getSearchTheme()==0)
			search.setSearchTheme(4);
		
		//가짜데이터
		search.setEngineAll(true);//전체(네이버+다음+피닉스)
		search.setOrderState(0);//정확도
		search.setCurrentPage(1);
		search.setPageSize(5);
		/////////////////////////////////////////////////
		
		List<WebExplore> websiteList = exploreService.getWebsiteExploreList(search);
		
		
		model.addAttribute("webList", websiteList);
		
		if(websiteList.size()==0)
			return "explore/noSearchResultPage";
		else
			return "explore/listWebsiteExplore";
	}
	
	@RequestMapping("getImageList")
	public String getImageExploreList(@ModelAttribute Search search, Model model) throws Exception
	{
		System.out.println("/explore/getImageList");
		
		if(search.getSearchKeyword()==null)
			search.setSearchKeyword("");
		if(search.getSearchTheme()==0)
			search.setSearchTheme(3);
		
		//가짜데이터
		search.setEngineAll(true);//전체(네이버+다음+피닉스)
		search.setOrderState(0);//정확도
		search.setCurrentPage(1);
		search.setPageSize(5);
		/////////////////////////////////////////////////
		
		
		List<Image> imageList = exploreService.getImageExploreList(search);
		
		model.addAttribute("imageList", imageList);
		if(imageList.size()==0)
			return "explore/noSearchResultPage";
		else
			return "explore/listImageExplore";
	}
	
	@RequestMapping("test")
	public String a()
	{
		return "cafe/accessDenied";
		//return "cafe/memberBlock";
	}
	
}
