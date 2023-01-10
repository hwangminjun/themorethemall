package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tmtm.msg.MessageDTO;

@Service
public class HRService {
	
	@Autowired HRDAO hrdao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ArrayList<HRDTO> hrlist() {
		logger.info("직원목록 리스트 서비스");
		return hrdao.hrlist();
	}

	public ArrayList<HRDTO> deplist() {
		logger.info("부서 목록 리스트 서비스");
		return hrdao.deplist();
	}
	
	
//	public HashMap<String, Object> hrlist(int page) {
//		logger.info("직원 목록 리스트 서비스");
//		
//		int offset = (page-1)*10;
//		
//		int totalCount = hrdao.totalCount();
//		logger.info("total count : "+totalCount);
//		
//		int totalPages = totalCount%10>0?(totalCount/10)+1 : (totalCount/10);
//		logger.info("totalPage : "+totalPages);
//		logger.info("totalPage 2 : "+Math.ceil(totalCount)/10);
//		
//		HashMap<String, Object> result = new HashMap<String, Object>();
//		result.put("total", totalPages);
//		result.put("list", hrdao.hrlist(offset));
//		
//		return result;
//	}


	

}
