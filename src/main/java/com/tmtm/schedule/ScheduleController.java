package com.tmtm.schedule;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScheduleController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ScheduleService scheduleService;
	
	@ResponseBody
	@GetMapping(value = "schedule/list.do")
	public HashMap<String, Object> schList(){
		
		ArrayList<ScheduleDTO> dates = scheduleService.list();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("date", dates);
		return map;
	}
	
}
