package com.tmtm.floor;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ArrayList<StoreDTO> Micate(int val) {
		logger.info("마이너 카테고리 리스트 서비스");
		return dao.Micate(val);
	}

	public ArrayList<StoreDTO> selMicate(int val) {
		logger.info("선택된 마이너 카테고리 리스트 서비스");
		return dao.selMicate(val);
	}

	public int floorUp(HashMap<String, String> param) {
		logger.info("평면도 업데이트 서비스");
		dao.leaseUp(param);
		return dao.floorUp(param);
	}

	public int clear(HashMap<String, String> param) {
		logger.info("매장 초기화 서비스");
		return dao.clear(param);
	}

	public ArrayList<StoreDAO> emptyInfo(String sec_num) {
		logger.info("초기 구역 정보 서비스");
		return dao.emptyInfo(sec_num);
	}

	public int AddStore(HashMap<String, String> param) {
		logger.info("매장 추가 서비스");
		
		String floor = param.get("floor");
		String Micate = param.get("minor_category_num");
		String Macate = param.get("major_category_num");
		
		String minor_category_num = String.format("%02d", Integer.parseInt(Micate));
		String major_category_num = String.format("%02d", Integer.parseInt(Macate));
		
		int storeCount = dao.storeCount(floor);
		int newStoreNum = storeCount+1;
		String storeNum = String.format("%03d", newStoreNum);
		
		String store_num = floor+major_category_num+minor_category_num+storeNum;
		logger.info("store_num :" +store_num);
				
		param.put("store_num", store_num);
		
		dao.secState(param);
		dao.AddStore(param);
		
		
		
		
		return dao.leaseInfo(param);
	}
	

}
