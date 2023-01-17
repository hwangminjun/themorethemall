package com.tmtm.work;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.tmtm.sales.SalesDTO;

@Mapper
public interface WorkDAO {

	int workListCount(String loginId);

	ArrayList<HashMap<String, String>> workList(String loginId, int offset);

	HashMap<String, String> showMonthWork(String monthFirst, String loginId);

	HashMap<String, String> showMonthAttend(String monthFirst, String loginId);

	int btnCheck(String loginId, String nowTime);


}
