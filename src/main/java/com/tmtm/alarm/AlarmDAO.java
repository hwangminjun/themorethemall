package com.tmtm.alarm;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmDAO {

	ArrayList<AlarmDTO> list(String emp_num);

}
