package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacDAO {

	ArrayList<FacDTO> facList();

	ArrayList<FacDTO> register(int fac_num);

	ArrayList<FacDTO> select();

	ArrayList<FacDTO> facBookList(int fac_num);

	ArrayList<FacDTO> part();

	ArrayList<FacDTO> team(int dep_num);

	ArrayList<FacDTO> emp(String team_num);

	ArrayList<FacDTO> teamList(int dep_num);

	

	

	ArrayList<FacDTO> modFac(int fac_num);

	

	/*
	 * ArrayList<FacDTO> regListTwo(String emp_num);
	 */
	ArrayList<FacDTO> regList(int fac_num, String emp_num, String book_start, String book_end);

	ArrayList<FacDTO> book();
	 
	

}