package com.tmtm.org;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrgDAO {

	ArrayList<OrgDTO> orgList();

	ArrayList<OrgDTO> mdList();

	ArrayList<OrgDTO> hrList();

	ArrayList<OrgDTO> secretaryList();

	ArrayList<OrgDTO> salesList();

	ArrayList<OrgDTO> operateList();

	ArrayList<OrgDTO> empName(int team_num);

	ArrayList<OrgDTO> empInfo(String emp_num);

	ArrayList<OrgDTO> chairInfo();

}
