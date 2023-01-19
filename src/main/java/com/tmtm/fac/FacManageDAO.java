package com.tmtm.fac;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacManageDAO {

	ArrayList<FacManageDTO> facList();

	ArrayList<FacManageDTO> empChoice();

	boolean facInsert(FacManageDTO dto);

	void fileInsert(String all_num, String oriFileName, String newFileName);

	

}
