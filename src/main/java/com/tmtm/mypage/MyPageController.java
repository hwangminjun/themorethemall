package com.tmtm.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tmtm.main.LoginDTO;
import com.tmtm.main.LoginService;


@Controller
public class MyPageController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageService mypageService;
	
//	@GetMapping(value = "/mypage/update.do")
//	public String mpUpdate(HttpSession session, Model model, @RequestParam String emp_num, @RequestParam String emp_name, @RequestParam String email, @RequestParam String phone, @RequestParam String academy) {
//		
//		int cnt = mypageService.update(emp_num, emp_name, email, phone, academy);
//		if(cnt>0) {
//			LoginDTO detail = mypageService.getDetail(emp_num);
//			session.setAttribute("loginInfo", detail);
//		}
//		model.addAttribute("page", "mypage");
//		return "redirect:/myPage.go";
//	}
	
	@PostMapping(value="myPage/update.ajax")
	@ResponseBody
	public HashMap<String, Object> update(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("내 정보 수정 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = mypageService.update(params);
		logger.info("내정보 수정 수 : "+row);
		
		String id = params.get("emp_num");
		
		LoginDTO loginDTOs = mypageService.sessionUp(id);
		setEmpSession(params.get("emp_num"), loginDTOs ,session);
	
		
		return map;
	}
	
	@PostMapping(value="myPage/careerUp.ajax")
	@ResponseBody
	public HashMap<String, Object> careerUp(@RequestParam int career_num , HttpSession session){
		logger.info("이력 정보 수정 컨트롤러");
		logger.info("career_num : "+career_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MyPageDTO> list = mypageService.careerUp(career_num);
		
		
		map.put("list", list);
	
		
		return map;
	}
	
	
	
	
	
	
	public void setEmpSession(String id, LoginDTO loginDTOs, HttpSession session) {
		session.setAttribute("loginInfo", loginDTOs);
	}
	
	
	
	
}
