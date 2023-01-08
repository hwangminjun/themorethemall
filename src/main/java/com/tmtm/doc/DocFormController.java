package com.tmtm.doc;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class DocFormController {


	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DocFormService docFormService;
	
	@ResponseBody
	@GetMapping(value = "/docForm/write.ajax")
	public HashMap<String, Object> docFormWrite(@RequestParam String title, @RequestParam String content, @RequestParam String writer, @RequestParam int sort) {
		logger.info("제목 : {}",title);
		logger.info("내용 : {}",content);
		logger.info("작성자 : {}",writer);
		logger.info("종류 : {}",sort);
		String page="docStyleCreate";
		int success = docFormService.docFormWrite(title, content, writer, sort);
		if(success>0) {
			page="docStyleList";
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		return map;
	}
	
	
	@ResponseBody
	@GetMapping(value = "/docForm/list.ajax")
	public HashMap<String, Object> docFormList() {
		ArrayList<DocFormDTO> docFormList = docFormService.docFormList();
		ArrayList<String> docFormSort = docFormService.docFormSort();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("docFormList", docFormList);
		map.put("docFormSort", docFormSort);
		return map;
	}
	
	
	@ResponseBody
	@GetMapping(value = "/docForm/sortSearch.ajax")
	public HashMap<String, Object> sortSearch(@RequestParam int sort) {
		ArrayList<DocFormDTO> sortSearchList = docFormService.sortSearchList(sort);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sortSearchList", sortSearchList);
		return map;
	}
	
	
	@ResponseBody
	@GetMapping(value = "/docForm/keywordSearch.ajax")
	public HashMap<String, Object> keywordSearch(@RequestParam String option, @RequestParam String keyword) {
		keyword="%"+keyword+"%";
		ArrayList<DocFormDTO> keywordSearchList = docFormService.keywordSearchList(option, keyword);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keywordSearchList", keywordSearchList);
		return map;
	}
	
	
	@ResponseBody
	@GetMapping(value = "/docForm/detail.ajax")
	public HashMap<String, Object> detail(@RequestParam int index, HttpSession session) {
		DocFormDTO detail = docFormService.detail(index);
		HashMap<String, Object> map = new HashMap<String, Object>();
		session.setAttribute("docFormInfo", detail);
		return map;
	}
	
}
