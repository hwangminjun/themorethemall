package com.tmtm.sales;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesDAO {

	ArrayList<SalesDTO> getSec(String val);

	ArrayList<HashMap<String, String>> getGraph(HashMap<String, String> params);

}
