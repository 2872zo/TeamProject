package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Post;

@Controller
public class CafePostContoller {
	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;
	
	public CafePostContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@GetMapping("/cafe/{cafeURL}")
	public String CafeMain(@PathVariable String cafeURL) {
		System.out.println("CafeMain : " + cafeURL);
		
		return "cafe/menubar_temp";
	}
	
	@PostMapping("/cafe/{cafeURL}/search")
	public String CafeInnerSearchList(@RequestParam String keyword, @PathVariable String cafeURL) {
		System.out.println("CafeInnerSearch : " + cafeURL);
		System.out.println(keyword);
		
		return "cafe/listCafeInnerSearch";
	}
	
	@RequestMapping("/cafe/{cafeURL}/getBoard/{boardNo}")
	public String getBoard(Map<String, String> result, @ModelAttribute Search search, Map<String, Object> map) {
		System.out.println("Search : " + search);
		

		
		List<Post> postList = cafePostService.getBoard(search);
//		System.out.println("postList : " + postList);
		
		map.put("postList", postList);
		
		return "cafe/listCafePostByBoard";
	}
}
