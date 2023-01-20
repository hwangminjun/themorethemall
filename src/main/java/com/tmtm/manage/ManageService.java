package com.tmtm.manage;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmtm.hr.HRDTO;

@Service
public class ManageService {

	@Autowired ManageDAO mngdao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> list(int page) {
		logger.info("권한협업 직원리스트");
		
		int offset = (page-1)*10;
		int totalCount = mngdao.totalCount();
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}", totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ManageDTO> list = mngdao.list(offset);
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
	}

	public ArrayList<ManageDTO> authCheck(String val) {
		logger.info("직원별 권한 확인 서비스");
		return mngdao.authCheck(val);
	}

	public ArrayList<ManageDTO> authlist() {
		logger.info("권한 리스트 서비스");
		return mngdao.authlist();
	}

	public int authDel(HashMap<String, String> params) {
		logger.info("권한 삭제 서비스");
		return mngdao.authDel(params);
	}

	public int authAdd(HashMap<String, String> params) {
		logger.info("권한 추가 서비스");
		return mngdao.authAdd(params);
	}

	public ArrayList<ManageDTO> corTeam(String emp_num) {
		logger.info("지닌 권한 확인 서비스");
		return mngdao.corTeam(emp_num);
	}

	public ArrayList<ManageDTO> corList() {
		logger.info("팀 리스트 확인 서비스");
		return mngdao.corList();
	}

	public int teamDel(HashMap<String, String> params) {
		logger.info("협업팀 삭제 서비스");
		return mngdao.teamDel(params);
	}

	public int teamAdd(HashMap<String, String> params) {
		logger.info("협업팀 추가 서비스");
		return mngdao.teamAdd(params);
	}

	public HashMap<String, Object> searchList(HashMap<String, Object> params, int page) {
		logger.info("검색 페이징");
		
		int offset = (page-1)*10;
		params.put("offset", offset);
		int totalCount = mngdao.searchCount(params);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		logger.info("totalCount : "+totalCount);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HRDTO> list = mngdao.searchList(params);
		result.put("total", totalPages);
		result.put("list", list);
		
		
		return result;
	}


	
}
