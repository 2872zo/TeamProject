package com.phoenix.mvc.web.cafe;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeManageService;

@Controller
@RequestMapping("/cafe/*")
public class CafeManageController {

	
	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;
	
	public CafeManageController() {
		System.out.println(this.getClass().getName()+"생성자 start");
	}

	@RequestMapping(value = "/{cafeURL}/updateCafeBoardView", method = RequestMethod.GET )
	public String updateCafeBoardView( @PathVariable String cafeURL , HttpSession session, Model model)//session user정보, 카페번호
	{
		System.out.println("/{cafeURL}/updateCafeBoardView : GET");
		//session 으로  1.로그인되어있는지 2.cafeURL의 카페매니저인지 확인
		
		List boardList = cafeManageService.getCafeBoard(cafeURL);
		
		model.addAttribute("boardList", boardList);
		
		return "updateCafeBoard";
	}
	
	@RequestMapping(value = "/{cafeURL}/updateCafeBoard", method = RequestMethod.POST)
	public String updateCafeBoard()
	{
		
		return "";// 다시 updateCafeBoardView 호출하고 싶은데.
	}
	
}
