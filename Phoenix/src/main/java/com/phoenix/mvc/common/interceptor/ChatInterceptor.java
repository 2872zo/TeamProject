package com.phoenix.mvc.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Map;

@Component
public class ChatInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;

	public ChatInterceptor() {
		System.out.println("ChatInterceptor 생성했습니다.");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	throws Exception {
		System.out.println("\n\n================================ ChatInterceptor > preHandle 시작 ================================");
		String requestURI = request.getRequestURI();
		System.out.println(">>>>>>>>>>> 요청URL : " + requestURI);

		// pathVariables 사용하기 위한 선언
		Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

		// 세션의 로그인 정보
		User user = (User) request.getSession().getAttribute("user");
		
		if (user==null) {
			response.sendRedirect("/common/needLogin");
			return false;
		}

		// 모든 경우가 만족
		System.out.println("================================ ChatInterceptor > preHandle 끝 ===============================\n\n");
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