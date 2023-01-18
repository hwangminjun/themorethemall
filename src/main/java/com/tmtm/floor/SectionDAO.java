package com.tmtm.floor;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SectionDAO {

	int totalCount();

	ArrayList<SectionDTO> secList(int offset);

	ArrayList<SectionDTO> secDetail(String section_num);

	ArrayList<SectionDTO> teamDrop();

	ArrayList<SectionDTO> empList(int val);

	ArrayList<SectionDTO> teamlist(int val);

	int infoUp(HashMap<String, String> params);

	int searchCount(HashMap<String, Object> params);

	ArrayList<SectionDTO> searchList(HashMap<String, Object> params);

	

}
