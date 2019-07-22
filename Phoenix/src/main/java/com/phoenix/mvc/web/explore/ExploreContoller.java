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
		
		List<Blog> blogList = exploreService.getBlogExploreList(search);
		
		
		model.addAttribute("blogList", blogList);
		return "explore/listUnifiedExplore";
	}
	
	@RequestMapping("getBlogList")
	public String getBlogExploreList(@ModelAttribute Search search, Model model)
	{
		System.out.println("/explore/getBlogExploreList 실행");
		
		return "explore/listBlogExplore";
	}
	
	@RequestMapping("getCafeList")
	public String getCafeExploreList()
	{
		System.out.println("/explore/getCafeExploreList 실행");
		
		return "explore/listCafeExplore";
	}
	
	
}
