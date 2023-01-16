package com.tmtm.work;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tmtm.main.LoginDTO;

@RestController
public class WorkController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired WorkService service;
	
	@GetMapping(value="/work/workList.ajax")
	public HashMap<String, Object> workList(@RequestParam int page, HttpSession session){
		logger.info("근태 리스트 호출");
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		logger.info(loginId);
		
		return service.workList(loginId, page);
	}
}
