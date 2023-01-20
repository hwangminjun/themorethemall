package com.tmtm.fac;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacManageDAO {

	ArrayList<FacManageDTO> facList();
	
	ArrayList<FacManageDTO> bookList();

	ArrayList<FacManageDTO> empChoice();

	boolean register(FacManageDTO dto);

	void fileInsert(String all_num, String ori_filename, String new_filename);

	boolean update(FacManageDTO dto);

	void fileUpdate(String all_num, String ori_filename, String new_filename);

	boolean delete(int fac_num);

	

	

	

	

	

}
