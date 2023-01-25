package com.tmtm.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tmtm.main.*;

@Controller
public class MyPageController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageService mypageService;
	@Autowired LoginService loginService;
	
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
	public HashMap<String, Object> careerUp(@RequestParam int career_num){
		logger.info("이력 정보 컨트롤러");
		logger.info("career_num : "+career_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MyPageDTO> list = mypageService.careerUp(career_num);
		
		map.put("list", list);

		return map;
	}
	
	@PostMapping(value="myPage/careerUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> careerUpdate(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("이력 정보 수정 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mypageService.careerUpdate(params);
		LoginDTO loginInfo = (LoginDTO) session.getAttribute("loginInfo");
		String id = loginInfo.getEmp_num();
		logger.info("수정 개수 : "+row);
		
		ArrayList<LoginDTO> careers = loginService.getCareers(id);
		if(careers.size()>0) {
			session.setAttribute("careers", careers);
		}
		
		return map;
	}
	
	@PostMapping(value="myPage/careerDel.ajax")
	@ResponseBody
	public HashMap<String, Object> careerDel(@RequestParam int career_num, HttpSession session){
		logger.info("이력 정보 삭제 컨트롤러");
		logger.info("career_num : "+career_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mypageService.careerDel(career_num);
		logger.info("삭제 개수 : "+row);
//		String id = mypageService.empNum(career_num);
		LoginDTO loginInfo = (LoginDTO) session.getAttribute("loginInfo");
		String id = loginInfo.getEmp_num();
		
		ArrayList<LoginDTO> careers = loginService.getCareers(id);
		session.setAttribute("careers", careers);
	
		
		
		return map;
	}
	
	@PostMapping(value="myPage/careerAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> careerAdd(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("이력 정보 추가 컨트롤러");
		logger.info("params : {}"+params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mypageService.careerAdd(params);
		logger.info("추가 개수 : "+row);
		LoginDTO loginInfo = (LoginDTO) session.getAttribute("loginInfo");
		String id = loginInfo.getEmp_num();
		
		ArrayList<LoginDTO> careers = loginService.getCareers(id);
		session.setAttribute("careers", careers);
		
		
		return map;
	}
	
	@PostMapping(value="/myPage/proImg.do")
	public String proImg(MultipartFile profileImg, HttpSession session) {
		logger.info("request upload");
		LoginDTO loginInfo = (LoginDTO) session.getAttribute("loginInfo");
		logger.info(loginInfo.getEmp_num());
		logger.info("uploadfile : "+profileImg);
		String emp_num = loginInfo.getEmp_num();
		String newFileName = mypageService.proImg(profileImg, emp_num);
		logger.info("newFileName : "+newFileName);
		
		session.setAttribute("profileImg", newFileName);
		
		
		return "redirect:/myPage.go";
	}
	
	@PostMapping(value="/myPage/signImg.do")
	public String signImg(MultipartFile signImg, HttpSession session) {
		logger.info("사인 request upload");
		LoginDTO loginInfo = (LoginDTO) session.getAttribute("loginInfo");
		logger.info(loginInfo.getEmp_num());
		logger.info("uploadfile : "+signImg);
		String emp_num = loginInfo.getEmp_num();
		String newFileName = mypageService.signImg(signImg, emp_num);
		
		session.setAttribute("signImg", newFileName);
		
		
		return "redirect:/myPage.go";
	}
	
	
	@PostMapping(value="myPage/proImgDel.ajax")
	@ResponseBody
	public HashMap<String, Object> proImgDel(@RequestParam String emp_num, HttpSession session){
		logger.info("프로필 이미지 삭제 : "+emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		mypageService.proImgDel(emp_num);
		logger.info("프로필 삭제");
		
		session.removeAttribute("profileImg");
		
		
		return map;
	}
	
	@PostMapping(value="myPage/signImgDel.ajax")
	@ResponseBody
	public HashMap<String, Object> signImgDel(@RequestParam String emp_num, HttpSession session){
		logger.info("프로필 이미지 삭제 : "+emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		mypageService.signImgDel(emp_num);
		logger.info("사인 삭제");
		
		session.removeAttribute("signImg");
		
		return map;
	}
	
	@PostMapping(value="/myPage/pwChange.ajax")
	@ResponseBody
	public HashMap<String, Object> pwChange(HttpSession session, @RequestParam String cur_pw, @RequestParam String new_pw){
		LoginDTO loginInfo = (LoginDTO) session.getAttribute("loginInfo");
		String emp_num = loginInfo.getEmp_num();
		
		return mypageService.pwChange(cur_pw, new_pw, emp_num);
	}
	
	public void setEmpSession(String id, LoginDTO loginDTOs, HttpSession session) {
		session.setAttribute("loginInfo", loginDTOs);
	}
	
}
