package com.tmtm.hr;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmtm.main.LoginDTO;
import com.tmtm.msg.MessageDTO;
import com.tmtm.sales.SalesDTO;

@Service
public class HRService {
	
	@Autowired HRDAO hrdao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public HashMap<String, Object> hrlist(int page) {
		int offset = (page-1)*10;
		int totalCount = hrdao.totalCount();
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HRDTO> list = hrdao.hrlist(offset);
		
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
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

	public HashMap<String, Object> teamManage(int page) {
		logger.info("팀관리 리스트");
		int offset = (page-1)*10;
		int totalCount = hrdao.totalCountTeam();
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HRDTO> list = hrdao.teamManage(offset);
		
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
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

	public int teamUp(HashMap<String, String> params) {
		logger.info("팀 수정 서비스");
		return hrdao.teamUp(params);
	}

	public int posUp(HashMap<String, String> params) {
		logger.info("직책 수정 서비스");
		return hrdao.posUp(params);
	}

	public int rankUp(HashMap<String, String> params) {
		logger.info("직급 수정 서비스");
		return hrdao.rankUp(params);
	}

	public ArrayList<HRDTO> empDetail(HashMap<String, String> params) {
		logger.info("직원 상세보기 서비스");
		return hrdao.empDetail(params);
	}

	public int empUpdate(HashMap<String, String> params) {
		logger.info("직원 수정 서비스");
		return hrdao.empUpdate(params);
	}

	public int teamCheck(HashMap<String, String> params) {
		logger.info("팀 활성화 서비스");
		return  hrdao.teamCheck(params);
	}

	public int teamCheckClear(HashMap<String, String> params) {
		logger.info("팀 비활성화 서비스");
		return  hrdao.teamCheckClear(params);
	}

	public int posCheck(HashMap<String, String> params) {
		logger.info("직책 활성화 서비스");
		return hrdao.posCheck(params);
	}

	public int posCheckClear(HashMap<String, String> params) {
		logger.info("직책 비활성화 서비스");
		return hrdao.posCheckClear(params);
	}

	public int rankCheck(HashMap<String, String> params) {
		logger.info("직급 활성화 서비스");
		return hrdao.rankCheck(params);
	}

	public int rankCheckClear(HashMap<String, String> params) {
		logger.info("직급 비활성화 서비스");
		return hrdao.rankCheckClear(params);
	}

	public int OriTeamCheck(HashMap<String, String> params) {
		logger.info("팀 선택 서비스");
		return hrdao.OriTeamCheck(params);
	}

	public int OriPosCheck(HashMap<String, String> params) {
		logger.info("직책 선택 서비스");
		return hrdao.OriPosCheck(params);
	}

	public int OriRankCheck(HashMap<String, String> params) {
		logger.info("직급 선택 서비스");
		return hrdao.OriRankCheck(params);
	}

	public HashMap<String, Object> searchList(HashMap<String, Object> params, int page) {
		logger.info("검색 페이징");
		
		int offset = (page-1)*10;
		params.put("offset", offset);
		int totalCount = hrdao.searchCount(params);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("totalCount : "+totalCount);
		logger.info("totalPages : "+totalPages);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HRDTO> list = hrdao.searchList(params);
		result.put("total", totalPages);
		result.put("list", list);
		
		return result;
	}

	public LoginDTO sessionUp(String id) {
		logger.info("세션 재설정");
		return hrdao.sessionUp(id);
	}

	public boolean teamOverlay(String team_name) {
		String overlay = hrdao.teamOverlay(team_name);
		logger.info("팀 중복 : "+overlay);
		return overlay == null?false: true;
	}

	public boolean posAddOver(String pos_name) {
		String overlay = hrdao.posAddOver(pos_name);
		return overlay == null?false: true;
	}

	public boolean rankOverlay(String rank_name, String rank_num) {
		String overlay = hrdao.rankOverlay(rank_name, rank_num);
		return overlay == null?false: true;
	}

	public int teamMemChk(HashMap<String, String> params) {
		logger.info("팀 비활성화 시 멤버 체크");
		return hrdao.teamMemChk(params);
		
	}

	public int posMemChk(HashMap<String, String> params) {
		logger.info("직책 비활성화 시 멤버 체크");
		return hrdao.posMemChk(params);
	}

	public ArrayList<HRDTO> posList() {
		logger.info("직급 리스트 서비스");
		return hrdao.posList();
	}

	public ArrayList<HRDTO> rankList() {
		logger.info("직책 리스트 서비스");
		return hrdao.rankList();
	}

	public int rankMemChk(HashMap<String, String> params) {
		logger.info("직급 비활성화 시 멤버 체크");
		return hrdao.rankMemChk(params);
	}

	public boolean rankAddOver(String rank_name) {
		String overlay = hrdao.rankAddOver(rank_name);
		return overlay == null?false: true;
	}

	public boolean posUpOver(String pos_name, String pos_num) {
		String overlay = hrdao.posUpOver(pos_name, pos_num);
		return overlay == null?false: true;
	}






}
