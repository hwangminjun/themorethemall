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

}
