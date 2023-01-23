package com.tmtm.fac;

import java.util.ArrayList;
import java.util.Date;
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
	
	public ArrayList<FacDTO> facList(String nowState) {

		return dao.facList(nowState);
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

	

	public ArrayList<FacDTO> bookList() {
		return dao.bookList();
	}

	public ArrayList<FacDTO> detail(String emp_num) {
		
		return dao.detail(emp_num);
	}

	public ArrayList<FacDTO> myBook(HashMap<String, Object> params) {
		logger.info("서비스 파람 : " + params);
		String book_start = (String) params.get("book_start");
		String book_end = (String) params.get("book_end");
		String emp_num = (String) params.get("emp_num");
		
		return dao.myBook(book_start,book_end,emp_num);
	}

	public int timeCheck(HashMap<String, Object> param) {
		String fac_num = (String) param.get("fac_num");

		String book_start = (String) param.get("book_start");
		String book_end = (String) param.get("book_end");
		logger.info("book_start : "+book_start);
		

		return dao.checkTime(fac_num, book_start, book_end);
	}

	public ArrayList<FacDTO> modalList(int book_num) {
		// TODO Auto-generated method stub
		return dao.modalList(book_num);
	}

	public boolean update(HashMap<String, Object> params, ArrayList<String> members) {
		FacDTO dto = new FacDTO();
		dto.setFac_num(Integer.parseInt((String) params.get("fac_num")));
		dto.setBook_start((String) params.get("book_start"));
		dto.setBook_end((String) params.get("book_end"));
		dto.setBook_num(Integer.parseInt((String) params.get("book_num")));
		dto.setEmp_num((String) params.get("emp_num"));
		
		
		boolean upList = dao.update(dto);
		logger.info("upList :!!!!!!!!!!!!!!!! " + upList);
		String emp_num = dto.getEmp_num();
		int book_num = dto.getBook_num();
		String msg = "작성자가 다릅니다.";
		if(upList) {
			for (int i = 0; i < members.size(); i++) {
				String mem = members.get(i);
				logger.info("예약 번호 : " + book_num);
				logger.info("mem : " + mem);
				dao.memUpdate(book_num,mem);
				}	
		}
		
		return upList;
	}

	public int delete(int book_num, int emp_num) {
		
		return dao.delete(book_num,emp_num);
	}

	public ArrayList<FacDTO> emp_num() {
		// TODO Auto-generated method stub
		return dao.emp_num();
	}



	public ArrayList<FacDTO> overlap(String nowState) {
		// TODO Auto-generated method stub
		return dao.overlap(nowState);
	}

	public ArrayList<FacDTO> nameList(int fac_num) {
		
		return dao.nameList(fac_num);
	}

	

	

	

	
	

	

}
