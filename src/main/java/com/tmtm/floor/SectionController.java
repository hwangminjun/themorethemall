package com.tmtm.floor;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SectionController {
	
	@Autowired SectionService secservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="/section/list.ajax")
	@ResponseBody
	public HashMap<String, Object> secList(@RequestParam int page){
		logger.info("구역 리스트 컨트롤러");
		logger.info("param : "+page);

		return secservice.secList(page);
	}
	
	@PostMapping(value="/section/secDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> secDetail(@RequestParam String section_num){
		logger.info("구역 디테일 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SectionDTO> list = secservice.secDetail(section_num);
		
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value="/section/teamDrop.ajax")
	@ResponseBody
	public HashMap<String, Object> detailDrop(){
		logger.info("디테일 드롭다운 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SectionDTO> teamlist = secservice.teamDrop();
		
		map.put("teamlist", teamlist);
		
		return map;
	}
	
	@PostMapping(value="/section/empList.ajax")
	@ResponseBody
	public HashMap<String, Object> empList(@RequestParam int val){
		logger.info("디테일 직원 드롭다운 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SectionDTO> empList = secservice.empList(val);
		
		map.put("empList", empList);
		
		return map;
	}
	
	@PostMapping(value="/section/teamlist.ajax")
	@ResponseBody
	public HashMap<String, Object> teamlist(@RequestParam int val){
		logger.info("디테일 팀 재생성 드롭다운 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SectionDTO> list = secservice.teamlist(val);
		
		map.put("list", list);
		
		return map;
	}
	

	@PostMapping(value="/section/infoUp.ajax")
	@ResponseBody
	public HashMap<String, Object> infoUp(@RequestParam HashMap<String, String> params){
		logger.info("수정 컨트롤러");
		logger.info("params : {}",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = secservice.infoUp(params);
		logger.info("수정된 구역 수 : "+row);
		
		String  page = "sectionList";
		map.put("page", page);
		
		
		return map;
	}
	
	
	@PostMapping(value="/store/searchList.ajax")
	@ResponseBody
	public HashMap<String, Object> searchList(@RequestParam int page, @RequestParam String detailContent, @RequestParam String sl1) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("detailContent", detailContent);
		params.put("sl1", sl1);
		
		
		return secservice.searchList(params, page);
	}
	
	
	
	
	
	
	
	

}
