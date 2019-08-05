package com.phoenix.mvc.web.sns;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.TimeLine;
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
	public String getTimeLine(Model model, @ModelAttribute("search") Search search) {

		System.out.println("sns/getTimeLine");
		
		search.setFbId("wlsgml1416@naver.com");
		search.setFbPw("011!wlslgogo");
		
		search.setIgId("rlawlsgml1416");
		search.setIgPw("011!wlslgogo");
		
	//	search.setIgId("andaralamira");
	//	search.setIgPw("011wlslgogo");
		
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
