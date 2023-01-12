package com.tmtm.utils;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.tmtm.main.LoginDTO;

@Component
public class LoginInter implements HandlerInterceptor {

	public List loginEssential
    = Arrays.asList("/**");

	public List loginInessential
    = Arrays.asList("/","/login/**","/assets/**", "/res/**", 
    		"/default_image", "/richtexteditor/**", "/fullcalendar/**", "/examples/**", "/error");

	/* 
	 * /error
	 * 
	*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		LoginDTO loginInfo = (LoginDTO) request.getSession().getAttribute("loginInfo");
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		
		if(loginInfo != null) {
			//String UriName = URIUriName(requestURI);
			return true;
		}else{
			response.sendRedirect("/");
			return false;
		}
	}
	
}
