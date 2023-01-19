package com.tmtm.main;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO dao;

	public ArrayList<HashMap<String, String>> thisMonthGraph(String thisMonth) {
		
		return dao.thisMonthGraph(thisMonth);
	}

}
