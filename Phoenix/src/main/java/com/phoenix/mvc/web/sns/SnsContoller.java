package com.phoenix.mvc.web.sns;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.TimeLine;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.sns.SnsService;

@RequestMapping("/sns/*")
@Controller
public class SnsContoller {

	@Autowired
	@Qualifier("snsServiceImpl")
	private SnsService snsService;

	public SnsContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@GetMapping(value = "/getTimeLine")
	public String getTimeLine(Model model, @ModelAttribute("search") Search search, HttpServletRequest request) {

		System.out.println("sns/getTimeLine");
		
		User user = (User) request.getSession().getAttribute("user");
		search.setUserNo(user.getUserNo());
		
		List accountList = snsService.getSnsAccount(search);
		
		System.out.println(accountList);
		
		for(int i = 0; i<accountList.size(); i++) {
			Account account =(Account) accountList.get(i);
			if(account.getAccountType().equals("ua109")) {
				search.setIgId(account.getAccountId());
				search.setIgPw(account.getAccountPw());
			}else if(account.getAccountType().equals("ua110")) {
				search.setFbId(account.getAccountId());
				search.setFbPw(account.getAccountPw());
				
			}
			
		}
		
		System.out.println("fb: "+search.getFbId());
		System.out.println("ig: "+search.getIgId());
		
		Map<String, Object> fbMap = snsService.getFaceBookTimeLineList(search);
		Map<String, Object> igMap = snsService.getInstaTimeLineList(search);
		System.out.println("fbMap이욤 : "+fbMap);
		System.out.println("igMap이욤 : "+igMap);
		
		model.addAttribute("faceTimeLine", fbMap.get("timeLine"));
		model.addAttribute("faceSearch", fbMap.get("search"));
		model.addAttribute("instaTimeLine", igMap.get("timeLine"));
		model.addAttribute("instaSearch", igMap.get("search"));
		
		System.out.println("model이욤: "+model);
	

		return "sns/getTimeLine";

	}

}
