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
import org.springframework.boot.autoconfigure.session.HazelcastSessionConfiguration.SpringBootHazelcastHttpSessionConfiguration;
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
		cal.add(Calendar.MONTH, -1);
		String preMonth = sdf.format(cal.getTime());
				
		logger.info(preMonth);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
}
