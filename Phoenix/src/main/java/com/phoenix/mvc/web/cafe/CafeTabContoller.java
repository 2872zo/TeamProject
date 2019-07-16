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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.service.domain.User;
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

	
	@Value("${pageSize}")
	private int pageSize;
	
	@Value("${pageUnit}")
	private int pageUnit;
	
	public CafeTabContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	///////////////////////////////준호시작///////////////////////////////////////	
	@GetMapping("/addCafeView")
	public String addCafeView(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/addCafe : GET");
		
		
		
		return "cafe/addCafeView";
	}
	
	@PostMapping("/{cafeURL}/addCafe")
	public String addCafe(@ModelAttribute Cafe cafe, Model model)throws Exception{
		
		System.out.println("/addCafe : POST");

		cafeTabService.addCafe(cafe);
		
		Cafe cafe2 = cafeManageService.getCafeInfo(cafe.getCafeNo());
		
		cafe = cafe2;
					
		System.out.println("카페인서트다다아아아앙@@@"+cafe);
		
		model.addAttribute("cafe", cafe);
		
		return "cafe/getCafeInfo";
	}
	
	
	
	///////////////////////////////준호끝///////////////////////////////////////		
	
	/////////////////////////////////기황 시작//////////////////////////////////////
	@RequestMapping(value = "main", method=RequestMethod.GET)
	public String cafeMain(Model model) throws Exception {
		
		System.out.println("/cafe/main GET");
		
		Search search = new Search();
		search.setUserNo(10000);//유저번호세팅
		search.setStatus(0);//활동중 카페선택 세팅
		search.setBoardNo(0);//카테고리0번 고르게 세팅
		
		Map map = cafeTabService.getCafeHome(search);
		List myCafelist = (List) map.get("myCafelist");
		List categorizedCafeList = (List) map.get("categorizedCafeList");
		
		model.addAttribute("search", search);
		model.addAttribute("myCafelist", myCafelist);
		model.addAttribute("categorizedCafeList", categorizedCafeList);
		
		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}
	
	@RequestMapping(value = "main", method=RequestMethod.POST)
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
	
	@RequestMapping("/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {
	
		System.out.println("/cafe/search입니다.");
		
		pageSize=2;

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = cafeTabService.searchCafe(search);
		List cafeList = (List) map.get("cafeList");
		List postList = (List) map.get("postList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("postList", postList);
		model.addAttribute("search", search);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("page", page);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
	
	@RequestMapping("main/cafeApplicationList")
	public String getCafeApplicationList(Model model) throws Exception {
		
		pageSize = 2;
		Search search = new Search();
		search.setUserNo(10009);
		Map map = cafeTabService.getCafeApplicationListForUser(search);
		
		List applicationList = (List) map.get("applicationList");
		int totalCount = (int) map.get("totalCount");
		
		model.addAttribute("applicationList", applicationList);
		model.addAttribute("totalCount", totalCount);
		
		return "forward:/WEB-INF/views/cafe/listUserCafeApplication.jsp";
		
	}
		
	/////////////////////////////////기황 끝//////////////////////////////////////

	//////////////////////////////////////////////예림시작 ////////////////////////////////////////////////
	@RequestMapping("/{cafeURL}")
		public String getCafeMain(@PathVariable String cafeURL,HttpSession session,Model model)
		{
			System.out.println("/cafe/{cafeURL}");
			
			//승규 getBoardPostList Service 불러오면 안되잖아. 그럼 바로 dao부르나?? 내가 메서드를 만들어야겠네.
			User user = new User(); 
			
			if(session.getAttribute("user")!=null)  //session에 있으면
			{
				user = (User) session.getAttribute("user") ;
			}
				
			if(user.getUserNo()==0) //포탈로그인되어있지않음. 400
			{
				user.setUserNo(400);
			} 
			//set해주고 service태워서 service에서 회원인지 아닌지 검사
		
			//가짜데이터
			user.setUserNo(10000);
			Map map = cafeTabService.getCafeMain(user, cafeURL);
			
			model.addAttribute("cafeURL", map.get("cafeURL"));
			model.addAttribute("noticePostList", map.get("noticePostList"));//공지게시글리스트
			model.addAttribute("cafeMember", map.get("cafeMember"));//내정보
			model.addAttribute("boardList", map.get("boardList"));//카페게시판리스트
			
			return "cafe/mainCafe";
		}
	////////////////////////////////////////////////////예림 끝//////////////////////////////////////////////
}
