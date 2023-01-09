package com.tmtm.msg;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	
	@Autowired MessageDAO msgdao;
	Logger logger =  LoggerFactory.getLogger(getClass());
	
	public HashMap<String, Object> list(int page) {
		int offset = (page-1)*10;
		
		int totalCount = msgdao.totalCount();
		logger.info("total count : "+totalCount);
		
		int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
		
		logger.info("총 페이지 수 : "+totalPages);
		logger.info("총페이지 수2 : "+Math.ceil(totalCount)/10);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", msgdao.list(offset));
				
		return result;
	}

}
