package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;
import com.phoenix.mvc.service.domain.User;

@Controller
@RequestMapping("/cafe/*")
public class CafeMemberController {

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;

	public CafeMemberController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	///////////////////////////////// 지니//////////////////////////////

	@RequestMapping(value = "/{cafeURL}/addCafeApplicationView", method = RequestMethod.GET)
	public String addCafeApplication(@PathVariable String cafeURL, Model model) throws Exception {

		System.out.println("/cafe/{cafeURL}/addCafeApplicationView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);
		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		model.addAttribute("cafe", cafe);

		return "cafe/addCafeApplicationView";

	}

	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.POST)
	public String addCafeApplication(@ModelAttribute("cafeApplication") CafeApplication cafeApplication,
			HttpServletRequest request) throws Exception {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : POST");

		System.out.println(cafeApplication);

		 //userNo 받아오깅
		 User user = (User) request.getSession().getAttribute("user");
		 int userNo = user.getUserNo();
		//int userNo = 10008;

		if (cafeApplication.isAutoApplicationAcceptFlag()) {// 자동가입승인 ca103, 카페멤버 추가
			cafeApplication.setUserNo(userNo);
			cafeManageService.updateAcceptStatusCode(cafeApplication);

			CafeMember member = new CafeMember();
			member.setUserNo(userNo);
			member.setCafeNo(cafeApplication.getCafeNo());
			member.setUserNo(cafeApplication.getUserNo());
			member.setMemberNickname(cafeApplication.getMemberNickname());
			member.setMemberNicknameFlag(cafeApplication.isMemberNicknameFlag());
			cafeMemberService.addCafeMember(member);

		} else {// 자동가입승인X
			cafeApplication.setUserNo(userNo);
			cafeMemberService.addCafeApplication(cafeApplication);
		}

		return "cafe/{cafeURL}/main";// 해당카페메인으로 이동!

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMember", method = RequestMethod.GET) // 카페탈퇴
	public String updateCafeMember(@ModelAttribute("Search") Search search, @RequestParam int memberNo)
			throws Exception {

		System.out.println("/cafe/{cafeURL}/updateCafeMember : GET");
		System.out.println(search);

		search.setMemberNo(memberNo);
		CafeMember cafeMember = cafeMemberService.getCafeMember(search);

		System.out.println(cafeMember);

		cafeMemberService.updateCafeMember(cafeMember);

		return "cafe/{cafeURL}/home";// 메인으로 이동!

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMemberProfileView", method = RequestMethod.GET)
	public String updateCafeMemberProfileView(@RequestParam("memberNo") int memberNo, @PathVariable String cafeURL,
			Model model) throws Exception {

		System.out.println("/cafe/{cafeURL}/updateCafeMemberProfileView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);// 카페 url으로 cafeNo 확인

		Search search = new Search();
		search.setCafeNo(cafeNo);
		search.setMemberNo(memberNo);
		search.setCafeURL(cafeURL);

		CafeMember cafeMember = cafeMemberService.getCafeMember(search);

		if (cafeMember.getMemberNo() == memberNo) {
			System.out.println("카페url=cafeNo, 해당 카페의 멤버인지 확인 완료!");
			model.addAttribute("cafeMember", cafeMember);
			model.addAttribute("search", search);
		}

		return "cafe/updateCafeMemberProfile";

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMemberProfile", method = RequestMethod.POST)
	public String updateCafeMemberProfile(@ModelAttribute("cafeMember") CafeMember cafeMember) {

		System.out.println("/cafe/{cafeURL}/updateCafeMemberProfile : POST");

		cafeMemberService.updateCafeMemberProfile(cafeMember);

		return null;// 메인으로 이동

	}
	//////////////////////////////// 지니끝//////////////////////////////////

	/////////////////////////////// 기황시작//////////////////////////////////
	@RequestMapping(value = "/{cafeURL}/manage/getCafeMemberList")
	public String getCafeMemberList(@PathVariable String cafeURL, @ModelAttribute("search") Search search, Model model)
			throws Exception {

		System.out.println("/cafe/{cafeURL}/getCafeMemberList : URL == " + cafeURL);
		pageSize = 2;
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = cafeMemberService.getCafeMemberList(search);
		List memberList = (List) map.get("memberList");
		List gradeList = (List) map.get("gradeList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);

		model.addAttribute("memberList", memberList);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("search", search);
		model.addAttribute("page", page);

		return "cafe/listCafeMember";
	}

	@RequestMapping(value = "/{cafeURL}/manage/getCafeMember", method = RequestMethod.POST)
	public String getCafeMember(@ModelAttribute("search") Search search, Model model) throws Exception {

		Map map = cafeMemberService.getCafeMemberBlocks(search);

		CafeMember member = (CafeMember) map.get("member");
		List blocks = (List) map.get("blocks");
		List cafeGrades = (List) map.get("cafeGrades");

		model.addAttribute("member", member);
		model.addAttribute("blocks", blocks);
		model.addAttribute("cafeGrades", cafeGrades);

		return "forward:/WEB-INF/views/cafe/getCafeMember.jsp";
	}

	@PostMapping(value = "/{cafeURL}/manage/addMemberBlock")
	public String addMemberBlock(@ModelAttribute("member") CafeMember cafeMember, Model model,
			@PathVariable String cafeURL) throws Exception {

		System.out.println("/{cafeURL}/manage/addMemberBlock");

		cafeMemberService.addCafeMemberBlock(cafeMember);
		Search search = new Search();

		search.setMemberNo(cafeMember.getMemberNo());
		search.setCafeNo(cafeMember.getCafeNo());

		model.addAttribute("search", search);

		return "forward:/cafe/" + cafeURL + "/manage/getCafeMember";

	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeMemberBlock", method = RequestMethod.POST)
	public String updateCafeMemberBlock(@ModelAttribute CafeMemberBlock cafeMemberBlock, Model model,
			@PathVariable String cafeURL) throws Exception {

		cafeMemberService.updateCafeMemberBlock(cafeMemberBlock);
		Search search = new Search();
		search.setCafeNo(cafeMemberBlock.getCafeNo());
		search.setMemberNo(cafeMemberBlock.getMemberNo());
		model.addAttribute("search", search);

		return "forward:/cafe/" + cafeURL + "/manage/getCafeMember";
	}

	@RequestMapping(value = "/{cafeURL}/manage/updateCafeMemberGrade", method = RequestMethod.POST)
	public String updateCafeMemberGrade(@ModelAttribute CafeMember cafeMember, Model model,
			@PathVariable String cafeURL) throws Exception {

		cafeMemberService.updateCafeMemeberGrade(cafeMember);
		Search search = new Search();
		search.setMemberNo(cafeMember.getMemberNo());
		search.setCafeNo(cafeMember.getCafeNo());
		model.addAttribute("search", search);
		return "forward:/cafe/" + cafeURL + "/manage/getCafeMember";

	}
	///////////////////////////////// 기황끝//////////////////////////////////////

}
