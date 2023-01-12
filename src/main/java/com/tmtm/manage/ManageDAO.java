package com.tmtm.manage;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManageDAO {

	int totalCount();

	ArrayList<ManageDTO> list(int offset);

	ArrayList<ManageDTO> authCheck(String val);

	ArrayList<ManageDTO> authlist();

}
