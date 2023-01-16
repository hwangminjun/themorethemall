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

	public ArrayList<FacDTO> teamList(int dep_num) {
		
		return dao.teamList(dep_num);
	}



	
	

	public ArrayList<FacDTO> modFac(int fac_num) {
		// TODO Auto-generated method stub
		return dao.modFac(fac_num);
	}

	
	public ArrayList<FacDTO> regList(int fac_num, String emp_num, String book_start, String book_end) {
		// TODO Auto-generated method stub
		return dao.regList(fac_num,emp_num,book_start,book_end);
	}

	/*
	 * public ArrayList<FacDTO> regListTwo(String emp_num) {
	 * 
	 * return dao.regListTwo(emp_num); }
	 */

	public ArrayList<FacDTO> book() {
		// TODO Auto-generated method stub
		return dao.book();
	}

	

	
	

	

}
