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
	
	@PostMapping(value = "/facManage/register.do")
	// form 태그는 name 으로 불러오기 때문에 반드시 가져올 태그의 name과 파라메터 값의 이름이 같아야함
	public String register(MultipartFile photo, @RequestParam HashMap<String, Object> params) {
		logger.info("파일 : "+photo);
		logger.info("params : {}" , params);
		
		service.insert(photo,params);
		
		
		return "redirect:/facManage.go";
	}
	
	
	@PostMapping(value = "/facManage/update.do")
	public String update(MultipartFile modifyfacPhoto, @RequestParam HashMap<String, Object> params, RedirectAttributes rAttr){
		
		logger.info("modifyfacPhoto : " +modifyfacPhoto);
		//modifyfacPhoto.isEmpty();
		logger.info("params : {}", params);
		String param1 = (String) params.get("fac_num");
		String param2 = (String) params.get("fac_name");
		String param3 = (String) params.get("emp_num");
		logger.info(param1);
		logger.info(param2);
		logger.info(param3);
		String msg = "";
		String page = "redirect:/facManage.go";
		if(modifyfacPhoto.isEmpty()) {
			msg = "사진을 입력하세요";
		}else if(param2 == "") {
			msg = "시설명을 입력하세요";
		}else if(param3 == "==책임자를 선택하세요=="){
			msg = "책임자를 선택하세요";
		}else {
			service.update(modifyfacPhoto, params);
			
			msg="수정이 완료되었습니다";
		}
		
		rAttr.addFlashAttribute("msg",msg);
		
		return page;
	}
	
	
	
	
	
	
	
}
