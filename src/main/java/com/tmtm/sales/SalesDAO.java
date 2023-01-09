package com.tmtm.sales;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesDAO {

	ArrayList<SalesDTO> getSec(String val);

}
