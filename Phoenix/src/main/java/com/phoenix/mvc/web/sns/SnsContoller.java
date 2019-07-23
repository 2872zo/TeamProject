package com.phoenix.mvc.web.sns;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.mvc.service.domain.FaceBook;
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
	@GetMapping(value="getTimeLine")
	public String getTimeLine(Model model, @ModelAttribute("faceBook") FaceBook faceBook ) {
		
		
		FaceBook fb = (FaceBook) snsService.getFaceBookTimeLineList(faceBook);
		
		model.addAttribute("fb", fb);
		
		System.out.println(model);
		
		return null;
		
	}
	
	
	
	
	
}
