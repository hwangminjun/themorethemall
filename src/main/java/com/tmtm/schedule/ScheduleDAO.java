package com.tmtm.schedule;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	ArrayList<ScheduleDTO> list();

}
