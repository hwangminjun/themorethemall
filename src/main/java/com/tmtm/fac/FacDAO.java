package com.tmtm.fac;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacDAO {

	ArrayList<FacDTO> facList();

	ArrayList<FacDTO> detail(int fac_num);

	ArrayList<FacDTO> select();

}
