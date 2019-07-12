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
@PropertySource("common.properties")
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

	@GetMapping("/cafe/{cafeURL}/json/getReplyList")
	public Map<String, Object> getReplyList(@PathVariable String cafeURL, @ModelAttribute Search search){
		search.setPostNo(10000);
		search.setPageSize(pageSize);
		search.setCurrentPage(1);
		
		Map<String, Object> queryResultMap = cafePostService.getReplyList(search);
		queryResultMap.put("page", new Page(search.getCurrentPage(), (int)queryResultMap.get("replyTotalCount"), pageUnit, pageSize));
				
		return queryResultMap;
	}
}
