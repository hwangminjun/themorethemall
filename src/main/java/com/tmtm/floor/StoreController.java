package com.tmtm.floor;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreController {
	
	@Autowired StoreService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="/store/floorList.ajax")
	@ResponseBody
	public HashMap<String, Object> storeList(@RequestParam int floor){
		logger.info("평면도 컨트롤러");
		logger.info("floor : "+floor);
		
		ArrayList<StoreDTO> list = service.storeList(floor);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value="store/storeDet.ajax")
	@ResponseBody
	public HashMap<String, Object> storeDet(@RequestParam int store_num){
		logger.info("평면도 디테일 컨트롤러");
		logger.info("store_num : "+store_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> list = service.storeDet(store_num);
		map.put("list", list);
		
		return map;
	}
	

	
}
