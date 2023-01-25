package com.tmtm.work;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;

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
		Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		sdf2.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
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
		
		Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// "yyyy-MM-dd HH:mm:ss"
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
		
		logger.info("현재 월 : {}", nowTime);
		
		return service.btnCheck(loginId, nowTime);
	}
	
	@GetMapping(value="/work/hiCheck.ajax")
	public HashMap<String, Object> hiCheck(HttpSession session){
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		
		String work_type = "정상";
		
		Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd 09:00:00");
		sdf2.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		
		String nowTime = sdf.format(date);
		String lateTime = sdf2.format(date);
		
		//logger.info("현재 시각 : {}", nowTime);
		//logger.info("지각 시각 : {}", lateTime);
		
		
		try {
			Date date1 = sdf.parse(nowTime);
			Date date2 = sdf2.parse(lateTime);
			//logger.info(date1.before(date2)+"");
			if(!date1.before(date2)) {
				work_type = "지각";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.hiCheck(nowTime,loginId,work_type);
		
		return map;
	}
	
	@GetMapping(value="/work/byeCheck.ajax")
	public HashMap<String, Object> byeCheck(HttpSession session){
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		
		Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.byeCheck(nowTime,loginId);
		
		return map;
	}
	
}
