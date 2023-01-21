package com.tmtm.main;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	 Logger logger = LoggerFactory.getLogger(getClass());
	 
	 @Autowired LoginDAO loginDAO;
	 @Autowired PasswordEncoder encoder;
	 
	public LoginDTO empLogin(String id, String pw) {
		String hash = "";
		LoginDTO loginDTOs = new LoginDTO();
		String cur_pw = loginDAO.getPw(id); // 지금 비밀번호 가져오기
		logger.info("현재 비밀번호 : {}", cur_pw);
		if(cur_pw != null) {
			if(cur_pw.equals("0000")) {
				logger.info("기존 비밀번호가 0000이다!!");
				if(cur_pw.equals(pw)) {
					logger.info("기존 비밀번호가 0000이고 로그인 성공ㅎㅎ");
					loginDTOs = loginDAO.emp_Login(id);
				}
			}else {
				logger.info("기존 비밀번호가 0000이 아니다!!");
				if(encoder.matches(pw, cur_pw)) {
					logger.info("기존 비밀번호가 0000이 아니고 로그인 성공ㅋㅋ");
					loginDTOs = loginDAO.emp_Login(id);
				}
			}
		}
		
 		//type, 팀, 부서명, 파일명, 권한, 직급명, 직책명
		return loginDTOs;
	}
	public ArrayList<LoginDTO> getFileName(String id) {
		// TODO Auto-generated method stub
		return loginDAO.getFileName(id);
	}
	public ArrayList<Integer> getAuth(String id) {
		// TODO Auto-generated method stub
		return loginDAO.getAuth(id);
	}
	public ArrayList<LoginDTO> getCoor(String id) {
		// TODO Auto-generated method stub
		return loginDAO.getCoor(id);
	}
	public ArrayList<LoginDTO> getCareers(String id) {
		// TODO Auto-generated method stub
		return loginDAO.getCareers(id);
	}
	public LoginDTO storeLogin(String id, String pw) {
		return loginDAO.storeLogin(id,pw);
	}
	public LoginDTO storePacts(String id) {
		// TODO Auto-generated method stub
		return loginDAO.storePacts(id);
	}
	public LoginDTO sectionInfo(String id) {
		// TODO Auto-generated method stub
		return loginDAO.sectionInfo(id);
	}
	public int outChk(String id) {
		// TODO Auto-generated method stub
		return loginDAO.outChk(id);
	}
	 
	 
}
