package com.tmtm.fac;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Controller
public class FacController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final FacService service;
	public FacController(FacService service) {
		this.service = service;
	}
	
	@GetMapping(value="/fac/list.ajax") //=------
	public HashMap<String, Object> home() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date date = new Date();
		SimpleDateFormat state = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowState = state.format(date);
		logger.info("nowState : " + nowState);
		ArrayList<FacDTO> facList = service.facList();
		int row = service.resCnt(nowState);
		//한시간 단위로 받을거면 받은값만 비교 +1
		map.put("facList", facList);
		map.put("row", row);
		return map;
	}
	 
	@GetMapping(value = "/fac/deplist.ajax")//=====
	public HashMap<String, Object> part(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> depList = service.part();
		ArrayList<FacDTO> book_num = service.book();
		logger.info("partList {}" + depList);
		map.put("book_num",book_num);
		map.put("depList", depList);
		return map;
	}
	
	@GetMapping(value = "/fac/teamlist.ajax")//=====
	public HashMap<String, Object> team(@RequestParam int dep_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> teamList = service.team(dep_num);
		logger.info("partList {}" + teamList);
		map.put("teamList", teamList);
		return map;
	}
	
	@GetMapping(value = "/fac/emplist.ajax")//=====
	public HashMap<String, Object> team(@RequestParam String team_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> empList = service.emp(team_num);
		logger.info("empList {}" + empList);
		map.put("empList", empList);
		return map;
	}
	
	
	 @GetMapping(value = "/fac/register.ajax")
	 public HashMap<String, Object>facRegister 
	 (@RequestParam HashMap<String, Object> param, @RequestParam(value="members[]") ArrayList<String> members){
		 logger.info("param:{}"+param);
		 String page = "facList";
		 HashMap<String, Object> map = new HashMap<String, Object>(); 
		 boolean row =service.regList(param,members);
		//service.state();
		 
		 if(row) {
			 page = "facDetail";
		 }
		 
		 map.put("page", page); 
		 return map; 
		 }
	 
	@GetMapping(value = "/fac/bookList.ajax")
	public HashMap<String, Object> bookList(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> bookList = service.bookList();
		map.put("bookList", bookList);
		return map;
	}
	
	@GetMapping(value = "/fac/detail.ajax")
	public HashMap<String, Object> detail(@RequestParam String emp_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> booker = service.detail(emp_num);
		map.put("booker", booker);
		return map;
	}
	
	@GetMapping(value = "/fac/myBookList.ajax")
	public HashMap<String, Object> regList(@RequestParam HashMap<String, Object> params){
		logger.info("받아왔어유~~~"+params);
		HashMap<String, Object>  map = new HashMap<String, Object>();
		ArrayList<FacDTO> myBookList = service.myBook(params);
		logger.info("myBookList" + myBookList);
		map.put("myBookList", myBookList);
		return map;
	}
	
	
	
	
	
	
	
}
