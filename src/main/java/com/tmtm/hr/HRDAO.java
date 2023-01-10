package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HRDAO {

	ArrayList<HRDTO> hrlist();

	ArrayList<HRDTO> deplist();

	ArrayList<HRDTO> teamlist(String val);

	ArrayList<HRDTO> ranklist();

	ArrayList<HRDTO> poslist();

	int hrAdd(HashMap<String, String> params);

	int teamCount(HashMap<String, String> params);

	ArrayList<HRDTO> teamManage();

	int teamAdd(HashMap<String, String> params);

	int posAdd(HashMap<String, String> params);

	int rankAdd(HashMap<String, String> params);

//	ArrayList<HRDTO> posList();

//	String hrsup(HashMap<String, String> params);




//	int totalCount();

//	ArrayList<HashMap<String, Object>> hrlist(int offset);

}
