package com.tmtm.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	LoginDTO emp_Login(String id, String pw);

	ArrayList<String> getFileName(String id);

	ArrayList<Integer> getAuth(String id);

}
	