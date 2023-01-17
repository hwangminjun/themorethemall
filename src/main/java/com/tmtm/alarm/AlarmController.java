package com.tmtm.alarm;

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
public class AlarmController {
	
	@Autowired AlarmService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="alarm/list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(@RequestParam String emp_num){
		logger.info("알람 리스트 컨트롤러");
		logger.info("emp_num : "+emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AlarmDTO> list = service.list(emp_num);
		map.put("list", list);
		
		return map;
	}

}
