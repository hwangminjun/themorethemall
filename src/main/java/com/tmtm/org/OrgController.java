package com.tmtm.org;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrgController {
	
	@Autowired OrgService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="org/orgList.ajax")
	@ResponseBody
	public HashMap<String, Object> orgList(){
		logger.info("조직도 리스트 컨트롤러");
		ArrayList<OrgDTO> list = service.orgList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
				
		
		
		return map;
	}

}
