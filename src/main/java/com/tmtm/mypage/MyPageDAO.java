package com.tmtm.mypage;

import org.apache.ibatis.annotations.Mapper;

import com.tmtm.main.LoginDTO;

@Mapper
public interface MyPageDAO {

	int update(String emp_num, String emp_name, String email, String phone, String academy);

	LoginDTO getDetail(String emp_num);

}
