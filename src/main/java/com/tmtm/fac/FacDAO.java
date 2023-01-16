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

	

	

	/*
	 * ArrayList<FacDTO> modFac(int fac_num);
	 */
	

	
	boolean regList(FacDTO facDto);

	ArrayList<FacDTO> book();

	void bookMem(int book_num, String mem);
	 
	

}
