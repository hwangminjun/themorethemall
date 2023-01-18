package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacDAO {

	ArrayList<FacDTO> facList(String nowState);



	ArrayList<FacDTO> select();

	ArrayList<FacDTO> facBookList(int fac_num);

	ArrayList<FacDTO> part();

	ArrayList<FacDTO> team(int dep_num);

	ArrayList<FacDTO> emp(String team_num);

	ArrayList<FacDTO> teamList(int dep_num);

	

	

	/*
	 * ArrayList<FacDTO> modFac(int fac_num);
	 */
	

	
	boolean regList(FacDTO facDto);

	ArrayList<FacDTO> book();

	void bookMem(int book_num, String mem);


	ArrayList<FacDTO> bookList();

	ArrayList<FacDTO> detail(String emp_num);



	ArrayList<FacDTO> myBook(HashMap<String, Object> params);



	int checkTime(String fac_num, String book_start, String book_end);



	ArrayList<FacDTO> modalList(int book_num);










	 
	

}
