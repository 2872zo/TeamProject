package com.phoenix.mvc.web.sns;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.sns.impl.SnsServiceImpl;

@RestController
@RequestMapping("/sns/*")
public class SnsRestController {

	@Autowired
	@Qualifier("snsServiceImpl")
	private SnsServiceImpl snsService;

	public SnsRestController() {
		System.out.println(this.getClass().getName() + "생성자 시작");
	}

	@RequestMapping(value = "/json/getTimeLine")
	public Map getTimeLine(@RequestBody Search search) throws Exception {

		System.out.println("/json/getTimeLine 시작!");

		if (search.getSubject() == 100) {
			
			search.setFbId("wlsgml1416@naver.com");
			search.setFbPw("011!wlslgogo");
			
		}
			System.out.println(search);

			Map returnMap = new HashMap();

			Map<String, Object> map = snsService.getFaceBookTimeLineList(search);

			System.out.println("map이욤 : " + map);

			returnMap.put("timeLine", map.get("timeLine"));
			returnMap.put("count", map.get("count"));
			returnMap.put("search", map.get("search"));

			return returnMap;
		
	}

}
