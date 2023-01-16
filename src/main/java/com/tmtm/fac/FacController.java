package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		ArrayList<FacDTO> facList = service.facList();
		map.put("facList", facList);
		return map;
	}
	
	@GetMapping(value = "fac/reg.go.ajax")
	public HashMap<String, Object> register(@RequestParam int fac_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> bookList = service.register(fac_num);
		map.put("bookList", bookList);
		return map;
	}
	
	/*
	 * @GetMapping(value = "/fac/register.ajax") public HashMap<String, Object>
	 * facDetail() { logger.info("셀렉 컨트롤러"); HashMap<String, Object> map = new
	 * HashMap<String, Object>(); ArrayList<FacDTO> facility = service.select();
	 * logger.info("facility : {}" + facility); map.put("facility", facility);
	 * return map; }
	 */

	
	@GetMapping(value = "/fac/bookList.ajax") //======
	public HashMap<String, Object> facBookList(@RequestParam int fac_num){   
		logger.info("fac_num"+ fac_num);
		HashMap<String, Object> map = new HashMap<String, Object>(fac_num);
		ArrayList<FacDTO> facBookList = service.facBookList(fac_num);
		map.put("facBookList", facBookList);
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
	
	
	 @GetMapping(value = "fac/register.ajax")
	 public HashMap<String, Object>facRegister 
	 (@RequestParam HashMap<String, Object> param){
		 logger.info("param:{}"+param);
		 String page = "facList";
		 HashMap<String, Object> map = new HashMap<String, Object>(); 
		 boolean row =service.regList(param);
		 //ArrayList<FacDTO> regListTwo = service.regListTwo(emp_num);
		 
		 if(row) {
			 page = "facDetail";
		 }
		 //map.put("regListTwo", regListTwo); 
		 map.put("page", page); 
		 return map; 
		 }
	 
	
	
	
	
	
	
	
	
	
}
