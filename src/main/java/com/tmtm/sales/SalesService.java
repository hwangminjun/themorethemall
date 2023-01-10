package com.tmtm.sales;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SalesDAO dao;
	
	public ArrayList<SalesDTO> getSec(String val) {
		
		return dao.getSec(val);
	}

	public ArrayList<HashMap<String, String>> getGraph(HashMap<String, String> params) {
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		String date = params.get("time");
		logger.info(date);
		
		return dao.getGraph(params);
	}

}
