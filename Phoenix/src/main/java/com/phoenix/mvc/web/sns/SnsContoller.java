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
		
		search.setFbId("wlsgml1416@nvaer.com");
		search.setFbPw("011!wlslgogo");
		
		Map<String, Object> map = snsService.getFaceBookTimeLineList(search);
		
		System.out.println("map이욤 : "+map);
		
		model.addAttribute("timeLine", map.get("timeLine"));
		model.addAttribute("count", map.get("count"));
		model.addAttribute("search", map.get("search"));
		
		System.out.println("model이욤: "+model);
	

		return "sns/getTimeLine";

	}

}
