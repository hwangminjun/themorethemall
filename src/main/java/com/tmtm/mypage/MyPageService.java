package com.tmtm.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmtm.main.LoginDTO;

@Service
public class MyPageService {
	@Autowired MyPageDAO myPageDAO;
	public int update(String emp_num, String emp_name, String email, String phone, String academy) {
		return myPageDAO.update(emp_num, emp_name, email, phone, academy);
	}
	public LoginDTO getDetail(String emp_num) {
		return myPageDAO.getDetail(emp_num);
	}

}
