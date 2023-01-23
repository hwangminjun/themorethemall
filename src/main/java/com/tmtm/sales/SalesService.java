package com.tmtm.sales;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SalesDAO dao;
	
	public ArrayList<SalesDTO> getSec(String val) {
		
		return dao.getSec(val);
	}

	public ArrayList<HashMap<String, String>> getSecGraph(HashMap<String, String> params) {
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		String date = params.get("time");
		logger.info(date);
		
		return dao.getSecGraph(params);
	}

	public ArrayList<SalesDTO> getStore(String val) {
		ArrayList<SalesDTO> listSec = dao.getSec(val);
		ArrayList<SalesDTO> listStore = new ArrayList<SalesDTO>();
		
		for(int i=0; i<listSec.size(); i++) {
			String secNum = listSec.get(i).getSection_num();
			listStore.add(dao.getStore(secNum));
		}
		logger.info(listStore.size()+"");
		
		return listStore;
	}

	public ArrayList<HashMap<String, String>> getStoreGraph(HashMap<String, String> params) {

		return dao.getStoreGraph(params);
	}

	public String getCurStd() {
		
		return dao.getCurStd();
	}

	public void regStd(String val) {
		dao.regStd(val);
		
	}

	public HashMap<String, Object> specialList(int page) {
		int offset = (page-1)*10;
		int totalCount = dao.totalCount();
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<SalesDTO> list = dao.specialList(offset);
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
	}

	public HashMap<String, Object> specialDetail(int special_pk) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SalesDTO dto = dao.specialDetail(special_pk);
		map.put("dto", dto);
		ArrayList<SalesDTO> list = dao.specialEvent(special_pk);
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> detailSearch(int page, String content) {
		content = "%"+content+"%";
		int offset = (page-1)*10;
		int detailCount = dao.detailCount(content);
		int totalPages = detailCount%10>0?(detailCount/10)+1:(detailCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<SalesDTO> list = dao.detailSearch(offset, content);
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
	}

}
