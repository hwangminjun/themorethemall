package com.tmtm.main;

import java.io.Console;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
 Logger logger = LoggerFactory.getLogger(getClass());
 	@Autowired LoginService loginService;
 	
 	
 	@PostMapping(value="/login/login.do")
 	public String loginProc(String userType, String id, String pw , HttpSession session) {
 		LoginDTO loginDTOs = new LoginDTO();
 		String page="login";
 			logger.info("직원 로그인 시작 : id - " + id + "/ pw - " + pw);
 			loginDTOs = loginService.empLogin(id,pw);
 			if(loginDTOs.getEmp_num()!=null) {
 				//첨부파일 가져오기
 				ArrayList<String> fileName = loginService.getFileName(id);

 				if(fileName.size()>0) {
 				session.setAttribute("profileImg", fileName.get(0));
 				session.setAttribute("signImg", fileName.get(1));
 				}
 				//권한 리스트 가져오기
 				ArrayList<Integer> authList = loginService.getAuth(id);
 				if(authList.size()>0) {
 					logger.info(authList.size()+"개");
 					session.setAttribute("authority", authList);
 	 					
 				}
 			}
 			page = "index";
 		//type, 팀, 부서명, 파일명, 권한, 직급명, 직책명
 		logger.info(loginDTOs.getEmp_name());
		
		session.setAttribute("empInfo", loginDTOs);
 		
 		return "redirect:/index";
 	}
 	
 	@GetMapping(value="/login/logout.do")
 	public String logout(HttpSession session) {
 		logger.info("로그아웃!!!!!");
 		
 		session.removeAttribute("empInfo");
 		session.removeAttribute("profileImg");
 		session.removeAttribute("signImg");
 		
 		return "redirect:/";
 	}
 	

}
