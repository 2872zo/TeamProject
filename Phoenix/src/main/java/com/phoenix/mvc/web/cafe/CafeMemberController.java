package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.GET)
	public String addCafeApplication(@PathVariable String cafeURL, Model model) throws Exception {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : GET");
		System.out.println(cafeURL);

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);
		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		System.out.println(cafe);

		model.addAttribute("cafe", cafe);

		return "cafe/addCafeApplicationView";

	}

	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.POST)
	public String addCafeApplication(@RequestParam("cafeNo") int cafeNo,
			@ModelAttribute("cafeApplication") CafeApplication cafeApplication) throws Exception {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : POST");

		// userNo 값 추가해야함!!!!!!!!!!!!!!!!!
		cafeApplication.setUserNo(10012);
		// System.out.println(cafeNo);
		// System.out.println("들어온 cafeApplication 값?" + cafeApplication);

		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		// System.out.println(cafe);

		if (cafe.isAutoApplicationAcceptFlag()) {// 자동가입승인 ca104, 카페멤버 추가
			cafeApplication.setAcceptStatusCode("ca104");
			cafeManageService.updateAcceptStatusCode(cafeApplication);

			CafeMember member = new CafeMember();
			member.setCafeNo(cafeApplication.getCafeNo());
			member.setUserNo(cafeApplication.getUserNo());
			member.setCafeMemberGradeNo(10015);// 나중에 수정해조!!!!!!!!!!!
			member.setMemberNickname(cafeApplication.getMemberNickname());
			cafeMemberService.addCafeMember(member);

		} else {// 자동가입승인X
			cafeApplication.setQuestion1(cafe.getApplicationQuestion1());
			cafeApplication.setQuestion2(cafe.getApplicationQuestion2());
			cafeApplication.setQuestion3(cafe.getApplicationQuestion3());
			cafeMemberService.addCafeApplication(cafeApplication);
		}

		return "cafe/{cafeURL}/main";// 메인으로 이동!

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMemberView", method = RequestMethod.GET)
	public String updateCafeMember(@PathVariable String cafeURL, Model model) throws Exception {

		System.out.println("/cafe/{cafeURL}/updateCafeMemberView : GET");

		int cafeNo = cafeMemberService.getCafeNo(cafeURL);
		Cafe cafe = cafeManageService.getCafeInfo(cafeNo);

		System.out.println(cafe);

		model.addAttribute("cafe", cafe);

		return "cafe/updateCafeMember";

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMember", method = RequestMethod.GET)
	public String updateCafeMember(@RequestParam("cafeNo") int cafeNo) {

		System.out.println("/cafe/{cafeURL}/updateCafeMember : GET");
		// System.out.println(cafeNo);

		CafeMember cafeMember = cafeMemberService.getCafeMember(cafeNo, 10011);
		cafeMember.setMemberStatusCode("cs103");
		System.out.println(cafeMember);

		cafeMemberService.updateCafeMember(cafeMember);

		return "cafe/{cafeURL}/home";// 메인으로 이동!

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMemberProfileView", method = RequestMethod.GET)
	public String updateCafeMemberProfileView(@RequestParam("memberNo") int memberNo, @PathVariable String cafeURL,
			Model model) throws Exception {

		System.out.println("/cafe/{cafeURL}/updateCafeMemberProfileView : GET");
		System.out.println(cafeURL);

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

		return null;//메인으로 이동

	}
	//////////////////////////////// 지니끝//////////////////////////////////

	///////////////////////////////// 기황시작//////////////////////////////////////
	@RequestMapping(value = "/{cafeURL}/manage/getCafeMemberList")
	public String getCafeMemberList(@PathVariable String cafeURL, @ModelAttribute("search") Search search, Model model)
			throws Exception {

		System.out.println("/cafe/{cafeURL}/getCafeMemberList : URL == "+cafeURL);
		pageSize = 2;
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = cafeMemberService.getCafeMemberList(search);
		List memberList = (List) map.get("memberList");

		System.out.println(memberList);

		int totalCount = (int) map.get("totalCount");
		Page page = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);

		model.addAttribute("memberList", memberList);
		model.addAttribute("search", search);
		model.addAttribute("page", page);

		return "cafe/listCafeMember";
	}

	@RequestMapping(value = "/{cafeURL}/manage/getCafeMember", method = RequestMethod.POST)
	public String getCafeMember(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/cafe/{cafeURL}/manage/getCafeMember : GET");
		CafeMember cafeMember = cafeMemberService.getCafeMember(search);
		model.addAttribute("member", cafeMember);

		return "forward:/WEB-INF/views/cafe/getCafeMember.jsp";
	}
	
	@RequestMapping(value = "/{cafeURL}/manage/addMemberBlock", method = RequestMethod.POST)
	public String addMemberBlock(@ModelAttribute("member") CafeMember cafeMember, Model model, @PathVariable String cafeURL) throws Exception {
		
		System.out.println("/{cafeURL}/manage/addMemberBlock");
		cafeMemberService.addCafeMemberBlock(cafeMember);
		Search search = new Search();
		search.setMemberNo(cafeMember.getMemberNo());
		return "forward:/cafe/"+cafeURL+"/manage/getCafeMemberBlock";
		
	}
	
	@RequestMapping(value = "/{cafeURL}/manage/getCafeMemberBlock", method = RequestMethod.POST)
	public String getCafeMemberBlock(@ModelAttribute Search search, Model model, @PathVariable String cafeURL) throws Exception {
		
		Map map = cafeMemberService.getCafeMemberBlocks(search);
		CafeMember member = (CafeMember) map.get("member");
		List blocks = (List) map.get("blocks");
		model.addAttribute("member", member);
		model.addAttribute("blocks", blocks);

		return "forward:/WEB-INF/views/cafe/getCafeMember.jsp";		
	}
	
	@RequestMapping(value = "/{cafeURL}/manage/updateCafeMemberBlock", method = RequestMethod.POST)
	public String updateCafeMemberBlock(@ModelAttribute CafeMemberBlock cafeMemberBlock, Model model, @PathVariable String cafeURL) throws Exception {
		

		return "forward:/WEB-INF/views/cafe/getCafeMember.jsp";		
	}
	///////////////////////////////// 기황끝//////////////////////////////////////

}
