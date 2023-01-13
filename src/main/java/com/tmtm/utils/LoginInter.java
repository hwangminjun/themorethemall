package com.tmtm.utils;

import java.util.ArrayList;
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
    		"/default_image/**", "/richtexteditor/**", "/fullcalendar/**", "/examples/**"
    		,"/favicon.*", "/error");

	public List everyList
    = Arrays.asList("/index.go",
    		"/myPage.go",
    		"/workRecord.go", 
    		"/docRec.go",
    		"/docDis.go",
    		"/docTeam.go",
    		"/docStyleList.go",
    		"/docWrite.go",
    		"/OrgChart.go",
    		"/floor.go",
    		"/teamSch.go",
    		"/facList.go"
    		);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		LoginDTO loginInfo = (LoginDTO) request.getSession().getAttribute("loginInfo");
		ArrayList<Integer> authList = (ArrayList<Integer>) request.getSession().getAttribute("authority");
		
		String requestURI = request.getRequestURI();
		
		System.out.println(requestURI);
		// /index.go
		System.out.println(authList);
		// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
		// null
		boolean result = true;
		
		if(loginInfo != null) { // 로그인 했을 때
			if(!everyList.contains(requestURI)) {
				if(requestURI.lastIndexOf(".go") != -1) { // .go로 요청이 들어왔다면
					result = checkAuth(requestURI, authList); // 권한체크
					if(!result) { // 권한이 없다면
						response.sendRedirect("/index.go");
					}
				}
			}
		}else{ // 로그인 안했을 때
			result = false;
			response.sendRedirect("/"); // 로그인창으로
		}
		return result;
	}

	// 권한체크 메소드
	private boolean checkAuth(String requestURI, ArrayList<Integer> authList) { 
		boolean result = true;
		
		if(authList != null) {
			switch(requestURI) {
			
			case "/corEmpList.go": // 협업 및 권한 관리
				result = authList.contains(1);
				break;
				
			case "/sectionAnalysis.go": // 구역 비교
				
			case "/storeAnalysis.go": // 점포 비교
				
			case "/compareAnalysis.go": // 매출 비교
				
			case "/special.go":
				result = authList.contains(12);
				break;
				
			}
		}else {
			result = false;
		}
		
		return result;
	}

}
