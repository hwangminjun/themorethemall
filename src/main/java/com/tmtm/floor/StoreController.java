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
	
	
	@PostMapping(value="store/Micate.ajax")
	@ResponseBody
	public HashMap<String, Object> Micate(@RequestParam int val){
		logger.info("마이너 카테고리 리스트 컨트롤러");
		logger.info("val : "+val);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> list = service.Micate(val);
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value="store/selMicate.ajax")
	@ResponseBody
	public HashMap<String, Object> selMicate(@RequestParam int val){
		logger.info("저장된 마이너 카테고리 리스트 컨트롤러");
		logger.info("val : "+val);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> list = service.selMicate(val);
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value="store/floorUp.ajax")
	@ResponseBody
	public HashMap<String, Object> floorUp(@RequestParam HashMap<String, String> param){
		logger.info("저장된 마이너 카테고리 리스트 컨트롤러");  
		logger.info("param : {}"+param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row= service.floorUp(param);
		
		String page = "floor";
		map.put("page", page);
		
		return map;
	}
	
	@PostMapping(value="store/clear.ajax")
	@ResponseBody
	public HashMap<String, Object> clear(@RequestParam HashMap<String, String> param){
		logger.info("매장 초기화 컨트롤러");  
		logger.info("param : {}"+param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row= service.clear(param);
		
		String page = "floor";
		map.put("page", page);
		
		return map;
	}
	
	@PostMapping(value="store/emptyInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> emptyInfo(@RequestParam String sec_num){
		logger.info("초기 구역 정보 컨트롤러");  
		logger.info("param : "+sec_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDAO> list= service.emptyInfo(sec_num);
		
		map.put("list", list);
	
		
		return map;
	}
	
	@PostMapping(value="store/AddStore.ajax")
	@ResponseBody
	public HashMap<String, Object> AddStore(@RequestParam HashMap<String, String> param){
		logger.info("매장 추가 컨트롤러");  
		logger.info("param : {}",param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row= service.AddStore(param);
		logger.info("추가된 매장 수 : "+row);
		
		
		String page = "floor";
		map.put("page", page);
		
		return map;
	}
	

	
}
