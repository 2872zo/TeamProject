package com.phoenix.mvc.web.cafe;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Grades;

@Controller
@RequestMapping("/cafe/*")
public class CafeManageController {

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	public CafeManageController() {
		System.out.println(this.getClass().getName() + "생성자 start");
	}

////////////////////////////////////////////예림//////////////////////////////////////////////
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeBoardView", method = RequestMethod.GET) // 예림예림
	public String updateCafeBoardView(@PathVariable String cafeURL, HttpSession session, Model model)// session user정보,
// 카페번호
	{
		System.out.println("/{cafeURL}/manage/updateCafeBoardView : GET");
//session 으로 1.로그인되어있는지 2.카페에 가입되어있는지 3.cafeURL의 카페매니저인지 확인
		System.out.println("cafeURL : " + cafeURL);

		Search search = new Search();
		search.setCafeURL(cafeURL);
		List boardList = cafeManageService.getCafeBoard(search);

		model.addAttribute("boardList", boardList);

//모델에 cafeURL의 cafe 객체도 같이 넘겨줌

		return "/cafe/updateCafeBoard";
	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeBoard", method = RequestMethod.POST) // 예림예림
	public String updateCafeBoard() {

		return "";// 다시 updateCafeBoardView 호출하고 싶은데.
	}

	@RequestMapping(value = "/{cafeURL}/manage/getCafeStatistics") // 예림예림 여기는 처음에만 들어온다.
	public String getCafeStatistics(@PathVariable String cafeURL, Model model)// 카페no랑 , 시작날, 끝날 받아오기
	{
		System.out.println("/cafe/{CafeURL}/manage/getCafeStatistics");

//modelAttribute는 SpringMVC가 default생성자를 불러서 인스턴스를 생성하는것이기 때문에 null값이 올수 없다.

//가짜데이터
		Event event = new Event();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		Date currentTime = new Date();
		String dTime = formatter.format(currentTime);
		System.out.println(dTime);

		event.setStartDate(dTime);
		event.setEndDate(dTime);

		Map<String, String> cafeStatistics = cafeManageService.getCafeStatistics(event, cafeURL);

		model.addAttribute("statisticMap", cafeStatistics);

		return "cafe/statisticsCafe";
	}

//////////////////////////////////////예림
//////////////////////////////////////끝////////////////////////////////////////////
///////////////////////////////// 지니//////////////////////////////

	@RequestMapping(value = "/{cafeURL}/manage/getCafeApplicationList")
	public String getCafeApplicationList(@ModelAttribute("search") Search search, Model model) {
		int pageUnit = 5;
		int pageSize = 5;
		System.out.println("/{cafeURL}/manage/getCafeApplicationList : GET/POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(5);// 일단 5로 설정

		Map<String, Object> map = cafeManageService.getCafeApplicationList(search);

		Page resutlPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("resultPage 는 ? " + resutlPage);
		System.out.println("search 값 확인 : " + search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("page", resutlPage);
		model.addAttribute("search", search);

		return "/cafe/listCafeApplication";

	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeApplication", method = RequestMethod.POST)
	public String updateCafeApplication(@ModelAttribute("search") Search search) {

		System.out.println("/{cafeURL}/manage/updateCafeApplication : POST");
		System.out.println(search.getBoardName());

		int applicationNo;
		String cafeApplication = search.getBoardName();

		if (cafeApplication.contains("true")) {// 상세조회에서 승인할때

			applicationNo = (Integer.parseInt(cafeApplication.substring(4, 9))); // true4,no5
			CafeApplication cafe = cafeManageService.getCafeApplication2(applicationNo);
			cafe.setAcceptStatusCode("ca102");
			cafeManageService.updateAcceptStatusCode(cafe);

			CafeMember member = new CafeMember();
			member.setCafeNo(cafe.getCafeNo());
			member.setUserNo(cafe.getUserNo());
			member.setMemberNickname(cafe.getMemberNickname());
			member.setCafeMemberGradeNo(10006);// 이거 나중에 조인해서 추가해11
			cafeMemberService.addCafeMember(member);

		} else if (cafeApplication.contains("false")) {// 상세조회에서 거절할때

			applicationNo = (Integer.parseInt(cafeApplication.substring(5, 10)));// false5,no10
			CafeApplication cafe = cafeManageService.getCafeApplication2(applicationNo);
			cafe.setAcceptStatusCode("ca103");
			cafeManageService.updateAcceptStatusCode(cafe);

		} else {// 리스트에서 승인, 거절할때

			String split[] = cafeApplication.split(",");
			String result[];
			int count = split.length;
			String start = split[0];

			List<String> nickName = new ArrayList<String>();
			List<Integer> userNo = new ArrayList<Integer>();
			List<Integer> cafeNo = new ArrayList<Integer>();

			System.out.println("true는 승인,false는 거절  " + start.contains("&"));

			if (start.contains("&")) {
// 멤버닉네임,userNo,cafeNo 받아오기
				for (int i = 0; i < split.length; i++) {
					System.out.println("값 몇개인지부터 확인: " + split.length);
					System.out.println("split" + split[i]);
					result = split[i].split("&");
					nickName.add(result[0]);
					userNo.add(Integer.parseInt(result[1]));
					cafeNo.add(Integer.parseInt(result[2]));
				}

// 가입승인으로 cafeApplication 코드 업데이트, 카페멤버에 멤버추가
				/*
				////기황 수정userNo로 cafeApplication가져오는 부분이 
				//리스트로 바뀌면서 에러발생했습니다 지니님 추후 수정해주세요~
				for (int i = 0; i < count; i++) {
					System.out.println(userNo.get(i));
					CafeApplication cafe = cafeManageService.getCafeApplication(userNo.get(i));
					
					System.out.println(cafe);
					cafe.setAcceptStatusCode("ca102");
					cafeManageService.updateAcceptStatusCode(cafe);

					CafeMember member = new CafeMember();
					member.setCafeNo(cafeNo.get(i));
					member.setUserNo(userNo.get(i));
					member.setMemberNickname(nickName.get(i));
					member.setCafeMemberGradeNo(10006);// 이거 나중에 조인해서 추가해22
					cafeMemberService.addCafeMember(member);

				}
				*/

			} else {
// 가입거절로 cafeApplication 코드 업데이트
				for (int i = 0; i < count; i++) {
					applicationNo = (Integer.parseInt(split[i]));
					System.out.println("여기 값?" + applicationNo);
					CafeApplication cafe = cafeManageService.getCafeApplication2(applicationNo);
					cafe.setAcceptStatusCode("ca103");
					cafeManageService.updateAcceptStatusCode(cafe);
				}

			}

		}

		return "redirect:/cafe/1234/manage/getCafeApplicationList";// 카페주소 변경!!cafeNo로 url 가져오기 추가
	}

	@RequestMapping(value = "/{cafeURL}/manage/getCafeApplication", method = RequestMethod.GET)
	public String getCafeApplication(@RequestParam("applicationNo") int applicationNo, Model model) {

		System.out.println("/{cafeURL}/manage/getCafeApplication : GET");

		System.out.println(applicationNo);

		CafeApplication cafeApplication = cafeManageService.getCafeApplication2(applicationNo);

		model.addAttribute("cafeApplication", cafeApplication);

		return "cafe/getCafeApplication";

	}

	public String dropCafe() {
		return null;

	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeGradeView", method = RequestMethod.GET)
	public String updateCafeGradeView(@PathVariable String cafeURL, Model model) {

		System.out.println("/{cafeURL}/manage/updateCafeGradeView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);

		List cafeGrade = cafeManageService.checkCafeGrade(cafeNo);
		
		model.addAttribute("cafeGradeList", cafeGrade);

		return "cafe/updateCafeGrade";

	}
	@PostMapping(value="/{cafeURL}/manage/updateCafeGrade")
	public String updateCafeGrade(@ModelAttribute("Grades") Grades grades){
		
		System.out.println(grades);
		
		return null;
	}

//////////////////////////////// 지니끝//////////////////////////////////
	/////////////////////////////// 준호시작///////////////////////////////////////
	// 준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeInfoView", method = RequestMethod.GET)
	public String updateCafeInfoView(@RequestParam("cafeNo") int cafeNo, Model model) throws Exception {

		System.out.println("/updateCafeInfoView : GET");

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);
		// Model �� View ����
		model.addAttribute("cafe", cafe);

		return "cafe/updateCafeInfoView";
	}

	// 준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeInfo", method = RequestMethod.POST)
	public String updateCafeInfo(@ModelAttribute("cafe") Cafe cafe) throws Exception {

		System.out.println("/updateCafeInfoView : POST");

		cafeManageService.updateCafeInfo(cafe);

		Cafe cafe2 = cafeManageService.getCafeInfo(cafe.getCafeNo());

		cafe = cafe2;

		return "cafe/updateCafeInfo";
	}

	// 준호
	@RequestMapping(value = "/{cafeURL}/manage/getCafeInfo", method = RequestMethod.POST)
	public String getCafeInfo(@RequestParam("cafeNo") int cafeNo, Model model) throws Exception {

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		model.addAttribute("cafe", cafe);

		return "cafe/getCafeInfo";

	}

	// 준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeApplicationFormView", method = RequestMethod.GET)
	public String updateCafeApplicationFormView(@RequestParam("cafeNo") int cafeNo, Model model) throws Exception {

		System.out.println(cafeNo + "카페번호뭐냐");

		System.out.println("/updateCafeApplicationFormView : GET");

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);
		// Model �� View ����
		model.addAttribute("cafe", cafe);

		System.out.println(cafe + "카페도메인찍자");

		return "cafe/updateCafeApplicationFormView";
	}

	// 준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeApplicationForm", method = RequestMethod.POST)
	public String updateCafeApplicationForm(@ModelAttribute("cafe") Cafe cafe) throws Exception {

		System.out.println("/updateCafeApplicationFormView : POST");

		cafeManageService.updateCafeApplicationForm(cafe);

		return "cafe/updateCafeApplicationForm";
	}
	/////////////////////////////// 준호끝///////////////////////////////////////

}
