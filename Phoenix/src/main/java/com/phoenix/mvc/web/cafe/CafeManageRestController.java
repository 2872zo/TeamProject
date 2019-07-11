package com.phoenix.mvc.web.cafe;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;

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

	////////////////////////////////////////////////////예림 끝//////////////////////////////////////

	/////////////////////////////////지니//////////////////////////////

//지니
//@RequestMapping(value = "json/{cafeURL}/manage/updateCafeApplication", method = RequestMethod.POST )
	public Map updateCafeApplication(@RequestBody String application) {

		System.out.println("json/{cafeURL}/manage/updateCafeApplication : POST");

		System.out.println(application);

		JSONObject obj = (JSONObject) JSONValue.parse(application);
		String cafeApplication = (String) obj.get("application");

		System.out.println("뽑은 : " + cafeApplication);

		String split[] = cafeApplication.split(",");
		String result[];

		Map<String, String> map = new HashMap<String, String>();

//멤버닉네임,userNo,cafeNo
		for (int i = 0; i < split.length; i++) {
			System.out.println("값 몇개인지부터 확인: " + split.length);
			System.out.println(split[i]);
			for (int j = 0; j < 3; j++) {// 값은 3개니까 고정
				result = split[i].split("&");
//System.out.println(result[j]);
				map.put("nickName", result[0]);
				map.put("userNo", result[1]);
				map.put("cafeNo", result[2]);
				System.out.println("map" + map);

			}
		}

		return map;

	}

////////////////////////////////지니끝//////////////////////////////////

}