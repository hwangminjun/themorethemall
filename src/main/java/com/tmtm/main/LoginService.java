package com.tmtm.main;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	 Logger logger = LoggerFactory.getLogger(getClass());
	 @Autowired LoginDAO loginDAO;
	public LoginDTO empLogin(String id, String pw) {
		LoginDTO loginDTOs = loginDAO.emp_Login(id, pw);

		
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
	 
	 
}
