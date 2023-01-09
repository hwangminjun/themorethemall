package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HRDAO {

	ArrayList<HRDTO> hrlist();

	ArrayList<HRDTO> deplist();

	ArrayList<HRDTO> teamlist(String val);



//	int totalCount();

//	ArrayList<HashMap<String, Object>> hrlist(int offset);

}
