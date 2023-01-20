package com.tmtm.manage;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.tmtm.hr.HRDTO;

@Mapper
public interface ManageDAO {

	int totalCount();

	ArrayList<ManageDTO> list(int offset);

	ArrayList<ManageDTO> authCheck(String val);

	ArrayList<ManageDTO> authlist();

	int authDel(HashMap<String, String> params);

	int authAdd(HashMap<String, String> params);


	ArrayList<ManageDTO> corTeam(String emp_num);

	ArrayList<ManageDTO> corList();

	int teamDel(HashMap<String, String> params);

	int teamAdd(HashMap<String, String> params);

	ArrayList<HRDTO> searchList(HashMap<String, Object> params);

	int searchCount(HashMap<String, Object> params);

}
