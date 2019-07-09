package com.phoenix.mvc.web.cafe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CafePostContoller {
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
		
		return "cafesearch";
	}
	
	@PostMapping("/cafe/{cafeURL}/")
	public String getBoard(@PathVariable String cafeURL) {
		
		return "listCafePostByBoard";
	}
}
