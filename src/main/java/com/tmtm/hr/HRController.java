package com.tmtm.hr;

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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HRController {
	
	@Autowired HRService hrservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	
//	@PostMapping(value="/hr/list.ajax")
//	@ResponseBody
//	public HashMap<String, Object> hrlist(@RequestParam int page) {
//		logger.info("직원 목록 리스트 컨트롤러");
//		HashMap<String, Object> map = new HashMap<String, Object>();
//	
//		
//		return hrservice.hrlist(page);
//	}
	
	
	@PostMapping(value="/hr/list.ajax")
	@ResponseBody
	public HashMap<String, Object> hrlist() {
		logger.info("직원 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> hrlist = hrservice.hrlist();
		ArrayList<HRDTO> deplist = hrservice.deplist();
		logger.info("hrlist 사이즈: "+hrlist.size());
		logger.info("deplist 사이즈: "+deplist.size());
		map.put("list", hrlist);
		map.put("deplist", deplist);
		
		
		
		return map;
	}
	
	@GetMapping(value="/hr/teamlist.do")
	@ResponseBody
	public HashMap<String, Object> teamlist(@RequestParam String val) {
		logger.info("팀 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> teamlist = hrservice.teamlist(val);
		logger.info("teamlist 사이즈: "+teamlist.size());
		map.put("teamlist", teamlist);
		
		
		
		return map;
	}
	
	
	
//	@PostMapping(value="/hr/write.go")
//	public HashMap<String, Object> hradd() {
//		logger.info("직원 추가 컨트롤러");
//		logger.info("params : {}",params);
//		
//		return hrservice.;
//		
//	}
	
//	@PostMapping(value="/hr/deplist.ajax")
//	@ResponseBody
//	public HashMap<String, Object> hradd() {
//		logger.info("부서 리스트 불러오기");
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		ArrayList<HRDTO> deplist = hrservice.deplist();
//		logger.info("deplist 사이즈 : "+deplist.size());
//		map.put("deplist", deplist);
//		
//		return map;
//		
//	}
	

}
