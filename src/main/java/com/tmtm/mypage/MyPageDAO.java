package com.tmtm.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.tmtm.main.LoginDTO;

@Mapper
public interface MyPageDAO {

//	int update(String emp_num, String emp_name, String email, String phone, String academy);

//	LoginDTO getDetail(String emp_num);

	int update(HashMap<String, String> params);

	LoginDTO sessionUp(String id);

	ArrayList<MyPageDTO> careerUp(int career_num);

}
