package com.tmtm.msg;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MessageService msgservice;
	
	@PostMapping(value="/message/list.ajax")
	public HashMap<String, Object> message(@RequestParam int page){
		logger.info("list 요청 페이지 : "+page);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return msgservice.list(page);
		
	}
	

}
