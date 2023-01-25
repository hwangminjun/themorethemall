package com.tmtm.fac;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacManageDAO {

	ArrayList<FacManageDTO> facList();
	
	

	ArrayList<FacManageDTO> empChoice();

	boolean register(FacManageDTO dto);

	void fileInsert(String all_num, String ori_filename, String new_filename);

	int update(FacManageDTO dto);

	void fileUpdate(String fac_num, String ori_filename, String new_filename);

	boolean delete(int fac_num);

	void bookDel(int fac_num);



	int nameChk(String fac_num, String fac_name);



	int imgDel(String fac_num);



	int imgRemove(String fac_num);

	

	

	

	

	

}
