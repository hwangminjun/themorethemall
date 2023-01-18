package com.tmtm.floor;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmtm.hr.HRDTO;

@Service
public class SectionService {
	
	@Autowired SectionDAO secdao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> secList(int page) {
		logger.info("구역 리스트 서비스");
		
		int offset = (page-1)*10;
		int totalCount = secdao.totalCount();
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<SectionDTO> list = secdao.secList(offset);
		
		result.put("total", totalPages);
		result.put("list", list);
		
		
		return result;
	}

	public ArrayList<SectionDTO> secDetail(String section_num) {
		logger.info("구역 디테일 서비스");
		return secdao.secDetail(section_num);
	}

	public ArrayList<SectionDTO> teamDrop() {
		logger.info("구역 드롭다운 서비스");
		return secdao.teamDrop();
	}

	public ArrayList<SectionDTO> empList(int val) {
		logger.info("직원 드롭다운 서비스");
		return secdao.empList(val);
	}

	public ArrayList<SectionDTO> teamlist(int val) {
		logger.info("팀 재생성 드롭다운 서비스");
		return secdao.teamlist(val);
	}

	public int infoUp(HashMap<String, String> params) {
		logger.info("구역 수정");
		return secdao.infoUp(params);
	}

	public HashMap<String, Object> searchList(HashMap<String, Object> params, int page) {
		logger.info("검색 페이징");
		
		int offset = (page-1)*10;
		params.put("offset", offset);
		int totalCount = secdao.searchCount(params);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("totalCount : "+totalCount);
		logger.info("totalPages : "+totalPages);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<SectionDTO> list = secdao.searchList(params);
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
	}
	



}
