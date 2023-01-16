package com.tmtm.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		  LoginInter loginInter = new LoginInter();
		  
		  registry.addInterceptor(loginInter)
		  .addPathPatterns(loginInter.loginEssential)
		  .excludePathPatterns(loginInter.loginInessential);
		 
	}

}
