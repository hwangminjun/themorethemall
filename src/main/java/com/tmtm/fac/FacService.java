package com.tmtm.fac;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class FacService {

	private final FacDAO dao;
	public FacService (FacDAO dao) {
		this.dao=dao;
	}
	
	public ArrayList<FacDTO> facList() {
		// TODO Auto-generated method stub
		return dao.facList();
	}

	public ArrayList<FacDTO> detail(int fac_num) {
		
		return dao.detail(fac_num);
	}

}
