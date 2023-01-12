package com.tmtm.manage;

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
public class ManageController {
	
	@Autowired ManageService mngservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="/manage/list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(@RequestParam int page) {
		logger.info("page : "+page);
		
		return mngservice.list(page);
	}
	
	@PostMapping(value = "/manage/authCheck.ajax")
	@ResponseBody
	public HashMap<String, Object> authCheck(@RequestParam String val){
		logger.info("직원별 권한 확인 컨트롤러");
		logger.info("val : "+val);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ManageDTO> authlist = mngservice.authlist();
		ArrayList<ManageDTO> emp_authlist = mngservice.authCheck(val);
		
		map.put("authlist", authlist);
		map.put("emp_authlist", emp_authlist);
				
		return map;
	}


}
