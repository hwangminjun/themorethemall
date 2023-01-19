package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class FacManegeController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final FacManageService service;
	public FacManegeController(FacManageService service) {
		this.service = service;
	}
	

	
	@ResponseBody
	@GetMapping(value = "/facManage/list.ajax")
	public HashMap<String, Object> facList(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacManageDTO> facList = service.facList();
		map.put("facList", facList);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "/facManage/empList.ajax")
	public HashMap<String, Object> empChoice(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacManageDTO> charger = service.empChoice();
		map.put("charger", charger);
		return map;
	}
	
	@PostMapping(value = "/facManage/register.ajax")
	// form 태그는 name 으로 불러오기 때문에 반드시 가져올 태그의 name과 파라메터 값의 이름이 같아야함
	public String register(MultipartFile photo, @RequestParam HashMap<String, Object> params) {
		logger.info("파일 : "+photo);
		logger.info("params : {}" , params);
		
		service.insert(photo,params);
		String msg = "확인";
		
		return "redirect:/facManage.go";
	}
	
	
}
