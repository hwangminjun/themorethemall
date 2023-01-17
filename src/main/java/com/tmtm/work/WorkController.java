package com.tmtm.work;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	
	@GetMapping(value="/work/showMonth.ajax")
	public HashMap<String, Object> showMonthWork(HttpSession session){
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date date = new Date();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		String nowTime2 = sdf2.format(date);
		
		//logger.info("현재 월 : {}", nowTime2); 
		// 현재 월 : 2023-01
		//logger.info(nowTime2+"-01"); 
		// 2023-01-01
		String monthFirst = nowTime2;
		
		return service.showMonth(monthFirst,loginId);
	}
	
	@GetMapping(value="/work/btnCheck.ajax")
	public HashMap<String, Object> btnCheck(HttpSession session){
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// "yyyy-MM-dd HH:mm:ss"
		String nowTime = sdf.format(date);
		
		logger.info("현재 월 : {}", nowTime);
		
		return service.btnCheck(loginId, nowTime);
	}
	
}
