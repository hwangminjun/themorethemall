package com.tmtm.floor;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreService {
	
	@Autowired StoreDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ArrayList<StoreDTO> storeList(int floor) {
		logger.info("평면도 서비스");
		
		return dao.storeList(floor);
	}

	public ArrayList<StoreDTO> storeDet(int store_num) {
		logger.info("평면도 디테일 서비스");
		return dao.storeDet(store_num);
	}
	

}
