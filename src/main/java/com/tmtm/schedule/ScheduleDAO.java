package com.tmtm.schedule;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	ArrayList<ScheduleDTO> list();

	ArrayList<String> typeList();

	boolean insertSch(ScheduleDTO schDTOs);

	ArrayList<ScheduleDTO> member(String team_num);

	void insertSchMems(String member, int sch_num);

}
