package com.phoenix.mvc.web.cafe;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;

@RestController
public class CafePostRestContoller {
	@Value("${pageSize}")
	private int pageSize;
	
	@Value("${pageUnit}")
	private int pageUnit;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;
	
//	@Autowired
//	@Qualifier("cafeManageServiceImpl")
//	private CafeManageService cafeManageService;
//	
//	@Autowired
//	@Qualifier("cafeMemberServiceImpl")
//	private CafeMemberService cafeMemberService;

	public CafePostRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping("/cafe/{cafeURL}/json/addLike")
	public Map<String, Object> addLike(@RequestBody Search search) {
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + search);
		return cafePostService.addLike(search);
	}
	

	@PostMapping("/cafe/{cafeURL}/json/updateNoticeOrder")
	public boolean updateNoticeOrder(@RequestBody Map<String, Object> reqMap) {
		System.out.println("[updateNoticeOrderView] reqMap : " + reqMap);
		
		return cafePostService.updateNoticeOrder(reqMap);
	}
}
