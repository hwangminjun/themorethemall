package com.tmtm.sales;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SalesController {

	@Autowired SalesService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/sales/sec")
	@ResponseBody
	public HashMap<String, Object> getSec(@RequestParam String val){
		logger.info(val);
		ArrayList<SalesDTO> list = service.getSec(val);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sec", list);
		
		return map;
	}
	
	@GetMapping(value="/sales/secGraph")
	@ResponseBody
	public HashMap<String, Object> getSecGraph(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		ArrayList<HashMap<String, String>> list= service.getSecGraph(params);
		//logger.info(list.size()+"");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping(value="/sales/store")
	@ResponseBody
	public HashMap<String, Object> getStore(@RequestParam String val){
		logger.info(val);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SalesDTO> list = service.getStore(val);
		map.put("store", list);
		
		return map;
	}
	
	@GetMapping(value="/sales/storeGraph")
	@ResponseBody
	public HashMap<String, Object> getStoreGraph(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		ArrayList<HashMap<String, String>> list= service.getStoreGraph(params);
		//logger.info(list.size()+"");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping(value="/sales/compGraph")
	@ResponseBody
	public HashMap<String, Object> getCompGraph(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		// {type=section, comp1=1-1, comp2=2-1, start=2022-01-11, end=2022-03-11, time=date}
		
		String comp1 = params.get("comp1");
		String comp2 = params.get("comp2");
		String start = params.get("start");
		String end = params.get("end");
		String time = params.get("time");
		
		ArrayList<HashMap<String, String>> listComp1 = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String, String>> listComp2 = new ArrayList<HashMap<String,String>>();
		
		if(params.get("type").equals("section")) { // 구역 비교일 때
			params.put("sec", comp1);
			listComp1 = service.getSecGraph(params);
			params.put("sec", comp2);
			listComp2 = service.getSecGraph(params);
		}else{ // 점포 비교일 때
			params.put("store", comp1);
			listComp1 = service.getStoreGraph(params);
			params.put("store", comp2);
			listComp2 = service.getStoreGraph(params);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listComp1", listComp1);
		map.put("listComp2", listComp2);
		
		return map;
	}
	
	@GetMapping(value="/sales/curStd")
	@ResponseBody
	public HashMap<String, Object> getCurStd(){
		
		String curStd = service.getCurStd();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("curStd", curStd);
		
		return map;
	}
	
	@GetMapping(value="/sales/regStd")
	@ResponseBody
	public HashMap<String, Object> regStd(@RequestParam String val){
		//logger.info(val);
		service.regStd(val);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
	
	@GetMapping(value="/sales/specialList")
	@ResponseBody
	public HashMap<String, Object> specialList(@RequestParam int page){
		logger.info(page+"");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
}
