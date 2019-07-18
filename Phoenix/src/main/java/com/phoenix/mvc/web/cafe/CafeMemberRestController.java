package com.phoenix.mvc.web.cafe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;
import com.phoenix.mvc.service.user.UserService;
import com.phoenix.mvc.service.user.impl.UserDaoImpl;

@RestController
@RequestMapping("/cafe/*")
public class CafeMemberRestController {
	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	public CafeMemberRestController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	/*
	 * @GetMapping("/user/{userId}") public User getUserById(@PathVariable String
	 * userId) throws Exception {
	 * 
	 * Search search = new Search(); search.setCurrentPage(1);
	 * search.setPageSize(5);
	 * 
	 * return cafeService.getUser(userId); }
	 */
	/////////////////////////////// 기황시작///////////////////////////////
	/*
	 * 뷰를 다시뽑는게 맞음 나중에 이거보고 REST컨트롤러 만들때 코딩참고용
	 * 
	 * @RequestMapping(value = "cafe/{cafeURL}/json/updateCafeMemberGrade") public
	 * String updateCafeMemberGrade(@RequestBody CafeMember cafeMember) throws
	 * Exception {
	 * 
	 * boolean updateCheck = false;
	 * 
	 * int updateChecker = cafeMemberService.updateCafeMemeberGrade(cafeMember);
	 * 
	 * if (updateChecker==1) { return cafeMember.getGradeName(); } else return
	 * "false";
	 * 
	 * 
	 * }
	 */
	/////////////////////////////// 기황끝///////////////////////////////

	//////////////////////// 지니시작////////////////////////////////////
	@RequestMapping(value = "json/{cafeURL}/checkNickName", method = RequestMethod.POST)
	public Map checkNickName(@RequestBody CafeMember cafeMember) throws Exception {

		System.out.println("/cafe/json/{cafeURL}/checkNickName : POST");

		System.out.println("cafeApplication값 확인 : " + cafeMember);

		boolean result = cafeMemberService.checkNickname(cafeMember);

		System.out.println("중복체크 값입니다!" + result);

		Map map = new HashMap();
		map.put("result", result);
		map.put("memberNickname", cafeMember.getMemberNickname());

		System.out.println("map값 확인 : " + map);

		return map;

		//////////////////////// 지니끝//////////////////////

	}
}
