package com.tmtm.work;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmtm.sales.SalesDTO;

@Service
public class WorkService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired WorkDAO dao;

	public HashMap<String, Object> workList(String loginId, int page) {
		int offset = (page-1)*15;
		int totalCount = dao.workListCount(loginId);
		logger.info("총 개수 : " + totalCount);
		int totalPages = totalCount%15>0?(totalCount/15)+1:(totalCount/15);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HashMap<String, String>> list = dao.workList(loginId,offset);
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
	}

	public HashMap<String, Object> showMonth(String monthFirst, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> work = dao.showMonthWork(monthFirst, loginId);
		HashMap<String, String> attend = dao.showMonthAttend(monthFirst, loginId);
		
		map.put("work", work);
		map.put("attend", attend);
		
		return map;
	}

	public HashMap<String, Object> btnCheck(String loginId, String nowTime) {
		int rowHi = dao.btnHiCheck(loginId, nowTime); 
		int rowBye = dao.btnByeCheck(loginId, nowTime); 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rowHi", rowHi);
		map.put("rowBye", rowBye);
		
		return map;
	}

	public void hiCheck(String nowTime, String loginId, String work_type) {
		dao.hiCheck(nowTime,loginId,work_type);
		
	}

	public void byeCheck(String nowTime, String loginId) {
		dao.byeCheck(nowTime, loginId);
		
	}

}
