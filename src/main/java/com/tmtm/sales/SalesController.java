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
	
	@GetMapping(value="/sales/graph")
	@ResponseBody
	public HashMap<String, Object> getGraph(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		ArrayList<HashMap<String, String>> list= service.getGraph(params);
		//logger.info(list.size()+"");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
}
