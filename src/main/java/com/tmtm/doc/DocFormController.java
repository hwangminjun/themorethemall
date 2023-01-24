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
	int det_doc_num=0;
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
	public HashMap<String, Object> docFormList(@RequestParam int page, @RequestParam String sort, @RequestParam String keyword, @RequestParam String option) {
		int offset = (page-1)*10;
		int totalCount = docFormService.docFormListCnt(sort, keyword,option);
		ArrayList<DocFormDTO> docFormList = docFormService.docFormList(sort, keyword, offset,option);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("docFormList", docFormList);
		map.put("total", totalPages);
		return map;
	}



	@ResponseBody
	@GetMapping(value = "/docForm/docFormDetailGo.ajax")
	public HashMap<String, Object> detail(@RequestParam int doc_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		det_doc_num=doc_num;
		return map;
	}

	@ResponseBody
	@GetMapping(value = "/docForm/getDocFormDetail.ajax")
	public HashMap<String, Object> getDocFormDetail() {
		DocFormDTO detail = docFormService.getDocFormDetail(det_doc_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("docFormDetail", detail);
		return map;
	}

	@ResponseBody
	@GetMapping(value = "/docForm/update.ajax")
	public HashMap<String, Object> update(@RequestParam String sort, @RequestParam String title, @RequestParam String content) {
		docFormService.update(det_doc_num, sort, title, content);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "/docForm/delete.ajax")
	public HashMap<String, Object> delete() {
		docFormService.delete(det_doc_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}

}
