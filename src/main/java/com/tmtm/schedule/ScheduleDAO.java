package com.tmtm.schedule;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	ArrayList<ScheduleDTO> list(String team);

	ArrayList<String> typeList();

	boolean insertSch(ScheduleDTO schDTOs);

	ArrayList<ScheduleDTO> member(String team_num);

	void insertSchMems(String member, int sch_num);

	void updateSch(HashMap<String, Object> param);

	void deleteSch(int sch_num);

	void deleteMems(int sch_num);

	boolean insertAlarm(ScheduleDTO alarmDTOs);

	void insertAlarmMems(String member, int alarm_num);

	ArrayList<ScheduleDTO> getCand(int sch_num);

}
