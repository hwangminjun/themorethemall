package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping(value="/fac/list.ajax")
	public HashMap<String, Object> home() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> facList = service.facList();
		map.put("facList", facList);
		return map;
	}
	
	@GetMapping(value = "/fac/detail.go")
	public HashMap<String, Object> detail(@RequestParam int fac_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> bookList = service.detail(fac_num);
		map.put("bookList", bookList);
		return map;
	}
	
	
	
	
	
}
