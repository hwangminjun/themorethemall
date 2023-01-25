package com.tmtm.schedule;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScheduleController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ScheduleService scheduleService;
	
	@ResponseBody
	@GetMapping(value = "schedule/list.do")
	public HashMap<String, Object> schList(@RequestParam String team){
		
		ArrayList<ScheduleDTO> dates = scheduleService.list(team);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("date", dates);
		return map;
	}
	@ResponseBody
	@GetMapping(value = "schedule/insert.ajax")
	public HashMap<String, Object> insertSch(@RequestParam HashMap<String,Object> param,@RequestParam(value="members[]") ArrayList<String> members){
		boolean suc = scheduleService.insertSch(param, members);
		HashMap<String, Object> map = null;
		if(suc) {
			logger.info("^^");
			map=new HashMap<String, Object>();
		}
		return map;
	}
	@ResponseBody
	@GetMapping(value = "schedule/getCand.ajax")
	public HashMap<String, Object> getCand(@RequestParam int sch_num){
		ArrayList<ScheduleDTO> cands = scheduleService.getCand(sch_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cands",cands);
		return map;
	}
	@ResponseBody
	@GetMapping(value = "schedule/update.ajax")
	public HashMap<String, Object> updateSch(@RequestParam HashMap<String,Object> param,@RequestParam(value="members[]") ArrayList<String> members){
		scheduleService.updateSch(param, members);
		HashMap<String, Object> map = new HashMap<String, Object>();

		return map;
	}
	@ResponseBody
	@GetMapping(value = "schedule/delete.ajax")
	public HashMap<String, Object> deleteSch(@RequestParam int sch_num){
		scheduleService.deleteSch(sch_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	@ResponseBody
	@GetMapping(value = "schedule/type.ajax")
	public HashMap<String, Object> type() {
		
		ArrayList<String> typeList = scheduleService.typeList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", typeList);
		return map;
	}
	@ResponseBody
	@GetMapping(value = "schedule/candidator.ajax")
	public HashMap<String, Object> members(@RequestParam String team_num) {
		
		ArrayList<ScheduleDTO> member = scheduleService.member(team_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("members", member);
		return map;
	}
}
