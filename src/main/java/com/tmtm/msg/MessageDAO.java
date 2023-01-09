package com.tmtm.msg;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDAO {

	int totalCount();

	ArrayList<HashMap<String, Object>> list(int offset);

}
