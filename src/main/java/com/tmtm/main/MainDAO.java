package com.tmtm.main;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

	ArrayList<HashMap<String, String>> thisMonthGraph(String thisMonth);

}
