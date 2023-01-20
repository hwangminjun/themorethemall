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

	int careerUpdate(HashMap<String, String> params);

	String empNum(int career_num);

	int careerDel(int career_num);

	int careerAdd(HashMap<String, String> params);

	void proImgAdd(String emp_num, String oriFileName, String newFileName);

	int imgCheck(String emp_num);

	int imgDel(String emp_num);

	int imgSignCheck(String emp_num);

	int imgSignDel(String emp_num);

	void signImgAdd(String emp_num, String oriFileName, String newFileName);

	int proImgDel(String emp_num);

	String getOldPw(String emp_num);

	void pwChange(String hash, String emp_num);

}
