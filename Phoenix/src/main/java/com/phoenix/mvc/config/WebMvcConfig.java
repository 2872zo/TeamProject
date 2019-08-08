package com.phoenix.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.phoenix.mvc.common.interceptor.CafeInterceptor;

@Configuration
@Component
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	@Qualifier(value = "cafeInterceptor")
	private HandlerInterceptor interceptor;
	
	@Autowired
	@Qualifier(value = "mailInterceptor")
	private HandlerInterceptor mailInterceptor;
	
	@Autowired
	@Qualifier(value = "chatInterceptor")
	private HandlerInterceptor chatInterceptor;
	
	@Autowired
	@Qualifier(value = "userInterceptor")
	private HandlerInterceptor userInterceptor;
	
	@Autowired
	@Qualifier(value = "snsInterceptor")
	private HandlerInterceptor snsInterceptor;
		
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor)
                .addPathPatterns("/cafe/**")
                .excludePathPatterns("/cafe/main/**")
                .excludePathPatterns("/cafe/*/getCafeGrade")                
                .excludePathPatterns("/user/login")//로그인 쪽은 예외처리를 한다.
                .excludePathPatterns("/user/logout")
                .excludePathPatterns("/cafe/*/closedCafe")
                .excludePathPatterns("/cafe/*/needApply")
                .excludePathPatterns("/cafe/*/memberBlock")
                .excludePathPatterns("/cafe/*/accessDenied"); 
        
        registry.addInterceptor(mailInterceptor)
        		.addPathPatterns("/mail/**")
        		.excludePathPatterns("/mail/json/addMailAccount")
        		.excludePathPatterns("/mail/modalTest");
        
        registry.addInterceptor(chatInterceptor)
        		.addPathPatterns("/chat/**");
        
        registry.addInterceptor(userInterceptor)
        		.addPathPatterns("/user/**")
        		.excludePathPatterns("/user/loginView")
        		.excludePathPatterns("/user/json/login")
                .excludePathPatterns("/user/logout")
                .excludePathPatterns("/user/addUserView")
                .excludePathPatterns("/user/oauth")
                .excludePathPatterns("/user/callback")
                .excludePathPatterns("/user/json/add*Account");
        
        registry.addInterceptor(snsInterceptor)
				.addPathPatterns("/sns/getTimeLine");
        
    }
    
    
}