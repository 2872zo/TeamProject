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
public class ChatInterceptorConfig implements WebMvcConfigurer {
	
	@Autowired
	@Qualifier(value = "chatInterceptor")
	private HandlerInterceptor chatInterceptor;
		
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(chatInterceptor)
                .addPathPatterns("/chat/**");
    }
    
    
}