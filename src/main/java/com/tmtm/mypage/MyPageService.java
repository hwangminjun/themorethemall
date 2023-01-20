package com.tmtm.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmtm.main.LoginDTO;

@Service
public class MyPageService {
	
	@Autowired MyPageDAO myPageDAO;
	Logger logger = LoggerFactory.getLogger(getClass());
	
//	public int update(String emp_num, String emp_name, String email, String phone, String academy) {
//		return myPageDAO.update(emp_num, emp_name, email, phone, academy);
//	}
	
//	public LoginDTO getDetail(String emp_num) {
//		return myPageDAO.getDetail(emp_num);
//	}
	
	public int update(HashMap<String, String> params) {
		logger.info("내 정보 수정 서비스");
		return myPageDAO.update(params);
	}

	public LoginDTO sessionUp(String id) {
		logger.info("세션 재설정");
		return myPageDAO.sessionUp(id);
	}

	public ArrayList<MyPageDTO> careerUp(int career_num) {
		logger.info("이력 정보 서비스");
		return myPageDAO.careerUp(career_num);
	}

	public int careerUpdate(HashMap<String, String> params) {
		logger.info("이력 정보 수정 서비스");
		return myPageDAO.careerUpdate(params);
	}

	public String empNum(int career_num) {
		logger.info("세션 재설정 용 직원번호 구하기 서비스");
		return myPageDAO.empNum(career_num);
	}

	public int careerDel(int career_num) {
		logger.info("이력 정보 삭제 서비스");
		return myPageDAO.careerDel(career_num);
	}

	public int careerAdd(HashMap<String, String> params) {
		logger.info("이력 정보 추가 서비스");
		return myPageDAO.careerAdd(params);
	}

}
