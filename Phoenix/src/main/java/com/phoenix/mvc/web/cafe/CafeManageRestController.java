package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.service.cafe.CafeManageService;

@RestController
@RequestMapping("/cafe/*")
public class CafeManageRestController {

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;
	
	public CafeManageRestController() {
		System.out.println(this.getClass().getName()+"생성자 start");
	}
	
	@RequestMapping(value = "json/{cafeURL}/checkCafePost", method = RequestMethod.POST )
	public void updateCafeBoardView( @PathVariable String cafeURL , HttpSession session
			, @RequestBody String jsonQuery)//session user정보, 카페번호
	{
		System.out.println("/{cafeURL}/checkCafePost : POST");
		//session 으로  1.로그인되어있는지 2.카페에 가입되어있는지 3.cafeURL의 카페매니저인지 확인
		System.out.println("cafeURL : "+cafeURL);
		System.out.println("넘어온데이터 : "+jsonQuery);
		
		JSONObject jsonobj = (JSONObject) JSONValue.parse(jsonQuery);
		int boardNo = (int) jsonobj.get("boardNo");
		
		cafeManageService.checkCafePost(cafeURL,boardNo);
		
		//return ;
	}

}
