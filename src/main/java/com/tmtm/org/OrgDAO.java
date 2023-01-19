package com.tmtm.org;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrgDAO {

	ArrayList<OrgDTO> orgList();

}
