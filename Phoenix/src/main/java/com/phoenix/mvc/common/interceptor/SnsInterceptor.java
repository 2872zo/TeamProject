package com.phoenix.mvc.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.sns.impl.SnsServiceImpl;
import com.phoenix.mvc.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class SnsInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("snsServiceImpl")
	private SnsServiceImpl snsService;

	public SnsInterceptor() {
		System.out.println("snsInterceptor 생성!!");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(
				"\n\n================================ SnsInterceptor > preHandle START ================================");
		String requestURI = request.getRequestURI();
		System.out.println(">>>>>>>>>>> 요청URL : " + requestURI);

		// pathVariables 사용하기 위한 선언
		Map<String, String> pathVariables = (Map<String, String>) request
				.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

		// 세션의 로그인 정보
		User user = (User) request.getSession().getAttribute("user");

		// 로그인 여부 확인
		if (user == null) {
			System.out.println(">>> User없음");
			response.sendRedirect(request.getContextPath() + "/user/loginView?targetURL=" + request.getRequestURI());
			return false;
		}
		// 연동계정 확인
		else {
			Search search = new Search();
			search.setUserNo(user.getUserNo());
			List<Account> accountList = snsService.getSnsAccount(search);
			
			
			if (accountList == null || accountList.size()== 0) {
				System.out.println("연동된 sns계정 없음!");
				response.sendRedirect(request.getContextPath() + "/user/getUserInfo?userNo=" + user.getUserNo());
				return false;
				
			}

			System.out.println("연동된 sns 계정 존재!");
			request.setAttribute("accountList", accountList);
			

		}

		// 모든 경우가 만족
		System.out.println("================================ SnsInterceptor > preHandle END ================================\n\n");
		return true;
	}
}