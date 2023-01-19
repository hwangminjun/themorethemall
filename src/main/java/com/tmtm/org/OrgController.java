package com.tmtm.org;

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
public class OrgController {
	
	@Autowired OrgService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="org/orgList.ajax")
	@ResponseBody
	public HashMap<String, Object> orgList(){
		logger.info("조직도 리스트 컨트롤러");
		
		ArrayList<OrgDTO> mdList = service.mdList();
		ArrayList<OrgDTO> hrList = service.hrList();
		ArrayList<OrgDTO> secretaryList = service.secretaryList();
		ArrayList<OrgDTO> salesList = service.salesList();
		ArrayList<OrgDTO> operateList = service.operateList();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mdList", mdList);
		map.put("hrList", hrList);
		map.put("secretaryList", secretaryList);
		map.put("salesList", salesList);
		map.put("operateList", operateList);
				
		return map;
	}
	
	@PostMapping(value="org/empName.ajax")
	@ResponseBody
	public HashMap<String, Object> empName(@RequestParam int team_num){
		logger.info("조직도 직원 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<OrgDTO> list = service.empName(team_num);
		
		map.put("list", list);
		
		
		return map;
	}
	
	@PostMapping(value="org/empInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> empInfo(@RequestParam String emp_num){
		logger.info("조직도 직원 정보 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<OrgDTO> list = service.empInfo(emp_num);
		
		map.put("list", list);
		
		
		return map;
	}
	
	@PostMapping(value="org/chairInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> chairInfo(){
		logger.info("조직도 사장 정보 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<OrgDTO> list = service.chairInfo();
		
		map.put("list", list);
		
		
		return map;
	}
	
	

}
