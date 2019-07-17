package com.phoenix.mvc.web.cafe;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.cache.CacheProperties.Caffeine;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;

@RestController
@RequestMapping("/cafe/*")
public class CafeManageRestController {

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	public CafeManageRestController() {
		System.out.println(this.getClass().getName() + "생성자 start");
	}

	///////////////////////////////////////////// 예림 시작////////////////////////////////////////////
	@RequestMapping(value = "json/{cafeURL}/checkCafePost", method = RequestMethod.POST)
	public Map checkCafePost(@PathVariable String cafeURL, HttpSession session, @RequestBody String jsonQuery)// session
																												// user정보,
																												// 카페번호
	{
		System.out.println("/{cafeURL}/checkCafePost : POST");
		// session 으로 1.로그인되어있는지 2.카페에 가입되어있는지 3.cafeURL의 카페매니저인지 확인

		System.out.println("cafeURL : " + cafeURL);
		System.out.println("넘어온데이터 : " + jsonQuery);

		JSONObject jsonobj = (JSONObject) JSONValue.parse(jsonQuery);
		String boardNo = (String) jsonobj.get("boardNo");

		Map map = new HashMap();

		boolean isPost = cafeManageService.checkCafePost(cafeURL, Integer.parseInt(boardNo));

		if (isPost)// true면
		{
			map.put("isPost", "true");

		} else {
			map.put("isPost", "false");
		}

		return map;
	}
	
	@RequestMapping(value="json/{cafeURL}/manage/getCafeStatistics", method= RequestMethod.POST) //예림예림 여기는 처음에만 들어온다.
	public Map getCafeStatistics(@RequestBody Event event, @PathVariable String cafeURL)// 카페no랑 , 시작날, 끝날 받아오기
	{
		System.out.println("json/cafe/{CafeURL}/manage/getCafeStatistics");
		
		
		//가짜데이터
		//event.setStartDate("20190709");
		//event.setEndDate("20190712");
		String date[] = event.getStartDate().split("/");
		String startDate = date[2]+date[0]+date[1];
		//System.out.println(startDate);
		date = event.getEndDate().split("/");
		String endDate = date[2]+date[0]+date[1];
		
		event.setStartDate(startDate);
		event.setEndDate(endDate);
		Map<String,String> cafeStatistics = cafeManageService.getCafeStatistics(event,cafeURL);
		
	
		if(cafeStatistics.get("et001")==null){
			cafeStatistics.put("et001", "0");
		}
		
		for(int i=4; i<8; i++) //프로퍼티즈 설정
		{
			if(cafeStatistics.get("et00"+i)==null)
				cafeStatistics.put("et00"+i, "0");
		}
		
		
		return cafeStatistics;
	}
	
	@RequestMapping(value="json/{cafeURL}/manage/autoComplete")
	public List autoComplete(@PathVariable String cafeURL) throws Exception
	{
		System.out.println("json/manage/autoComplete");
		
		List<String> list = cafeManageService.getCafeMemberAutocomplete(cafeURL);
		
		return list;
	}

	////////////////////////////////////////////////////예림 끝//////////////////////////////////////

	/////////////////////////////////지니////////////////////////////////@RequestMapping(value="/{cafeURL}/manage/updateCafeApplication", method=RequestMethod.POST)
	public String updateCafeApplication(@RequestBody String application) {
		
		System.out.println("/{cafeURL}/manage/updateCafeApplication : POST");
		System.out.println("엥??");
		System.out.println(application);
		
		JSONObject obj = (JSONObject) JSONValue.parse(application);
		String cafeApplication = (String)obj.get("application");
		
		//System.out.println("뽑은 : "+ cafeApplication);
		
		String split[]= cafeApplication.split(",");
		String result[];
		
		List<String> nickName = new ArrayList<String>();
		List<Integer> userNo  = new ArrayList<Integer>();
		List<Integer> cafeNo = new ArrayList<Integer>();
	
		int count = split.length;
		
		//멤버닉네임,userNo,cafeNo
		for(int i =0; i<split.length;i++) {
			System.out.println("값 몇개인지부터 확인: "+split.length);
			System.out.println("split"+split[i]);
			result= split[i].split("&");
				nickName.add(result[0]);
				userNo.add(Integer.parseInt(result[1]));
				cafeNo.add(Integer.parseInt(result[2]));
			}
			
		System.out.println(userNo);
		//기황수정
		//cafeApplication userNo로 받아오는 부분 List로 가져오게 수정하면서 에러 발생했습니다.
		//추후 수정부탁드립니다 지니님
		/*
		for(int i = 0; i<count; i++) {
			System.out.println(userNo.get(i));
			CafeApplication cafe =cafeManageService.getCafeApplication(userNo.get(i));	
			System.out.println(cafe);
			cafe.setAcceptStatusCode("ca102");
			cafeManageService.updateAcceptStatusCode(cafe);
			
			CafeMember member = new CafeMember();
			member.setCafeNo(cafeNo.get(i));
			member.setUserNo(userNo.get(i));
			member.setMemberNickname(nickName.get(i));
			//member.setMemberStatusCode(memberStatusCode);//이거 나중에 조인해서 추가해
			//member.setCafeMemberGradeNo(cafeMemberGradeNo);//이거 나중에 조인해서 추가해2

		}
		*/
		
//		System.out.println(nickName);
//		System.out.println(userNo);
//		System.out.println(cafeNo);

		return "/cafe/listCafeApplication";
		
	}

	@PostMapping(value="json/{cafeURL}/manage/checkCafeGrade")
	public Map checkGrade(Model model , @RequestBody CafeGrade cafeGrade) {
		
		System.out.println("json/cafe/{CafeURL}/manage/checkCafeGrade : POST");
		System.out.println(model);
		System.out.println(cafeGrade);
		
		return null;
		
	}


////////////////////////////////지니끝//////////////////////////////////

}
