package com.tmtm.sales;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesDAO {

	ArrayList<SalesDTO> getSec(String val);

	ArrayList<HashMap<String, String>> getSecGraph(HashMap<String, String> params);
	
	SalesDTO getStore(String secNum);
	
	ArrayList<HashMap<String, String>> getStoreGraph(HashMap<String, String> params);

	String getCurStd();

	void regStd(String val);

	int totalCount();

	ArrayList<SalesDTO> specialList(int offset);

	SalesDTO specialDetail(int special_pk);

	ArrayList<SalesDTO> specialEvent(int special_pk);

	int detailCount(String content);

	ArrayList<SalesDTO> detailSearch(int offset, String content);

}
