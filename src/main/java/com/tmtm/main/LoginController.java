package com.tmtm.main;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired LoginService loginService;
	
	@PostMapping(value="/login/login.do")
	public String loginProc(String id, String pw , HttpSession session, RedirectAttributes rattr, Model model) {
		String page="redirect:/";
		String msg="아이디 혹은 비밀번호를 확인해주세요.";
		//LoginDTO loginDTOs = new LoginDTO();
			logger.info("직원 로그인 시작 : id - " + id + "/ pw - " + pw);
			int outChk = loginService.outChk(id); // 퇴사 유저인지 확인
			if(outChk == 1) {
				msg = "퇴사한 유저입니다.";
				rattr.addFlashAttribute("msg", msg);
			}else {
				LoginDTO loginDTOs = loginService.empLogin(id,pw);
				if(loginDTOs.getEmp_num()!=null) {//로그인 성공 시
					setSession(id, loginDTOs, session);
					page="redirect:/index.go";
				}else {//일치하는 로그인 정보가 없을 때 호를 체크해주세요!";
					rattr.addFlashAttribute("msg", msg);
				}
			}
		
		//logger.info(loginDTOs.getEmp_name());
		
		return page;
	}

	@GetMapping(value="/login/logout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃!!!!!");
		if(session.getAttribute("loginInfo")!=null) {
			session.removeAttribute("loginInfo");
		}
		if(session.getAttribute("profileImg")!=null) {
			session.removeAttribute("profileImg");
		}
		if(session.getAttribute("signImg")!=null) {
			session.removeAttribute("signImg");
		}
		if(session.getAttribute("careers")!=null) {
			session.removeAttribute("careers");
		}
		if(session.getAttribute("leasePact")!=null) {
			session.removeAttribute("leasePact");
		}
		if(session.getAttribute("sectionInfo")!=null) {
			session.removeAttribute("sectionInfo");
		}
		if(session.getAttribute("authority")!=null) {
			session.removeAttribute("authority");
		}
		if(session.getAttribute("coorList")!=null) {
			session.removeAttribute("coorList");
		}

		return "redirect:/";
	}
	
	public void setSession(String id, LoginDTO loginDTOs, HttpSession session) {
		// 유저 정보 저장
		/*loginInfo
		 * emp : 사원 정보, 팀명, 부서명, 직급/직책 
		 * store : 점포 정보, 소분류명, 대분류명
		 * */
		session.setAttribute("loginInfo", loginDTOs);
		
		//첨부파일 가져오기
		ArrayList<LoginDTO> fileName = loginService.getFileName(id);
		//fileName DTO형태로 프사와 서명사진이 들어감 ==> {0번 index = {sort_num(1), new_filename(프사명)},1번 index = {sort_num(2), new_filename(사인이미지명)}}
		if(fileName.size()>0) {//파일 테이블에 사용자의 사진이 있다면
			for(int i=0;i<fileName.size(); i++) {//리스트를 훑어서
				if(fileName.get(i).getFile_sort_num()==1) {//1 - 프로필 사진
					session.setAttribute("profileImg", fileName.get(i).getNew_filename());
				}else {//1이 아닐 경우 서명이미지
					session.setAttribute("signImg", fileName.get(i).getNew_filename());
					
				}
				
			}
		}
		
		//권한 리스트 가져오기
		ArrayList<Integer> authList = loginService.getAuth(id);
		if(authList.size()>0) {//권한이 있다면 배열형태로 세션에 저장
			logger.info(authList.size()+"개");
			session.setAttribute("authority", authList);
		}
		
		//이력 가져오기
		ArrayList<LoginDTO> careers = loginService.getCareers(id);
		if(careers.size()>0) {
			session.setAttribute("careers", careers);
		}
		
		//협업관계
		ArrayList<LoginDTO> coorList = loginService.getCoor(id);
		if(coorList.size()>0) {
			session.setAttribute("coorList", coorList);
		}
	}


}
