package com.tmtm.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.tmtm.main.LoginDTO;

@Component
public class LoginInter implements HandlerInterceptor {

	Logger logger = LoggerFactory.getLogger(getClass());
	
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
    		"/docExRec.go",
    		"/docRec.go",
    		"/docDis.go",
    		"/docDisDet.go",
    		"/docTeam.go",
    		"/docStyleList.go",
    		"/docWrite.go",
    		"/OrgChart.go",
    		"/floor.go",
    		"/teamSch.go",
    		"/facList.go",
    		"/facDetail.go",
    		"/docStyleCreate.go",
    		"/docStyleDetail.go",
    		"/docStyleUpdate.go"
    		);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		LoginDTO loginInfo = (LoginDTO) request.getSession().getAttribute("loginInfo");
		ArrayList<Integer> authList = (ArrayList<Integer>) request.getSession().getAttribute("authority");
		
		String requestURI = request.getRequestURI();
		
		logger.info("요청 : {}",requestURI);
		logger.info("권한 : {}",authList);
		
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
				
			case "/special.go": // 특이 사항
				result = authList.contains(12);
				break;
				
			case "/teamList.go": // 팀 관리
				result = authList.contains(3);
				break;
				
			case "/posList.go": // 직책관리
				result = authList.contains(4);
				break;
				
			case "/rankList.go": // 직급관리
				result = authList.contains(5);
				break;
				
			case "/sectionList.go": // 구역 관리
				result = authList.contains(13);
				break;
			
			case "/storeList.go": // 점포 관리
				result = authList.contains(11);
				break;
			
			case "/facManage.go":
				result = authList.contains(6);
				break;
			}
		}else {
			result = false;
		}
		
		return result;
	}

}
