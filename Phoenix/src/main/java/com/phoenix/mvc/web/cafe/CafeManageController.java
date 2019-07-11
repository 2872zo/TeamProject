package com.phoenix.mvc.web.cafe;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeApplication;

@Controller
@RequestMapping("/cafe/*")
public class CafeManageController {

	
	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;
	
	public CafeManageController() {
		System.out.println(this.getClass().getName()+"생성자 start");
	}

	
	////////////////////////////////////////////예림//////////////////////////////////////////////
	@RequestMapping(value = "/{cafeURL}/updateCafeBoardView", method = RequestMethod.GET )//예림예림
	public String updateCafeBoardView( @PathVariable String cafeURL , HttpSession session, Model model)//session user정보, 카페번호
	{
		System.out.println("/{cafeURL}/updateCafeBoardView : GET");
		//session 으로  1.로그인되어있는지 2.카페에 가입되어있는지 3.cafeURL의 카페매니저인지 확인
		System.out.println("cafeURL : "+cafeURL);
		
		List boardList = cafeManageService.getCafeBoard(cafeURL);
		
		model.addAttribute("boardList", boardList);
		
		//모델에 cafeURL의 cafe 객체도 같이 넘겨줌
		
		return "/cafe/updateCafeBoard";
	}
	
	@RequestMapping(value = "/{cafeURL}/updateCafeBoard", method = RequestMethod.POST)//예림예림
	public String updateCafeBoard()
	{
		
		return "";// 다시 updateCafeBoardView 호출하고 싶은데.
	}
	
	

	@RequestMapping(value="/cafe/{CafeURL}/getCafeStatistics") //예림예림
	public String getCafeStatistics(@ModelAttribute("event") Event event, @PathVariable String cafeURL,Model model)// 카페no랑 , 시작날, 끝날 받아오기
	{
		System.out.println("/cafe/{CafeURL}/getCafeStatistics");
		
		//modelAttribute는 SpringMVC가 default생성자를 불러서 인스턴스를 생성하는것이기 때문에 null값이 올수 없다.
		
		if(event.getStartDate()== null) // startDate endDate 하나만 null이어도 (= 통계섹션에 처음 들어왔을때)
		{
			Date today = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyymmdd");
			event.setStartDate(date.format(today));
		}
		
		List cafeStatistics = cafeManageService.getCafeStatistics(event,cafeURL); //얠 map으로 받는걸로 할까.
		
		model.addAttribute("list", cafeStatistics); //일단데려가~~~ list를 파악해야겠지만
		
		return "cafe/statisticsCafe";
	}
	
	
	//////////////////////////////////////예림 끝////////////////////////////////////////////
	
	

	/////////////////////////////////지니//////////////////////////////
	
	@RequestMapping(value = "/{cafeURL}/manage/getCafeApplicationList")
	public String getCafeApplicationList(@ModelAttribute("search") Search search, Model model) {
		int pageUnit = 5;
		int pageSize = 5;
		System.out.println("/{cafeURL}/manage/getCafeApplicationList : GET/POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(5);//일단 5로 설정
		
		Map<String, Object> map = cafeManageService.getCafeApplicationList(search);
		
		Page resutlPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage 는 ? " +resutlPage);
		System.out.println("search 값 확인 : "+search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("page", resutlPage);
		model.addAttribute("search", search);
		
		return "/cafe/listCafeApplication";
		
	}
	
	@RequestMapping(value="/{cafeURL}/manage/updateCafeApplication", method=RequestMethod.POST)
	public String updateCafeApplication(@RequestBody String application) {
		
		System.out.println("/{cafeURL}/manage/updateCafeApplication : POST");
		System.out.println("엥??");
		System.out.println(application);
		
		JSONObject obj = (JSONObject) JSONValue.parse(application);
		String cafeApplication = (String)obj.get("application");
		
		//System.out.println("뽑은 : "+ cafeApplication);
		
		String split[]= cafeApplication.split(",");
		String result[];
		
		List nickName = new ArrayList<String>();
		List userNo = new ArrayList<String>();
		List cafeNo = new ArrayList<String>();
	
		int count = split.length;
		
		//멤버닉네임,userNo,cafeNo
		for(int i =0; i<split.length;i++) {
			System.out.println("값 몇개인지부터 확인: "+split.length);
			System.out.println("split"+split[i]);
			result= split[i].split("&");
				nickName.add(result[0]);
				userNo.add(result[1]);
				cafeNo.add(result[2]);
			}
			
		System.out.println(userNo);
		for(int i = 0; i<count; i++) {
			
			System.out.println(userNo.get(i));
			//CafeApplication cafe =cafeManageService.getCafeApplication((Integer) userNo.get(i));
			//System.out.println(cafe);
		}
		
		System.out.println(nickName);
		System.out.println(userNo);
		System.out.println(cafeNo);
		
		
		
		//System.out.println(cafe);
		
		//ca102
		return null;
		
	}
	////////////////////////////////지니끝//////////////////////////////////
	
	
	///////////////////////////////준호시작///////////////////////////////////////
	//준호
	@RequestMapping(value= "/cafe/updateCafeInfoView", method=RequestMethod.GET)
	public String updateCafeInfoView(@RequestParam("cafeNo") String cafeNo, Model model)throws Exception{
		
		System.out.println("/updateCafeInfoView : GET");
		
		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);
		// Model �� View ����
		model.addAttribute("cafe", cafe);
		
		return "cafe/updateCafeInfoView";
	}
	//준호
	@RequestMapping(value= "/cafe/updateCafeInfo", method=RequestMethod.POST)
	public String updateCafeInfo(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/updateCafeInfoView : POST");
		
		cafeManageService.updateCafeInfo(cafe);
		
		return "cafe/updateCafeInfo";
	}
	//준호
	@RequestMapping(value= "/cafe/getCafeInfo", method=RequestMethod.POST)
	public String getCafeInfo(@RequestParam("cafeNo") String cafeNo, Model model)throws Exception{
		
		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);
		
		model.addAttribute("cafe",cafe);
		
		return "cafe/getCafeInfo";
		
	}
	
	//준호
	@RequestMapping(value= "/cafe/updateCafeApplicationFormView", method=RequestMethod.GET)
	public String updateCafeApplicationFormView(@RequestParam("cafeNo") String cafeNo, Model model)throws Exception{
		
		
		System.out.println(cafeNo+"카페번호뭐냐");
		
		System.out.println("/updateCafeApplicationFormView : GET");
		
		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);
		// Model �� View ����
		model.addAttribute("cafe", cafe);
		
		System.out.println(cafe+"카페도메인찍자");
		
		return "cafe/updateCafeApplicationFormView";
	}
	
	//준호
	@RequestMapping(value= "/cafe/updateCafeApplicationForm", method=RequestMethod.POST)
	public String updateCafeApplicationForm(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/updateCafeApplicationFormView : POST");
		
		cafeManageService.updateCafeApplicationForm(cafe);
		
		return "cafe/updateCafeApplicationForm";
	}
	///////////////////////////////준호끝///////////////////////////////////////		
	
}