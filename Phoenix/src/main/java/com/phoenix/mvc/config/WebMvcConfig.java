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
		
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor)
                .addPathPatterns("/cafe/**")
                .excludePathPatterns("/cafe/main/**")
                .excludePathPatterns("/cafe/*/getCafeGrade")
                .excludePathPatterns("/user/login")
                .excludePathPatterns("/user/logout"); //로그인 쪽은 예외처리를 한다.
        
    }
    
    
}