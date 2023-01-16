package com.tmtm.work;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.tmtm.sales.SalesDTO;

@Mapper
public interface WorkDAO {

	int workListCount(String loginId);

	ArrayList<HashMap<String, String>> workList(String loginId, int offset);


}
