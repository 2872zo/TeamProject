package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserService;
import com.phoenix.mvc.common.Search;

@Controller
@RequestMapping("/cafe/*")
public class CafeTabContoller {

	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;

	public CafeTabContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

///////////////////////////////준호시작///////////////////////////////////////	
	@GetMapping("/addCafeView")
	public String addCafeView(@ModelAttribute("cafe") Cafe cafe) throws Exception {

		System.out.println("/addCafe : GET");

		return "cafe/addCafeView";
	}

	@PostMapping("/addCafe") 
	public String addCafe(@ModelAttribute Cafe cafe, Model model, HttpSession session) throws Exception {
		  

		  User user = (User) session.getAttribute("user");

		  cafe.setManageUserNo(user.getUserNo());

		  System.out.println("유저정보도 왔냐 ?@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+user.getUserNo());		  
	
		  cafeTabService.addCafe(cafe);

		  Cafe cafe2 = cafeManageService.getCafeInfo(cafe.getCafeNo());

		  cafe = cafe2;

		  System.out.println("카페인서트다다아아아앙@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + cafe);

		  model.addAttribute("cafe", cafe);
		
		  model.addAttribute("cafeURL", cafe.getCafeURL());
		
		  System.out.println("카페유알엘@@@@"+cafe.getCafeURL());

		  return "redirect:/cafe/"+cafe.getCafeURL();
	}

///////////////////////////////준호끝///////////////////////////////////////		

///////////////////////////////// 기황 시작//////////////////////////////////////
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String cafeMain(HttpSession session, Model model) throws Exception {

		System.out.println("/cafe/main GET");
		User user = new User();
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		}
		Search search = new Search();
		search.setUserNo(user.getUserNo());// 유저번호세팅
		search.setStatus(0);// 활동중 카페선택 세팅
		search.setCafeType(0);// 카테고리0번 고르게 세팅

		Map map = cafeTabService.getCafeHome(search);
		List myCafelist = (List) map.get("myCafelist");
		List categorizedCafeList = (List) map.get("categorizedCafeList");

		model.addAttribute("search", search);
		model.addAttribute("myCafelist", myCafelist);
		model.addAttribute("categorizedCafeList", categorizedCafeList);

		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}

	@RequestMapping(value = "main", method = RequestMethod.POST)
	public String cafeMainPost(@ModelAttribute Search search, Model model) throws Exception {

		System.out.println("/cafe/main POST");

		Map map = cafeTabService.getCafeHome(search);
		List myCafelist = (List) map.get("myCafelist");
		List categorizedCafeList = (List) map.get("categorizedCafeList");

		model.addAttribute("search", search);
		model.addAttribute("myCafelist", myCafelist);
		model.addAttribute("categorizedCafeList", categorizedCafeList);

		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}

	@RequestMapping("main/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("/cafe/main/search입니다.");

		pageSize = 3;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = cafeTabService.searchCafe(search);
		List cafeList = (List) map.get("cafeList");
		List postList = (List) map.get("postList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("postList", postList);
		model.addAttribute("search", search);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("page", page);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}

	@RequestMapping("main/cafeApplicationList")
	public String getCafeApplicationList(HttpSession session, Model model) throws Exception {

		pageSize = 2;
		User user = (User) session.getAttribute("user");
		Search search = new Search();
		search.setUserNo(user.getUserNo());
		Map map = cafeTabService.getCafeApplicationListForUser(search);

		List applicationList = (List) map.get("applicationList");
		int totalCount = (int) map.get("totalCount");

		model.addAttribute("applicationList", applicationList);
		model.addAttribute("totalCount", totalCount);

		return "forward:/WEB-INF/views/cafe/listUserCafeApplication.jsp";

	}

	@RequestMapping("main/cafeNewsFeed")
	public String getCafeNewsFeed(@SessionAttribute("user") User user, Model model) throws Exception {

		Map map = cafeTabService.getNewsFeed(user.getUserNo());
		List newsFeed = (List) map.get("newsFeed");
		model.addAttribute("newsFeed", newsFeed);
		return "cafe/listCafeNewsFeed";

	}

	/*
	 * 테스트용 메서드입니다.
	 * 
	 * @RequestMapping("main/testing") public String onlyForTest(@ModelAttribute
	 * CafeMember cafeMember) throws Exception {
	 * 
	 * System.out.println("들어왔니?????");
	 * 
	 * List<CafeMember> list = cafeMember.getCafeMemberList(); for(int i=0;i<6;i++)
	 * { System.out.println(list.get(i)); } return "cafe/listCafeNewsFeed"; }
	 */

///////////////////////////////// 기황 끝//////////////////////////////////////

////////////////////////////////////////////// 예림시작
////////////////////////////////////////////// ////////////////////////////////////////////////
//@RequestMapping("/{cafeURL}")
	public String getCafeMain(@PathVariable String cafeURL, HttpSession session, Model model) throws Exception {
		System.out.println("/cafe/{cafeURL}");

		// 승규 getBoardPostList Service 불러오면 안되잖아. 그럼 바로 dao부르나?? 내가 메서드를 만들어야겠네.
		User user = new User();

		if (session.getAttribute("user") == null) // session에 있으면
		{
			System.out.println("user 없음");
		}
		else
		{
			System.out.println("user있음");
			user= (User) session.getAttribute("user");
		}
		
// set해주고 service태워서 service에서 회원인지 아닌지 검사

// 가짜데이터
		//user.setUserNo(10000);
		Map map = cafeTabService.getCafeMain(user, cafeURL);
		System.out.println("엥");
		System.out.println("cafecafecafECAFE!!!!!"+map.get("cafe"));
		
		model.addAttribute("cafe", map.get("cafe"));
		model.addAttribute("cafeURL", map.get("cafeURL"));
		model.addAttribute("noticePostList", map.get("noticePostList"));// 공지게시글리스트
		model.addAttribute("cafeMember", map.get("cafeMember"));// 내정보
		model.addAttribute("boardList", map.get("boardList"));// 카페게시판리스트
		model.addAttribute("cafeApplication",map.get("cafeApplication"));//가입신청

		return "cafe/mainCafe";
	}
//////////////////////////////////////////////////// 예림
//////////////////////////////////////////////////// 끝//////////////////////////////////////////////
}
