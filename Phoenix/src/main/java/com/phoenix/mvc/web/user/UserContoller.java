package com.phoenix.mvc.web.user;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserDao;
import com.phoenix.mvc.service.user.UserService;

@Controller
@RequestMapping("/user/*")
@PropertySource("common.properties")
public class UserContoller {

	@Value("${pageSize}")
	private int pageSize;

	@Value("${pageUnit}")
	private int pageUnit;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	@Value("${uploadPath}")
	String uploadPath;

	public UserContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	//////////////////////////////////// 준호시작///////////////////////////////////
	@RequestMapping(value = "loginView", method = RequestMethod.GET)
	public String login() throws Exception {

		System.out.println("/user/logon : GET");

		return "user/login";
	}

	@GetMapping("addUserView")
	public String addUserView(@ModelAttribute User user) throws Exception {

		System.out.println("/addUser : GET");

		return "user/addUser";
	}

	@PostMapping("addUser")
	public String addUser(@ModelAttribute User user, Model model, HttpSession session,
			@RequestParam("uploadFile") MultipartFile uploadFile) throws Exception {

		System.out.println("/addUser : POST");

		if (session.getAttribute("kakaoId") != null) {
			System.out.println("카카오 계정 회원가입 들옴");
			user.setKakaoId((String) session.getAttribute("kakaoId"));
		}

		if (session.getAttribute("naverId") != null) {
			System.out.println("네이버 계정 회원가입 들옴");
			user.setNaverId((String) session.getAttribute("naverId"));
		}

		String fileName = uploadFile.getOriginalFilename()
				.substring(uploadFile.getOriginalFilename().lastIndexOf("\\") + 1);

		File f = new File(uploadPath, fileName);
		System.out.println("파일업로드하자~~~~~~~~~~~~~~~~~~" + fileName);

		try {
			uploadFile.transferTo(f);
		} catch (IOException e) {
			e.printStackTrace();
		}

		user.setProfileImg(fileName);

		userService.addUser(user);

		User user2 = userService.getUserInfo(user.getUserNo());

		user = user2;

		System.out.println("유저인서트다다아아아앙@@@@@" + user);

		model.addAttribute("user", user);

		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}

		return "redirect:/";
	}

	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {

		System.out.println("/user/logout : POST");

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "getUserInfo")
	public String getUserInfo(@RequestParam("userNo") int userNo, Model model) throws Exception {

		User user = userService.getUserInfo(userNo);

		System.out.println("카페정보들오니" + user);
		
		List<List<Account>> allAccountList = userService.getAllAccount(userNo);

		model.addAttribute("user", user);
		
		System.out.println("accountList : " + allAccountList);
		
		model.addAttribute("mailAccountList", allAccountList.get(0));
		model.addAttribute("shoppingmallAccountList", allAccountList.get(1));
		model.addAttribute("snsAccountList", allAccountList.get(2));

		return "user/getUser";

	}

	@GetMapping("updateUserView")
	public String updateUserView(@RequestParam("userNo") int userNo, Model model) throws Exception {

		System.out.println("/updateCafeInfoView : GET");

		User user = userService.getUserInfo(userNo);

		model.addAttribute("user", user);

		return "user/updateUser";
	}

	@PostMapping("updateUser")
	public String updateUser(@ModelAttribute("user") User user, Model model,
			@RequestParam("uploadFile") MultipartFile uploadFile) throws Exception {

		System.out.println("/updateUser : POST");

		String fileName = uploadFile.getOriginalFilename()
				.substring(uploadFile.getOriginalFilename().lastIndexOf("\\") + 1);

		File f = new File(uploadPath, fileName);
		System.out.println("파일업로드하자~~~~~~~~~~~~~~~~~~" + fileName);

		try {
			uploadFile.transferTo(f);
		} catch (IOException e) {
			e.printStackTrace();
		}

		user.setProfileImg(fileName);

		userService.updateUser(user);

		User user2 = userService.getUserInfo(user.getUserNo());

		user = user2;

		model.addAttribute("user", user);

		return "user/updateUser";
	}

	@RequestMapping(value = "listUser")
	public String getUserList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/listUser :");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("page", resultPage);
		model.addAttribute("search", search);

		return "/user/listUser";
	}

//	@RequestMapping(value = "oauth")
//	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
//		System.out.println("로그인 할때 임시 코드값");
//		// 카카오 홈페이지에서 받은 결과 코드
//		System.out.println(code);
//		System.out.println("로그인 후 결과값");
//
//		// 카카오 rest api 객체 선언
//		KakaoRestapi kr = new KakaoRestapi();
//		// 결과값을 node에 담아줌
//		JsonNode node = kr.getAccessToken(code);
//		// 결과값 출력
//		System.out.println(node);
//
//		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(node.get("access_token"));
//
//		JsonNode kakao_account = userInfo.path("kakao_account");
//
//		String kakaoId = userInfo.path("id").asText();
//
//		String token = node.path("access_token").asText();		
//
//		String email = null;
//
//		email = kakao_account.path("email").asText();
//
//		System.out.println("토큰 나와라 얍" + token);
//
//		String userId = userInfo.path("kakao_account").asText();
//
//		System.out.println("id : " + kakaoId);
//
//		System.out.println("userId" + userId + "dsada" + email + "이메일ㅇ느?");
//
//		User user = userService.getKakao(kakaoId);
//
//		if (user != null) {
//
//			user = userService.getUser(user.getUserId());
//
//			System.out.println("기존 카카오 계정이네" + user);
//
//			session.setAttribute("user", user);
//
//			return "/user/kakaoResult";
//		}
//
//		else {
//
//			session.setAttribute("kakaoId", kakaoId);
//			
//			System.out.println("신규 카카오 계정이네 회원가입으로 보내자");
//
//			return "/user/kakaoResult";
//		}
//	}

//	@RequestMapping(value = "oauth")
//	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
//		System.out.println("로그인 할때 임시 코드값");
//		// 카카오 홈페이지에서 받은 결과 코드
//		System.out.println(code);
//		System.out.println("로그인 후 결과값");
//
//		// 카카오 rest api 객체 선언
//		KakaoRestapi kr = new KakaoRestapi();
//		// 결과값을 node에 담아줌
//		JsonNode node = kr.getAccessToken(code);
//		// 결과값 출력
//		System.out.println(node);
//
//		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(node.get("access_token"));
//
//		JsonNode kakao_account = userInfo.path("kakao_account");
//
//		String kakaoId = userInfo.path("id").asText();
//
//		String token = node.path("access_token").asText();		
//
//		String email = null;
//
//		email = kakao_account.path("email").asText();
//
//		System.out.println("토큰 나와라 얍" + token);
//
//		User user = (User) session.getAttribute("user");
//
//		if (user != null) {
//
//			user = userService.getUser(user.getUserId());
//
//			System.out.println("연동 ㄱㄱ" + user);	
//			
//			session.setAttribute("kakaoId", kakaoId);
//			
//			user.setKakaoId(kakaoId);
//			
//			userService.updateUser(user);
//			
//			session.setAttribute("user", user);
//			
//			System.out.println("카카오아이디뭐냐?@@@@@@@" + kakaoId);
//			
//
//			return "/user/kakaoResult";
//		}else{
//
//			session.setAttribute("kakaoId", kakaoId);
//			
//			System.out.println("신규 카카오 계정이네 회원가입으로 보내자");
//
//			return "/user/kakaoResult";
//		}
//	}

	@RequestMapping(value = "oauth")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
		System.out.println("로그인 할때 임시 코드값");
		// 카카오 홈페이지에서 받은 결과 코드
		System.out.println(code);
		System.out.println("로그인 후 결과값");

		// 카카오 rest api 객체 선언
		KakaoRestapi kr = new KakaoRestapi();
		// 결과값을 node에 담아줌
		JsonNode node = kr.getAccessToken(code);
		// 결과값 출력
		System.out.println(node);

		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(node.get("access_token"));

		JsonNode kakao_account = userInfo.path("kakao_account");

		String kakaoId = userInfo.path("id").asText();

		String token = node.path("access_token").asText();

		String email = null;

		email = kakao_account.path("email").asText();

		System.out.println("토큰 나와라 얍" + token);

		if (session.getAttribute("user") != null) {
			System.out.println("세션회원 있으면 여기다~");

			User user = (User) session.getAttribute("user");

			user = userService.getUser(user.getUserId());

			System.out.println("연동 ㄱㄱ" + user);

			session.setAttribute("kakaoId", kakaoId);

			user.setKakaoId(kakaoId);

			userService.updateUser(user);

			session.setAttribute("user", user);

			System.out.println("카카오아이디뭐냐?@@@@@@@" + kakaoId);

			return "/user/kakaoResult";

		} else {

			User user = userService.getKakao(kakaoId);

			if (user != null) {

				user = userService.getUser(user.getUserId());

				System.out.println("기존 카카오 계정이네" + user);

				session.setAttribute("user", user);

				return "/user/kakaoResult";
			}

			else {

				session.setAttribute("kakaoId", kakaoId);

				System.out.println("신규 카카오 계정이네 회원가입으로 보내자");

				return "/user/kakaoResult";
			}
		}
	}

	@RequestMapping(value = "callback")
	public String naverLogin(@RequestParam("code") String code, Model model, ServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("코드 값 주냐? 안주지?시벌ㄹ?" + code);

		NaverRestapi kr = new NaverRestapi();
		// 결과값을 node에 담아줌
		JsonNode node = kr.getAccessToken(code);
		// 결과값 출력
		System.out.println("코드있냐?" + code);

		System.out.println("노드들감?" + node);

		JsonNode userInfo = NaverUserInfo.getNaverUserInfo(node.get("access_token"));

		String naver = userInfo.toString();

		String naverId = userInfo.path("response").path("id").asText();

		String token = node.path("access_token").asText();

		System.out.println("토큰 나와라 얍" + token);

		System.out.println("뭐 담겺냐?" + naver);

		System.out.println("id : " + naverId);
//
		if (session.getAttribute("user") != null) {
			System.out.println("세션회원 있으면 여기다~");

			User user = (User) session.getAttribute("user");

			user = userService.getUser(user.getUserId());

			System.out.println("연동 ㄱㄱ" + user);

			session.setAttribute("naverId", naverId);

			user.setNaverId(naverId);

			userService.updateUser(user);

			session.setAttribute("user", user);

			System.out.println("카카오아이디뭐냐?@@@@@@@" + naverId);

			return "/user/kakaoResult";

		} else {

			User user = userService.getNaver(naverId);

			if (user != null) {

				user = userService.getUser(user.getUserId());

				System.out.println("기존 카카오 계정이네" + user);

				session.setAttribute("user", user);

				return "/user/kakaoResult";
			}

			else {

				session.setAttribute("naverId", naverId);

				System.out.println("신규 카카오 계정이네 회원가입으로 보내자");

				return "/user/kakaoResult";
			}
		}
	}

	//////////////////////////////////// 준호끝///////////////////////////////////
}
