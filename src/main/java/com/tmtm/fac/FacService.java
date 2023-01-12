package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;



@Service
public class FacService {
	Logger logger = LoggerFactory.getLogger(getClass());
	private final FacDAO dao;
	public FacService (FacDAO dao) {
		this.dao=dao;
	}
	
	public ArrayList<FacDTO> facList() {
		// TODO Auto-generated method stub
		return dao.facList();
	}

	public ArrayList<FacDTO> register(int fac_num) {
		
		return dao.register(fac_num);
	}

	public ArrayList<FacDTO> select() {
		logger.info("서비스다 시발");
		return dao.select();
	}

	public ArrayList<FacDTO> facBookList(int fac_num) {
		
		return dao.facBookList(fac_num);
	}

	public ArrayList<FacDTO> part() {
		return dao.part();
	}

	public ArrayList<FacDTO> team(int dep_num) {
		
		return dao.team(dep_num);
	}

	public ArrayList<FacDTO> emp(String team_num) {
		
		return dao.emp(team_num);
	}

	public ArrayList<FacDTO> partList(HashMap<String, String> params) {
		
		return null;
	}

	

	

}
