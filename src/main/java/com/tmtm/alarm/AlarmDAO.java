package com.tmtm.alarm;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmDAO {

	ArrayList<AlarmDTO> list(String emp_num);

	ArrayList<AlarmDTO> alarmNum(String emp_num);

	ArrayList<AlarmDTO> detailInfo(int alarm_num);

	ArrayList<AlarmDTO> alarmDetail(HashMap<String, String> param);

	void alarmCount(int alarm_num);

}
