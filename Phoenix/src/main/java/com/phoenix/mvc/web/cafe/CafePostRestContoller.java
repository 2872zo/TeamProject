package com.phoenix.mvc.web.cafe;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostService;

@RestController
public class CafePostRestContoller {
	@Value("${pageSize}")
	private int pageSize;
	
	@Value("${pageUnit}")
	private int pageUnit;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;
	
	public CafePostRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("/cafe/{cafeURL}/json/addLike")
	public Map<String, Object> addLike(@RequestBody Search search) {
		return cafePostService.addLike(search);
	}
	

	@PostMapping("/cafe/{cafeURL}/json/updateNoticeOrder")
	public boolean updateNoticeOrder(@RequestBody Map<String, Object> reqMap) {
		System.out.println("[updateNoticeOrderView] reqMap : " + reqMap);
		return cafePostService.updateNoticeOrder(reqMap);
	}
}
