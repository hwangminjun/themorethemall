package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HRController {
	
	@Autowired HRService hrservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="/hr/list.ajax")
	@ResponseBody
	public HashMap<String, Object> hrlist() {
		logger.info("직원 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> hrlist = hrservice.hrlist();
		logger.info("hrlist 사이즈: "+hrlist.size());
		map.put("list", hrlist);
		
		return map;
	}

}
