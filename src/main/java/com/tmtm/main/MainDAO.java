package com.tmtm.main;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

	ArrayList<HashMap<String, String>> thisMonthGraph(String thisMonth);

	double monthAvg(String thisMonth);

	int getDocInfoSeq(String loginId);

	int getDocInfoWait(String loginId);

	ArrayList<HashMap<String, String>> getSchedule(int team_num, String nowTime);

	ArrayList<HashMap<String, String>> getFac(String emp_num, String nowTime);
}
