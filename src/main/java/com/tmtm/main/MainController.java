package com.tmtm.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainService service;
	
	@GetMapping(value="/")
	public String main(Model model, HttpSession session) {
		
		return "login";
	}
	
	@GetMapping(value="/index.go")
	public String index(Model model) {
		model.addAttribute("page", "main");
		return "index";
	}
	
	@GetMapping(value="/{page}.go")
	public String innerPage(Model model, @PathVariable String page, HttpSession session) {

		model.addAttribute("page", page);
		return "index";
	}
	
	@GetMapping(value="/main/thisMonthGraph.ajax")
	@ResponseBody
	public HashMap<String, Object> thisMonthGraph(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String thisMonth = sdf.format(date);
		logger.info(thisMonth);
		ArrayList<HashMap<String, String>> list = service.thisMonthGraph(thisMonth);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping(value="/main/preMonthComp.ajax")
	@ResponseBody
	public HashMap<String, Object> preMonthComp(){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Calendar cal = Calendar.getInstance();
		String thisMonth = sdf.format(cal.getTime());
		cal.add(cal.MONTH, -1);
		String preMonth = sdf.format(cal.getTime());
				
		//logger.info("전월 : "+preMonth);
		
		String percent = service.preMonthComp(thisMonth, preMonth);
		
		logger.info("증감률 소수점 결과! : {}", percent);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("percent", percent);
		
		return map;
	}
	
	@GetMapping(value="/main/getDocInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> getDocInfo(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		
		logger.info("로그인 아이디 : "+loginId);
		
		int docSeq = service.getDocInfoSeq(loginId);
		int docWait = service.getDocInfoWait(loginId);
		
		logger.info("결재 순서 개수 : "+docSeq);
		logger.info("결재 대기 개수 : "+docWait);
		
		map.put("docSeq", docSeq);
		map.put("docWait", docWait);
		
		return map;
	}
	
	@GetMapping(value="/main/getSchedule.ajax")
	@ResponseBody
	public HashMap<String, Object> getSchedule(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		int team_num = loginDTOs.getTeam_num();
		
		logger.info("팀 번호 : {}", team_num);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime = sdf.format(date);
		
		ArrayList<HashMap<String, String>> list = service.getSchedule(team_num, nowTime);
		map.put("schdule", list);
		
		return map;
	}
	
	@GetMapping(value="/main/getFac.ajax")
	@ResponseBody
	public HashMap<String, Object> getFac(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String emp_num = loginDTOs.getEmp_num();
		
		logger.info("사원 번호 : {}",emp_num);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime = sdf.format(date);
		
		ArrayList<HashMap<String, String>> list = service.getFac(emp_num, nowTime);
		map.put("fac", list);
		
		return map;
	}
}
