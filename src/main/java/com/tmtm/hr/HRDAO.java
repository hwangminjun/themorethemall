package com.tmtm.hr;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HRDAO {

	ArrayList<HRDTO> hrlist();

}
