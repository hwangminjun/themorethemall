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

	int btnHiCheck(String loginId, String nowTime);

	void hiCheck(String nowTime, String loginId, String work_type);

	void byeCheck(String nowTime, String loginId);

	int btnByeCheck(String loginId, String nowTime);


}
