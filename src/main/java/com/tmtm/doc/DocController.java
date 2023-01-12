package com.tmtm.doc;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.smile.MappingJackson2SmileHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
