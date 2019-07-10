package com.phoenix.mvc.web.cafe;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;

@Controller
@RequestMapping("/cafe/*")
public class CafeMemberController {

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	public CafeMemberController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.GET)
	public String addCafeApplication(@PathVariable String cafeURL) {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : GET");

		return "cafe/addCafeApplicationView";

	}

	@RequestMapping(value = "/{cafeURL}/addCafeApplication", method = RequestMethod.POST)
	public String addCafeApplication(@PathVariable String cafeURL,
			@ModelAttribute("cafeApplication") CafeApplication cafeApplication) {

		System.out.println("/cafe/{cafeURL}/addCafeApplication : POST");

		cafeApplication.setUserNo("10001");
		cafeApplication.setCafeNo("10000");
		System.out.println("들어온 cafeApplication 값?" + cafeApplication);
		cafeMemberService.addCafeApplication(cafeApplication);

		return "cafe/{cafeURL}/main";//메인으로 이동!

	}

	@RequestMapping(value = "/{cafeURL}/updateCafeMemberView", method = RequestMethod.GET)
	public String updateCafeMember(@PathVariable String cafeURL) {

		System.out.println("/cafe/{cafeURL}/updateCafeMemberView : GET");

		return "cafe/updateCafeMember";

	}
	
	@RequestMapping(value = "/{cafeURL}/updateCafeMember", method = RequestMethod.GET)
	public String updateCafeMember(@PathVariable String cafeURL, @RequestParam("memberStatusCode") String memberStatusCode,
			HttpSession session) {

		System.out.println("/cafe/{cafeURL}/updateCafeMember : GET");
		
		//세션 memberNo가져오기!
		//memberNo으로 getMember member 가져오기
		CafeMember cafeMember = new CafeMember();
		cafeMember.setMemberNo("10001");
		cafeMember.setCafeNo("10000");
		cafeMember.setUserNo("10001");
		cafeMember.setNoticeFlag('0');
		cafeMember.setMemberNickname("멤버1");
		cafeMember.setCafeMemberGradeNo("10002");
		cafeMember.setFavoriteFlag('0');
		cafeMember.setRegDate(null);
		cafeMember.setVisitCount("1");
		cafeMember.setMemberStatusCode(memberStatusCode);
		
		System.out.println("cafemember 값 : "+cafeMember);
		cafeMemberService.updateCafeMember(cafeMember);

		return "cafe/{cafeURL}/main";//메인으로 이동!

	}

}
