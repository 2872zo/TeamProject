package com.phoenix.mvc.web.cafe;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;

@Controller
@RequestMapping("/cafe/*")
@PropertySource("common.properties")
public class CafeManageController {

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;


	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;

	public CafeManageController() {
		System.out.println(this.getClass().getName() + "생성자 start");
	}

	@Value("${uploadPath}")
	String uploadPath;
	@Value("${uploadPath2}")
	String uploadPath2;
	@Value("${uploadPath3}")
	String uploadPath3;

	/////////////////////////////// 기황시작//////////////////////////////////
	@RequestMapping(value = "/{cafeURL}/manage/getCafeMemberList")
	public String getCafeMemberList(@PathVariable String cafeURL, @ModelAttribute("search") Search search, Model model)
			throws Exception {

		System.out.println("/cafe/{cafeURL}/getCafeMemberList : URL == " + cafeURL);

		search.setCafeURL(cafeURL);
		pageSize = 2;
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = cafeManageService.getCafeMemberList(search);
		List memberList = (List) map.get("memberList");
		List gradeList = (List) map.get("gradeList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
		model.addAttribute("memberList", memberList);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		model.addAttribute("cafeURL", cafeURL);

		return "cafe/listCafeMember";
	}

	@RequestMapping(value = "/{cafeURL}/manage/getCafeMember", method = RequestMethod.POST)
	public String getCafeMember(@ModelAttribute("search") Search search, Model model, @PathVariable String cafeURL)
			throws Exception {

		Map map = cafeManageService.getCafeMemberBlocks(search);

		CafeMember member = (CafeMember) map.get("member");
		List blocks = (List) map.get("blocks");
		List cafeGrades = (List) map.get("cafeGrades");

		model.addAttribute("member", member);
		model.addAttribute("blocks", blocks);
		model.addAttribute("cafeGrades", cafeGrades);
		model.addAttribute("cafeURL", cafeURL);

		return "forward:/WEB-INF/views/cafe/getCafeMember.jsp";
	}

	@PostMapping(value = "/{cafeURL}/manage/addMemberBlock")
	public String addMemberBlock(@ModelAttribute("member") CafeMember cafeMember, Model model,
			@PathVariable String cafeURL) throws Exception {

		System.out.println("/{cafeURL}/manage/addMemberBlock");

		cafeManageService.addCafeMemberBlock(cafeMember);
		Search search = new Search();

		search.setMemberNo(cafeMember.getMemberNo());
		search.setCafeNo(cafeMember.getCafeNo());

		model.addAttribute("search", search);
		model.addAttribute("cafeURL", cafeURL);

		return "forward:/cafe/" + cafeURL + "/manage/getCafeMember";

	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeMemberBlock", method = RequestMethod.POST)
	public String updateCafeMemberBlock(@ModelAttribute CafeMemberBlock cafeMemberBlock, Model model,
			@PathVariable String cafeURL) throws Exception {

		cafeManageService.updateCafeMemberBlock(cafeMemberBlock);
		Search search = new Search();
		search.setCafeNo(cafeMemberBlock.getCafeNo());
		search.setMemberNo(cafeMemberBlock.getMemberNo());
		model.addAttribute("search", search);
		model.addAttribute("cafeURL", cafeURL);

		return "forward:/cafe/" + cafeURL + "/manage/getCafeMember";
	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeMemberGrade", method = RequestMethod.POST)
	public String updateCafeMemberGrade(@ModelAttribute CafeMember cafeMember, Model model,
			@PathVariable String cafeURL) throws Exception {

		cafeManageService.updateCafeMemeberGrade(cafeMember);
		Search search = new Search();
		search.setMemberNo(cafeMember.getMemberNo());
		search.setCafeNo(cafeMember.getCafeNo());
		model.addAttribute("search", search);
		model.addAttribute("cafeURL", cafeURL);
		return "forward:/cafe/" + cafeURL + "/manage/getCafeMember";

	}

	///////////////////////////////// 기황끝//////////////////////////////////////
////////////////////////////////////////////예림//////////////////////////////////////////////
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeBoardView") // 예림예림
	public String updateCafeBoardView(@PathVariable String cafeURL, HttpSession session, Model model)// session user정보,
//카페번호
	{
		System.out.println("/{cafeURL}/manage/updateCafeBoardView");
//session 으로 1.로그인되어있는지 2.카페에 가입되어있는지 3.cafeURL의 카페매니저인지 확인
		System.out.println("cafeURL : " + cafeURL);

		Search search = new Search();
		search.setCafeURL(cafeURL);
		List boardList = cafeManageService.getCafeBoardList(search);
		List<CafeGrade> useGradeList = cafeManageService.getCafeGrade(cafeURL);

//일단은 담는데,
		model.addAttribute("boardList", boardList);
		model.addAttribute("useGradeList", useGradeList);
		model.addAttribute("cafeURL", cafeURL);
//모델에 cafeURL의 cafe 객체도 같이 넘겨줌

		//return "/cafe/menuTest";
		return "/cafe/updateCafeBoard";
	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeBoard", method = RequestMethod.POST) // 예림예림
	public String updateCafeBoard(HttpServletRequest request, @PathVariable String cafeURL) {

		//System.out.println(request.getParameter("board")); 첫번째값만 받아옴
		List<Board> existBoard = new ArrayList<Board>();
		List<Board> newBoard = new ArrayList<Board>();

		String[] boards = request.getParameterValues("board");
		//int a = request.getParameterValues("board").length;
		int boardIndex = 1;

		String[] grades = request.getParameterValues("grade"); //등급
		//System.out.println("grades!!"+grades.length);//구분선빼고 다나옴
		
		String[] bestLikeCount = request.getParameterValues("bestLikeCount");
		String[] bestTerm = request.getParameterValues("bestTerm");
		String[] bestPostCount = request.getParameterValues("bestPostCount");

		for (int i = 0; i < boards.length; i++) // board selectbox
		{
			System.out.println(boards[i]); // 파싱해서 / 있는애들은 board넘버.. update여러개, newBoard인애들은 add
			//가져와서 앞에가 ----인애들은 update 안해줌
			Board board = new Board();
			board.setCafeURL(cafeURL);
			board.setBoardIndex(boardIndex); // 순서이동해도 option순서대로 오나
			boardIndex++;

			if (boards[i].contains("/")) // "/"이 들어있는애==즉 기존 있던애들 (newBoard가 아님)
			{
				board.setBoardNo(Integer.parseInt(boards[i].split("/")[1]));
				existBoard.add(board); // existBoardList에 넣어준다.
			} else // 새로운애들 (newBoard)
			{
//newBoard123에서 d로 split 해서 뒤에 number를 set해준다.
				board.setBoardNo(Integer.parseInt(boards[i].split("d")[1]));// 최선의 방법일까?
				newBoard.add(board); // 얘는 newBoardList에 넣어준다.

			}
		}

		for (int i = 0; i < grades.length; i++) // 접근권한설정
		{
			System.out.println("grade" + grades[i]);
			String[] gradeValue = grades[i].split("/");

			if (gradeValue[1].contains("new"))// 새로만들어진애일때
			{
				for (int j = 0; j < newBoard.size(); j++) {
					if (newBoard.get(j).getBoardNo() == Integer.parseInt(gradeValue[1].split("w")[1])) {
						newBoard.get(j).setAccessGrade(gradeValue[0]);
					}
				}
			} else// 원래있던애일때
			{
				for (int j = 0; j < existBoard.size(); j++) {
					if (existBoard.get(j).getBoardNo() == Integer.parseInt(gradeValue[1])) {
						existBoard.get(j).setAccessGrade(gradeValue[0]);
					}
				}
			}
		}
		
		for (int i = 0; i < bestPostCount.length; i++) // 베스트게시글개수 설정
		{
			String[] bestPostCountValue = bestPostCount[i].split("/");
			String[] bestLikeCountValue = bestLikeCount[i].split("/");
			String[] bestTermValue = bestTerm[i].split("/");

			if (bestPostCountValue[1].contains("new"))// bestPostCountValue 새로만들어진애일때
			{
				for (int j = 0; j < newBoard.size(); j++) {
					if (newBoard.get(j).getBoardNo() == Integer.parseInt(bestPostCountValue[1].split("w")[1])) {
						newBoard.get(j).setBestPostCount(Integer.parseInt(bestPostCountValue[0]));
					}
					
				}
			} 
			else// 원래있던애일때
			{
				for (int j = 0; j < existBoard.size(); j++) {
					if (existBoard.get(j).getBoardNo() == Integer.parseInt(bestPostCountValue[1])) {
						existBoard.get(j).setBestPostCount(Integer.parseInt(bestPostCountValue[0]));
					}
				}
			}
			
			if (bestLikeCountValue[1].contains("new"))// bestLikeCountValue새로만들어진애일때
			{
				for (int j = 0; j < newBoard.size(); j++) {
					if (newBoard.get(j).getBoardNo() == Integer.parseInt(bestLikeCountValue[1].split("w")[1])) {
						newBoard.get(j).setBestLikeCount(Integer.parseInt(bestLikeCountValue[0]));
					}
					
				}
			} 
			else// 원래있던애일때
			{
				for (int j = 0; j < existBoard.size(); j++) {
					if (existBoard.get(j).getBoardNo() == Integer.parseInt(bestLikeCountValue[1])) {
						existBoard.get(j).setBestLikeCount(Integer.parseInt(bestLikeCountValue[0]));
					}
				}
			}
			
			if (bestTermValue[1].contains("new"))// 새로만들어진애일때
			{
				for (int j = 0; j < newBoard.size(); j++) {
					if (newBoard.get(j).getBoardNo() == Integer.parseInt(bestTermValue[1].split("w")[1])) {
						newBoard.get(j).setBestTerm(bestTermValue[0].charAt(0));
					}
					
				}
			} 
			else// 원래있던애일때
			{
				for (int j = 0; j < existBoard.size(); j++) {
					if (existBoard.get(j).getBoardNo() == Integer.parseInt(bestTermValue[1])) {
						existBoard.get(j).setBestTerm(bestTermValue[0].charAt(0));
					}
				}
			}
			
			
			
			
		}
		
		

//일단 따로따로 담는다/
		Enumeration<String> e = request.getParameterNames();
		while (e.hasMoreElements()) // 다른 element
		{

			String element = e.nextElement();
			System.out.println(element);
			if (element.contains("boardName/")) // 이면 원래있던애들
			{
//존재 보드 리스트 포문돌아서 있는애한테 value값 set
//element.split("/")[1]
				for (int i = 0; i < existBoard.size(); i++) {
					if (existBoard.get(i).getBoardNo() == Integer.parseInt(element.split("/")[1]))// 기존애 boardNo랑같으면
					{
						existBoard.get(i).setBoardName(request.getParameter(element)); // Board이름 set
					}
				}

			} else if (element.contains("boardDetail/")) // 원래있던애들
			{
				for (int i = 0; i < existBoard.size(); i++) {
					if (existBoard.get(i).getBoardNo() == Integer.parseInt(element.split("/")[1]))// 기존애 boardNo랑같으면
					{
						existBoard.get(i).setBoardDetail(request.getParameter(element)); // Board이름 set
					}
				}
			} else if (element.contains("boardPrivate/")) {
				for (int i = 0; i < existBoard.size(); i++) {
					if (existBoard.get(i).getBoardNo() == Integer.parseInt(element.split("/")[1])) {
						existBoard.get(i).setPrivateFlag(request.getParameter(element).charAt(0));
					}
				}

			} else if (element.contains("newBoardDetail")) // 새로 생긴애
			{
				for (int i = 0; i < newBoard.size(); i++) {
					if (newBoard.get(i).getBoardNo() == Integer.parseInt(element.split("l")[1])) {
						newBoard.get(i).setBoardDetail(request.getParameter(element));
					}
				}
			} else if (element.contains("newBoardPrivate")) {
				for (int i = 0; i < newBoard.size(); i++) {
					if (newBoard.get(i).getBoardNo() == Integer.parseInt(element.split("e")[2])) {
						newBoard.get(i).setPrivateFlag(request.getParameter(element).charAt(0));
					}
				}

			} else if (element.contains("newBoard")) // 새로생긴애 newBoardName
			{
//element.split("e")[2]
				for (int i = 0; i < newBoard.size(); i++) {
					if (newBoard.get(i).getBoardNo() == Integer.parseInt(element.split("d")[1])) {
						newBoard.get(i).setBoardName(request.getParameter(element));
					}
				}
			}

		}

		System.out.println("newBoard : " + newBoard);
		System.out.println("existBoard : " + existBoard); // 다 잘담겼는데 구분선은 boardDetail,boardName이 null이다.

		if (existBoard.size() > 0) { // 뭐 항상 0보다 크겠지
			boolean updateCafeResult = cafeManageService.updateCafeBoard(existBoard);
		}

		if (newBoard.size() > 0) // newBoard가 있다면
		{
			boolean addCafeResult = cafeManageService.addCafeBoard(newBoard);
		}

		return "forward:/cafe/" + cafeURL + "/manage/updateCafeBoardView";
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

		Map cafeStatistics = cafeManageService.getCafeStatistics(event, cafeURL);

		List<Map<String, String>> chartResult = (List<Map<String, String>>) cafeStatistics.get("chartResult");
//-------------------------------------------------------------------위로 보낼 데이터
		List<String> dates = new ArrayList<String>();
		dates.add(0, dTime); // 오늘

		Calendar cal = Calendar.getInstance();
		cal.setTime(currentTime);

		for (int i = 0; i < 9; i++) {
			cal.add(Calendar.DATE, -1);
			dates.add(formatter.format(cal.getTime()));
		}

		Collections.reverse(dates); // list 역순
		model.addAttribute("chartResult", chartResult);
		model.addAttribute("statisticMap", cafeStatistics); // 네모칸결과
		model.addAttribute("dates", dates); // chart기준Dates
		model.addAttribute("cafeURL", cafeURL);

		return "cafe/statisticsCafe";
		//return "cafe/test";
	}

	@RequestMapping(value = "/{cafeURL}/addCafeReportView")
	public String addCafeReportView(@ModelAttribute Search search, Model model) throws Exception {
		System.out.println("/addCafeReportView");

		return "cafe/addCafeReport";
	}

//	@RequestMapping(value = "/test")
//	public String test() throws Exception {
//		
//
//		return "cafe/test";
//	}
//////////////////////////////////////예림끝////////////////////////////////////////////

///////////////////////////////// 지니//////////////////////////////

	@RequestMapping(value = "/{cafeURL}/manage/getCafeApplicationList")
	public String getCafeApplicationList(@ModelAttribute("search") Search search, Model model) {

		System.out.println("/{cafeURL}/manage/getCafeApplicationList : GET/POST");
		
		System.out.println(search);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = cafeManageService.getCafeApplicationList(search);

		Page resutlPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("resultPage 는 ? " + resutlPage);
		System.out.println("search 값 확인 : " + search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("page", resutlPage);
		model.addAttribute("search", search);
		model.addAttribute("cafeURL", search.getCafeURL());

		return "/cafe/listCafeApplication";
	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeApplication", method = RequestMethod.POST)
	public String updateCafeApplication(@ModelAttribute("search") Search search) {

		System.out.println("/{cafeURL}/manage/updateCafeApplication : POST");
		System.out.println(search);

		System.out.println(search.getBoardName());

		int applicationNo;
		String cafeApplication = search.getBoardName();

		if (cafeApplication.contains("true")) {// 상세조회에서 승인할때

			applicationNo = (Integer.parseInt(cafeApplication.substring(4, 9))); // true4,no5
			CafeApplication cafe = cafeManageService.getCafeApplication2(applicationNo);
			cafe.setAcceptStatusCode("ca101");
			cafeManageService.updateAcceptStatusCode(cafe);

			CafeMember member = new CafeMember();
			member.setCafeNo(cafe.getCafeNo());
			member.setUserNo(cafe.getUserNo());
			member.setMemberNickname(cafe.getMemberNickname());
			cafeMemberService.addCafeMember(member);

		} else if (cafeApplication.contains("false")) {// 상세조회에서 거절할때

			applicationNo = (Integer.parseInt(cafeApplication.substring(5, 10)));// false5,no10
			CafeApplication cafe = cafeManageService.getCafeApplication2(applicationNo);
			cafe.setAcceptStatusCode("ca102");
			cafeManageService.updateAcceptStatusCode(cafe);

		} else {// 리스트에서 승인, 거절할때

			String split[] = cafeApplication.split(",");
			String result[];
			int count = split.length;
			String start = split[0];

			List<String> nickName = new ArrayList<String>();
			List<Integer> userNo = new ArrayList<Integer>();
			List<Integer> cafeNo = new ArrayList<Integer>();
			List<Integer> appNo = new ArrayList<Integer>();

			System.out.println("true는 승인,false는 거절  " + start.contains("&"));

			if (start.contains("&")) {
//멤버닉네임,userNo,cafeNo,applicationNo 받아오기
				for (int i = 0; i < split.length; i++) {
					System.out.println("값 몇개인지부터 확인: " + split.length);
					System.out.println("split" + split[i]);
					result = split[i].split("&");
					nickName.add(result[0]);
					userNo.add(Integer.parseInt(result[1]));
					cafeNo.add(Integer.parseInt(result[2]));
					appNo.add(Integer.parseInt(result[3]));
				}

//가입승인으로 cafeApplication 코드 업데이트, 카페멤버에 멤버추가

				for (int i = 0; i < count; i++) {
					System.out.println(appNo.get(i));
					CafeApplication cafe = cafeManageService.getCafeApplication2(appNo.get(i));

					System.out.println(cafe);
					cafe.setAcceptStatusCode("ca101");
					cafeManageService.updateAcceptStatusCode(cafe);

					CafeMember member = new CafeMember();
					member.setCafeNo(cafeNo.get(i));
					member.setUserNo(userNo.get(i));
					member.setMemberNickname(nickName.get(i));
					cafeMemberService.addCafeMember(member);

				}

			} else {
//가입거절로 cafeApplication 코드 업데이트
				for (int i = 0; i < count; i++) {
					applicationNo = (Integer.parseInt(split[i]));
					System.out.println("여기 값?" + applicationNo);
					CafeApplication cafe = cafeManageService.getCafeApplication2(applicationNo);
					cafe.setAcceptStatusCode("ca102");
					cafeManageService.updateAcceptStatusCode(cafe);
				}

			}

		}

		return "redirect:/cafe/" + search.getCafeURL() + "/manage/getCafeApplicationList";// 카페주소 변경!!cafeNo로 url가져오기 추가
	}

	@RequestMapping(value = "/{cafeURL}/manage/getCafeApplication", method = RequestMethod.GET)
	public String getCafeApplication(@RequestParam("applicationNo") int applicationNo, Model model,
			@PathVariable String cafeURL) {

		System.out.println("/{cafeURL}/manage/getCafeApplication : GET");

		System.out.println(applicationNo);

		CafeApplication cafeApplication = cafeManageService.getCafeApplication2(applicationNo);
		cafeApplication.setCafeIcon(cafeURL);// 카페url 넘겨주는 용도!

		model.addAttribute("cafeApplication", cafeApplication);
		model.addAttribute("cafeURL", cafeURL);

		return "cafe/getCafeApplication";

	}

	@GetMapping(value = "/{cafeURL}/manage/dropCafeView")
	public String dropCafeView(@PathVariable String cafeURL, Model model) throws Exception {// 매니저유저넘버 추가

		System.out.println("/{cafeURL}/manage/dropCafeView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		model.addAttribute("cafe", cafe);
		model.addAttribute("cafeURL", cafeURL);

		return "cafe/dropCafe";

	}

	@PostMapping(value = "/{cafeURL}/manage/dropCafe")
	public String dropCafe(@PathVariable String cafeURL, @ModelAttribute("Cafe") Cafe cafe) {

		System.out.println("/{cafeURL}/manage/dropCafe : POST");

		System.out.println(cafe);

		cafe.setClosedFlag(true);// 카페폐쇄
		cafeManageService.dropCafe(cafe, cafeURL);

		return "cafe/cafeHomeMain";
	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeGradeView", method = RequestMethod.GET)
	public String updateCafeGradeView(@PathVariable String cafeURL, Model model) {

		System.out.println("/{cafeURL}/manage/updateCafeGradeView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);

		List cafeGrade = cafeManageService.checkCafeGrade(cafeNo);

		model.addAttribute("cafeGradeList", cafeGrade);
		model.addAttribute("cafeURL", cafeURL);
		
			return "cafe/updateCafeGrade";

	}

	@PostMapping(value = "/{cafeURL}/manage/updateCafeGrade")
	public String updateCafeGrade(@ModelAttribute("CafeGrade") CafeGrade grades, @RequestParam("CafeNo") int cafeNo) {

		System.out.println("/{cafeURL}/manage/updateCafeGrade : POST");
		System.out.println(cafeNo);
		System.out.println(grades);

		CafeMember cafeMember = new CafeMember();

		int size = grades.getGradeList().size();
		System.out.println(size);

		for (int i = size - 1; i >= 0; i--) {

			CafeGrade info = grades.getGradeList().get(i);

			if (i == 0) {// 멤버1은 이름만 바꿈
				System.out.println("i값이 0일때만 여기 들어와줘" + i);

				info.setAutoUpgradeFlag(true);
				info.setGradeFlag(true);
				cafeManageService.updateCafeGrade(info);

			} else if (i != 0) {// 일단 모든값 다 업데이트

				System.out.println("i값 확인 " + i);

				cafeManageService.updateCafeGrade(info);

				if (!info.isGradeFlag() && i != 0) {// 업데이트후 등급을 삭제한 경우에는 해당 멤버 등급 내리기
					System.out.println("i값?" + i);
					int gradeNo = info.getCafeGradeNo();
					int changeNo = (gradeNo - 1);

					cafeMember.setCafeMemberGradeNo(gradeNo);
					cafeMember.setChangeGradeNo(changeNo);

					System.out.println("변하기전" + cafeMember);
					cafeMemberService.changeGradeNo(cafeMember);
					System.out.println("변하기후" + cafeMember);

					System.out.println("전 info값! " + info);

					if (info.getMemberGradeCode().equals("cg106")) {// 삭제한 등급값 초기화!
						info.setGradeName("우수");
					} else if (info.getMemberGradeCode().equals("cg105")) {
						info.setGradeName("열심");
					} else if (info.getMemberGradeCode().equals("cg104")) {
						info.setGradeName("성실");
					} else if (info.getMemberGradeCode().equals("cg103")) {
						info.setGradeName("일반");
					}

					info.setRequiredPostCount(0);// 등업조건도 다 0처리, 자동등업도 막기
					info.setRequiredReplyCount(0);
					info.setRequiredVisitCount(0);
					info.setAutoUpgradeFlag(false);

					cafeManageService.updateCafeGrade(info);
					System.out.println("후 info값! " + info);

				}

			}

		}

		return "redirect:/cafe/no1cafe/manage/updateCafeGradeView"; // cafeURL 수정

	}

////////////////////////////////지니끝//////////////////////////////////
/////////////////////////////// 준호시작///////////////////////////////////////
//준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeInfoView", method = RequestMethod.GET)
	public String updateCafeInfoView(@PathVariable String cafeURL, Model model) throws Exception {

		System.out.println("/updateCafeInfoView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		model.addAttribute("cafe", cafe);
		model.addAttribute("cafeURL", cafe.getCafeURL());

		return "cafe/updateCafeInfoView";
	}

//준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeInfo", method = RequestMethod.POST)
	public String updateCafeInfo(@ModelAttribute Cafe cafe, Model model,
			@RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("uploadFile2") MultipartFile uploadFile2,
			@RequestParam("uploadFile3") MultipartFile uploadFile3) throws Exception {

		System.out.println("/updateCafeInfoView : POST");

		String fileName = uploadFile.getOriginalFilename()
				.substring(uploadFile.getOriginalFilename().lastIndexOf("\\") + 1);

		File f = new File(uploadPath, fileName);
		System.out.println("파일업로드하자~~~~~~~~~~~~~~~~~~" + fileName);

		try {
			uploadFile.transferTo(f);
		} catch (IOException e) {
			e.printStackTrace();
		}

		cafe.setBannerImg(fileName);
		System.out.println("파일명좀 알려줘~11111111111"+fileName);
		String fileName2 = uploadFile2.getOriginalFilename()
				.substring(uploadFile2.getOriginalFilename().lastIndexOf("\\") + 1);

		File f2 = new File(uploadPath2, fileName2);
		System.out.println("파일업로드하자~~~~~~~~~~~~~~~~~~" + fileName2);

		try {
			uploadFile2.transferTo(f2);
		} catch (IOException e) {
			e.printStackTrace();
		}

		cafe.setMainImg(fileName2);
		System.out.println("파일명좀 알려줘22222222222~"+fileName2);
		String fileName3 = uploadFile3.getOriginalFilename()
				.substring(uploadFile3.getOriginalFilename().lastIndexOf("\\") + 1);

		File f3 = new File(uploadPath3, fileName3);
		System.out.println("파일업로드하자~~~~~~~~~~~~~~~~~~" + fileName3);

		try {
			uploadFile3.transferTo(f3);
		} catch (IOException e) {
			e.printStackTrace();
		}

		cafe.setCafeIcon(fileName3);
		
		System.out.println("파일명좀 알려줘~"+fileName3);

		cafeManageService.updateCafeInfo(cafe);

		Cafe cafe2 = cafeManageService.getCafeInfo(cafe.getCafeNo());

		cafe = cafe2;
		
		System.out.println("카페2좀 찍어줘");
		System.out.println(cafe2);
		
		model.addAttribute("cafeURL", cafe.getCafeURL());
		model.addAttribute("cafe",cafe2);
		return "cafe/updateCafeInfoView";
	}

// 준호
	@RequestMapping(value = "/{cafeURL}/manage/getCafeInfo", method = RequestMethod.POST)
	public String getCafeInfo(@PathVariable String cafeURL, Model model) throws Exception {

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		System.out.println("카페정보들오니" + cafe);

		model.addAttribute("cafe", cafe);

		model.addAttribute("cafeURL", cafe.getCafeURL());

		return "cafe/getCafeInfo";

	}

//준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeApplicationForm", method = RequestMethod.GET)
	public String updateCafeApplicationFormView(@PathVariable String cafeURL, Model model) throws Exception {

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);

		System.out.println(cafeNo + "카페번호뭐냐");

		System.out.println("/updateCafeApplicationFormView : GET");

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		model.addAttribute("cafe", cafe);
		model.addAttribute("cafeURL", cafe.getCafeURL());

		System.out.println(cafe + "카페도메인찍자");

		return "cafe/updateCafeApplicationForm";
	}

//준호
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeApplicationForm", method = RequestMethod.POST)
	public String updateCafeApplicationForm(@ModelAttribute("cafe") Cafe cafe, Model model) throws Exception {

		System.out.println("/updateCafeApplicationFormView : POST");

		cafeManageService.updateCafeApplicationForm(cafe);

		model.addAttribute("cafeURL", cafe.getCafeURL());

		return "cafe/updateCafeApplicationForm";
	}
/////////////////////////////// 준호끝///////////////////////////////////////

}
