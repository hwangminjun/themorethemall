package com.tmtm.doc;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DocController {

	@Autowired DocService docService;
	Logger logger = LoggerFactory.getLogger(getClass());

	@ResponseBody
	@GetMapping(value = "/doc/docSort.ajax")
	public HashMap<String, Object> callSort(){

		ArrayList<DocDTO> sort = docService.sort();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		return map;
	}

	@ResponseBody
	@GetMapping(value = "/doc/docFormList.ajax")
	public HashMap<String, Object> callForm(@RequestParam String docType){

		ArrayList<DocDTO> form = docService.form(docType);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("form", form);
		return map;
	}


	@ResponseBody
	@GetMapping(value = "/doc/callFormContent.ajax")
	public HashMap<String, Object> formContent(@RequestParam String formNum){

		String content = docService.formContent(formNum);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content", content);
		return map;
	}



	@ResponseBody
	@GetMapping(value = "/doc/line.ajax")
	public HashMap<String, Object> lineList(){

		ArrayList<String> teamList = docService.teamList();
		ArrayList<DocDTO> lineList = docService.lineList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("emplist", lineList);
		map.put("teamlist", teamList);
		return map;
	}


	@ResponseBody
	@GetMapping(value = "/doc/floor.ajax")
	public HashMap<String, Object> floorList(){

		ArrayList<String> floorList = docService.floor();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", floorList);
		return map;
	}


	@ResponseBody
	@PostMapping(value = "/doc/section.ajax")
	public HashMap<String, Object> sectionList(@RequestParam String floor){
		ArrayList<DocDTO> sectionList = docService.sectionList(floor);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", sectionList);
		return map;
	}

	
	@ResponseBody
	@GetMapping(value = "/doc/manageStore.ajax")
	public HashMap<String, Object> store(@RequestParam String emp_num){
		ArrayList<DocDTO> sectionList = docService.storeList(emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("store", sectionList);
		return map;
	}

	
	
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping(value = "/doc/availableDate.ajax") public HashMap<String, Object>
	 * getDisDates(@RequestParam String date){
	 * 
	 * 
	 * ArrayList<> dateList = docService.dateList(date); //해당 날짜에 작성된 가게 목록 조회
	 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("list",
	 * dateList); return map; }
	 */
	
	
	  @ResponseBody
	  @GetMapping(value = "/doc/unsignedStore.ajax")
	  public HashMap<String, Object> getUnsignedStore(@RequestParam String emp_num, @RequestParam String date){
		  ArrayList<DocDTO> unStoreList = docService.unsignedStore(emp_num, date);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("list", unStoreList);
	  
		  return map; 
	  }
	 
	
	  
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/myDisDocList.ajax")
	  public HashMap<String, Object> myDisDocList(@RequestParam String emp_num, @RequestParam String doc_state_num, @RequestParam int doc_sort
			  , @RequestParam String content, @RequestParam int page){
		  
		  return docService.myDisDocList(emp_num, doc_state_num, doc_sort, content, page); 
	  }
	  
	  
	  @GetMapping(value = "/doc/docDetail.do")
	  public String docDetail(RedirectAttributes rAttr, @RequestParam int doc_num, HttpSession session) {
		  
		  HashMap<String, Object> doc = docService.getDocDetail(doc_num);
		  rAttr.addFlashAttribute("doc", doc);
		  //session.setAttribute("doc", doc);
		  //logger.info("session DOC : {}",session.getAttribute("doc"));
		  
		  return "redirect:/docDisDet.go";
	  }
	  
	  
	  
	  
}
