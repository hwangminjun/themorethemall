package com.tmtm.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	LoginDTO emp_Login(String id, String pw);

	ArrayList<LoginDTO> getFileName(String id);

	ArrayList<Integer> getAuth(String id);

	ArrayList<LoginDTO> getCareers(String id);
	ArrayList<String> getCoor(String id);
	LoginDTO storeLogin(String id, String pw);

	LoginDTO storePacts(String id);

	LoginDTO sectionInfo(String id);

	//String getPw(String id);



}
	