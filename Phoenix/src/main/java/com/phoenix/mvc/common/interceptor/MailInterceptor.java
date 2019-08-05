package com.phoenix.mvc.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.mail.MailService;
import com.phoenix.mvc.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class MailInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("mailServiceImpl")
	private MailService mailService;

	public MailInterceptor() {
		System.out.println("Mail Interceptor 생성");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	throws Exception {
		System.out.println("\n\n================================ MailInterceptor > preHandle START ================================");
		String requestURI = request.getRequestURI();
		System.out.println(">>>>>>>>>>> 요청URL : " + requestURI);

		// pathVariables 사용하기 위한 선언
		Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

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
			List<Account> accountList = userService.getMailAccount(user.getUserNo());
			
			if(!(accountList != null && accountList.size() > 0)) {
				System.out.println("연동된 메일 계정 없음!");
				response.sendRedirect(request.getContextPath() + "/user/getUserInfo?userNo=" + user.getUserNo());
				return false;
			}
			
			System.out.println("연동된 메인 계정 존재!");
			request.setAttribute("accountList", accountList);
			
			if(!requestURI.contains("json")) {
				int accountNo = 0;
				
				if(request.getParameter("accountNo") != null) {
					System.out.println("accountNo Null 아님");
					accountNo = Integer.parseInt((String)request.getParameter("accountNo"));
				}
				
				
				if(accountNo != 0) {
					for(Account account : accountList) {
						if(account.getAccountNo() == accountNo) {
							accountList = new ArrayList<Account>();
							accountList.add(account);
							break;
						}
					}
				}
				
				Map<String, Object> mailCount = mailService.getBoxMailCount(accountList);
				request.setAttribute("inboxTotalCount", mailCount.get("inboxTotalCount"));
				request.setAttribute("sentTotalCount", mailCount.get("sentTotalCount"));
				request.setAttribute("importantTotalCount", mailCount.get("importantTotalCount"));
				request.setAttribute("trashTotalCount", mailCount.get("trashTotalCount"));
			}
		}

		// 모든 경우가 만족
		System.out.println("================================ MailInterceptor > preHandle END ================================\n\n");
		return true;
	}
}