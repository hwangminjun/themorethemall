package com.tmtm.alarm;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AlarmController {
	
	@Autowired AlarmService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="alarm/list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(@RequestParam String emp_num){
		logger.info("알람 리스트 컨트롤러");
		logger.info("emp_num : "+emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AlarmDTO> list = service.list(emp_num);
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping(value="alarm/alarmNum.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmNum(@RequestParam String emp_num){
		logger.info("알람 숫자 컨트롤러");
		logger.info("emp_num : "+emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AlarmDTO> list = service.alarmNum(emp_num);
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping(value="alarm/detailInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> detailInfo(@RequestParam int alarm_num){
		logger.info("알람 디테일 정보 컨트롤러");
		logger.info("alarm_num : "+alarm_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AlarmDTO> list = service.detailInfo(alarm_num);
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value="alarm/alarmDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmDetail(@RequestParam HashMap<String, String> param){
		logger.info("알람 디테일 정보 보기 컨트롤러");
		logger.info("param : {} ",param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AlarmDTO> list = service.alarmDetail(param);
		map.put("list", list);
		
		return map;
	}

}
