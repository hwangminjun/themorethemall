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

		return dao.facList();
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



	
	
	/*
	 * public ArrayList<FacDTO> modFac(int fac_num) { // TODO Auto-generated method
	 * stub return dao.modFac(fac_num); }
	 */

	
	public boolean regList(HashMap<String, Object> param, ArrayList<String> members) {
		FacDTO facDto = new FacDTO();
		
		facDto.setFac_num(Integer.parseInt((String) param.get("fac_num")));		
		facDto.setBook_start((String) param.get("book_start"));
		facDto.setBook_end((String) param.get("book_end"));
		facDto.setEmp_num((String) param.get("emp_num"));
		
		boolean insSuc = dao.regList(facDto);
		logger.info("성공 여부 : " + insSuc);
		int book_num = facDto.getBook_num();
		logger.info("예약 번호 입니다요 : " + book_num);
		if(insSuc) {
			for (int i = 0; i < members.size(); i++) {
				String mem = members.get(i);
				logger.info("예약 번호 : " + book_num);
				logger.info("mem : " + mem);
				dao.bookMem(book_num, mem);
			}
			
		}
		
		return insSuc;
	}

	public ArrayList<FacDTO> book() {
		// TODO Auto-generated method stub
		return dao.book();
	}

	public int resCnt(String nowState) {
	
		return dao.resCnt(nowState);
	}

	public ArrayList<FacDTO> bookList() {
		return dao.bookList();
	}

	public ArrayList<FacDTO> detail(String emp_num) {
		
		return dao.detail(emp_num);
	}

	public ArrayList<FacDTO> myBook(HashMap<String, Object> params) {
		logger.info("서비스 파람 : " + params);
		return dao.myBook(params);
	}

	

	

	
	

	

}
