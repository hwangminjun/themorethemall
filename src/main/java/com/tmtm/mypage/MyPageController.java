package com.tmtm.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tmtm.main.LoginDTO;
import com.tmtm.main.LoginService;


@Controller
public class MyPageController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService mypageService;
	
	@GetMapping(value = "/mypage/update.do")
	public String mpUpdate(HttpSession session, Model model, @RequestParam String emp_num, @RequestParam String emp_name, @RequestParam String email, @RequestParam String phone, @RequestParam String academy) {
		
		int cnt = mypageService.update(emp_num, emp_name, email, phone, academy);
		if(cnt>0) {
			LoginDTO detail = mypageService.getDetail(emp_num);
			session.setAttribute("loginInfo", detail);
		}
		model.addAttribute("page", "mypage");
		return "redirect:/myPage.go";
	}
}
