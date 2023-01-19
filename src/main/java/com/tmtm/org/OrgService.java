package com.tmtm.org;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrgService {
	
	@Autowired OrgDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ArrayList<OrgDTO> mdList() {
		logger.info("MD 리스트 서비스");
		return dao.mdList();
	}
	public ArrayList<OrgDTO> hrList() {
		logger.info("인사 리스트 서비스");
		return dao.hrList();
	}
	public ArrayList<OrgDTO> secretaryList() {
		logger.info("총무 리스트 서비스");
		return dao.secretaryList();
	}
	public ArrayList<OrgDTO> salesList() {
		logger.info("영업 리스트 서비스");
		return dao.salesList();
	}
	public ArrayList<OrgDTO> operateList() {
		logger.info("운영 리스트 서비스");
		return dao.operateList();
	}
	public ArrayList<OrgDTO> empName(int team_num) {
		logger.info("조직도 직원 서비스");
		return dao.empName(team_num);
	}
	public ArrayList<OrgDTO> empInfo(String emp_num) {
		logger.info("조직도 직원 정보 서비스");
		return dao.empInfo(emp_num);
	}
	public ArrayList<OrgDTO> chairInfo() {
		logger.info("조직도 사장 정보 서비스");
		return dao.chairInfo();
	}
	


}
