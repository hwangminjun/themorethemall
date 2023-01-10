package com.tmtm.hr;

import java.sql.Date;
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
		logger.info("부서목록 리스트 서비스");		
		return hrdao.deplist();
	}

	public ArrayList<HRDTO> teamlist(String val) {
		logger.info("팀목록 리스트 서비스");			
		return hrdao.teamlist(val);
	}

	public ArrayList<HRDTO> ranklist() {
		logger.info("직급 목록 리스트 서비스");
		return hrdao.ranklist();
	}
	
	public ArrayList<HRDTO> poslist() {
		logger.info("직책 목록 리스트 서비스");
		return hrdao.poslist();
	}

	public int hrAdd(HashMap<String, String> params) {
		logger.info("직원 추가 서비스");
				
		// 팀으로 배정된 사람 수  
		int teamCount = hrdao.teamCount(params);
		// 팀으로 배정된 사람 수 + 1 = 고유번호
		int team_plus = teamCount+1;
		
		// 입사년도 가져오기
		String joinDate = params.get("join_date");
		// 입사년도에서 2자리만 추출
		String join_date = joinDate.substring(2,4);
		
		logger.info("join_date : "+join_date);
		
		// 팀번호
		String teamNum = params.get("team_num");
		// 팀번호 2자리 맞추기
		String team_num = String.format("%02d", Integer.parseInt(teamNum));
		
		// 고유번호 3자리로 맞추기
		String employeeNum = String.format("%03d", team_plus);
		
		logger.info("team_num : "+team_num);
		logger.info("employeeNum : "+employeeNum);
		
		// 저장할 사원번호
		String emp_num = join_date+team_num+employeeNum;
				
		logger.info("emp_num : "+emp_num);
				
		
		params.put("emp_num", emp_num);	
		
		
		return hrdao.hrAdd(params);
		
	}

	public ArrayList<HRDTO> teamManage() {
		logger.info("팀관리 리스트");
		return hrdao.teamManage();
	}

	public int teamAdd(HashMap<String, String> params) {
		
		logger.info("팀 추가 서비스");
		return hrdao.teamAdd(params);
	}

	public int posAdd(HashMap<String, String> params) {
		logger.info("직책 추가 서비스");
		return hrdao.posAdd(params);
	}

	public int rankAdd(HashMap<String, String> params) {
		logger.info("직급 추가 서비스");
		return hrdao.rankAdd(params);
	}

	public HRDTO teamDetail(String team_name) {
		logger.info("팀 상세 서비스");
		return hrdao.teamDetail(team_name);
	}



//	public ArrayList<HRDTO> posList() {
//		logger.info("직책관리 리스트");
//		return hrdao.posList();
//	}





	
	
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
