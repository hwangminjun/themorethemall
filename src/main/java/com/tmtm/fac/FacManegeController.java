package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
	
	
	
	@ResponseBody// 시설 추가 파일 업로드 
	@PostMapping(value = "/facManage/register.ajax")
	public HashMap<String, Object> resgister(MultipartFile photo, String fac_name, String emp_num, String color){
		
		logger.info("photo : "+photo.getOriginalFilename());
		logger.info("fac_name : "+fac_name);
		logger.info("emp_num : "+emp_num);

		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean row = service.register(photo,fac_name,emp_num,color);
		String page = "redirect:/";
		if(row) {
			page = "facManage";
		}
		
		map.put("row", row);
		map.put("page", page);
		return map;
	}
	
	@ResponseBody//시설 수정 파일 업로드 
	@PostMapping(value = "/facManage/update.ajax")
	public HashMap<String, Object> update(MultipartFile photo, String fac_num, String fac_name, String emp_num, String color){
		
		logger.info("photo : "+photo.getOriginalFilename());
		logger.info("fac_name : "+fac_name);
		logger.info("emp_num : "+emp_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = service.update(photo,fac_num,fac_name,emp_num,color);
		String msg = "수정에 실패하였습니다. 내용을 확인해주세요.";
		if(row == 1) {
			msg = "수정에 성공하였습니다.";
		}
		
		map.put("row", row);
		map.put("msg", msg);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "facManage/delete.ajax")
	public HashMap<String, Object> delete(@RequestParam int fac_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String page = "";
		boolean delete = service.delete(fac_num);
		if(delete) {
			page = "facManage";
		}
		map.put("page", page);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
}
