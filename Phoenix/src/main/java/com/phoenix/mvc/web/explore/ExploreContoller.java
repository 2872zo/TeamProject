package com.phoenix.mvc.web.explore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		if(search.getSearchKeyword()==null) //URL 치고 들어오는경우
			search.setSearchKeyword("");
		if(search.getSearchTheme()==0)
			search.setSearchTheme(1);
		
		//가짜데이터
		search.setEngineAll(true);//전체(네이버+다음)
		search.setOrderState(0);//정확도
		search.setCurrentPage(1);
		search.setPageSize(5);
		/////////////////////////////////////////////////
		
		List<Blog> blogList = exploreService.getBlogExploreList(search);
		
		System.out.println(blogList);
		System.out.println(blogList.size());
		
		//여기서 blogList의 사이즈를 구해야한다 size가 0이면 다른 jsp 로 return 한다.
		
		model.addAttribute("blogList", blogList);
		
		if(blogList.size()==0)
			return "explore/noSearchResultPage";
		else
			return "explore/listBlogExplore";
	}
	
	@RequestMapping("getCafeList")
	public String getCafeExploreList(@ModelAttribute Search search, Model model) throws Exception
	{
		System.out.println("/explore/getCafeExploreList 실행");
		
		if(search.getSearchKeyword()==null)
			search.setSearchKeyword("");
		if(search.getSearchTheme()==0)
			search.setSearchTheme(2);
		
		
		//가짜데이터
		search.setEngineAll(true);//전체(네이버+다음+피닉스)
		search.setOrderState(0);//정확도
		search.setCurrentPage(1);
		search.setPageSize(5);
		/////////////////////////////////////////////////
		
		List<CafeExplore> cafeList = exploreService.getCafeExploreList(search);
		
		model.addAttribute("cafeList", cafeList);
		
		if(cafeList.size()==0)
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
