package com.phoenix.mvc.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Component
public class CafeInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;

	public CafeInterceptor() {
		System.out.println("Interceptor 생성");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Interceptor > preHandle");

		Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

		System.out.println(">>>>>>>>>>>aaaa : " + request.getRequestURI());
		
		User user = (User) request.getSession().getAttribute("user");

		if (user == null) {
			System.out.println("CafeInterceptor >>> User없음");
			response.sendRedirect(request.getContextPath() + "/user/loginView");
			return false;
		} else {

			//카페 메뉴
			if (request.getRequestURI().startsWith("/cafe/")) {
				System.out.println(">>>>>>>>>>cafe 메뉴 접근");
				//메인 아님
				if (request.getRequestURI().indexOf("/cafe/main/") == -1) {
					System.out.println(">>>>>>>>>>>>cafeURL : " + pathVariables.get("cafeURL"));
					//로그인된 유저가 접근한 카페의 멤버 정보 가져옴
					String cafeURL = pathVariables.get("cafeURL");
					Search search = new Search();
					search.setCafeURL(cafeURL);
					search.setUserNo(user.getUserNo());
					CafeMember cafeMember = cafeMemberService.getCafeMemberByURL(search);
					
					System.out.println(cafeMember);
					
					//유저가 특정 카페에 접근했을때 해당 카페의 멤버가 아닐때
					if (cafeMember == null) {
						System.out.println("CafeInterceptor >>> 카페 멤버 아님");
						response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/needApply");
						return false;
					} 
					//해당 카페의 멤버일때 접근하는 메뉴에 따른 권한 체크
					else {
						
						//정지멤버일 경우 정지 기간 표시 페이지로
						if(cafeMember.getMemberStatusCode().equals("cs101")) {
							System.out.println("interceptor >>> 정지 회원접근");
							response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/memberBlock");
							return false;
						}

						//게시판 조회
						if (request.getRequestURI().indexOf("getBoard") != -1) {
							System.out.println("interceptor >>> 카페 메뉴 접근 >>> getBoard");
							Board board = cafePostService.getBoard(Integer.parseInt(pathVariables.get("boardNo")));
							int cafeMemberGrade = Integer.parseInt(cafeMember.getMemberGrade().substring(2));
							int boardGrade = Integer.parseInt(board.getAccessGrade().substring(2));

							if (!user.getUserRoleCode().equals("ur100") && cafeMemberGrade > 101 && cafeMemberGrade < boardGrade) {
								System.out.println("CafeInterceptor >>> 권한 부족");
								response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/accessDenied");
								return false;
							}
						}

						//게시글 조회
						if (request.getRequestURI().indexOf("getPost") != -1) {
							System.out.println("interceptor >>> 카페 메뉴 접근 >>> getPost");
							Board board = cafePostService.getBoardByPostNo(Integer.parseInt(pathVariables.get("postNo")));
							int cafeMemberGrade = Integer.parseInt(cafeMember.getMemberGrade().substring(2));
							int boardGrade = Integer.parseInt(board.getAccessGrade().substring(2));

							if (!user.getUserRoleCode().equals("ur100") && cafeMemberGrade > 101 && cafeMemberGrade < boardGrade) {
								System.out.println("CafeInterceptor >>> 권한 부족");
								response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/accessDenied");
								return false;
							}
						}
					}
				}
			}
		}
		
		//모든 경우가 만족
		return true;
	}

//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//    	System.out.println("Interceptor > postHandle");
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3) throws Exception {
//    	System.out.println("Interceptor > afterCompletion" );
//    }
}