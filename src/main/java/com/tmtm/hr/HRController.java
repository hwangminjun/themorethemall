package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tmtm.main.LoginDTO;
import com.tmtm.mypage.MyPageService;

@Controller
public class HRController {
	
	@Autowired MyPageService mypageService;
	@Autowired HRService hrservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@PostMapping(value="/hr/list.ajax")
	@ResponseBody
	public HashMap<String, Object> hrlist(@RequestParam int page) {
		logger.info("page : "+page);
		
		return hrservice.hrlist(page);
	}
	

	@PostMapping(value="/hr/etclist.ajax")
	@ResponseBody
	public HashMap<String, Object> ectlist() {
		logger.info("직원 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> deplist = hrservice.deplist();
		ArrayList<HRDTO> ranklist = hrservice.ranklist();
		ArrayList<HRDTO> poslist = hrservice.poslist();

		logger.info("deplist 사이즈: "+deplist.size());
		logger.info("ranklist 사이즈: "+ranklist.size());
		logger.info("poslist 사이즈: "+poslist.size());
		
		map.put("deplist", deplist);
		map.put("ranklist", ranklist);
		map.put("poslist", poslist);
	
		
		return map;
	}
	
	@GetMapping(value="/hr/teamlist.ajax")
	@ResponseBody
	public HashMap<String, Object> teamlist(@RequestParam String val) {
		logger.info("팀 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> teamlist = hrservice.teamlist(val);
		logger.info("teamlist 사이즈: "+teamlist.size());
		map.put("teamlist", teamlist);		
		
		return map;
	}
	
	

	
	@PostMapping(value="/hr/teamPageList.ajax")
	@ResponseBody
	public HashMap<String, Object> teamList(@RequestParam int page){
		logger.info("팀 리스트");
		logger.info("page : "+page);
		
		return hrservice.teamManage(page);
		
	}
	
	@PostMapping(value="/hr/posList.ajax")
	@ResponseBody
	public HashMap<String, Object> posList(){
		logger.info("직급 리스트");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> posList = hrservice.posList();
		logger.info("posList 사이즈: "+posList.size());
		map.put("list", posList);
		
		return map;
	}
	
	@PostMapping(value="/hr/rankList.ajax")
	@ResponseBody
	public HashMap<String, Object> rankList(){
		logger.info("직급 리스트");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> rankList = hrservice.rankList();
		logger.info("rankList 사이즈: "+rankList.size());
		map.put("list", rankList);
		
		return map;
	}
	
	@PostMapping(value="/hr/empAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> empAdd(@RequestParam HashMap<String, String> params, Model model) {
		logger.info("직원 추가 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.hrAdd(params);
		logger.info("추가된 직원 수 : "+row);
		
		String page = "empList";		
		map.put("page", page);
	
		return map;		
	}
	
	
	@PostMapping(value="/hr/teamAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> teamAdd(@RequestParam HashMap<String, String> params){
		logger.info("팀 추가 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.teamAdd(params);
		logger.info("추가된 팀 수 : "+row);
		
		String page = "teamList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/posAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> posAdd(@RequestParam HashMap<String, String> params){
		logger.info("직책 추가 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.posAdd(params);
		logger.info("추가된 직책 수  : "+row);
		
		String page = "posList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	
	@PostMapping(value="/hr/rankAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> rankAdd(@RequestParam HashMap<String, String> params){
		logger.info("직급 추가 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.rankAdd(params);
		logger.info("추가된 직급 수  : "+row);
		
		String page = "rankList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/teamUp.ajax")
	@ResponseBody
	public HashMap<String, Object> teamUp(@RequestParam HashMap<String, String> params){
		logger.info("팀 수정 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.teamUp(params);
		logger.info("수정된 팀 수  : "+row);
		
		String page = "teamList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/posUP.ajax")
	@ResponseBody
	public HashMap<String, Object> posUp(@RequestParam HashMap<String, String> params){
		logger.info("직책 수정 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.posUp(params);
		logger.info("수정된 직책 수  : "+row);
		
		String page = "posList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/rankUP.ajax")
	@ResponseBody
	public HashMap<String, Object> rankUp(@RequestParam HashMap<String, String> params){
		logger.info("직급 수정 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.rankUp(params);
		logger.info("수정된 직급 수  : "+row);
		
		String page = "rankList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/empDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> empDetail(@RequestParam HashMap<String, String> params){
		logger.info("직원 상세정보 불러오기 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<HRDTO> empDetail = hrservice.empDetail(params);
		logger.info("empDetail 사이즈: "+empDetail.size());
		map.put("empDetail", empDetail);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/empUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> empUpdate(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("직원 수정 컨트롤러");
		logger.info("수정 params : {}",params);


		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = hrservice.empUpdate(params);
		logger.info("수정된 직원 수  : "+row);
		
		String id = params.get("emp_num");
		LoginDTO loginDTOs = (LoginDTO) session.getAttribute("loginInfo");
		String loginId = loginDTOs.getEmp_num();
		
		
		
		
		if(id.equals(loginId)) {
			logger.info("아이디 같음");
			loginDTOs = mypageService.sessionUp(id);
			setEmpSession(id, loginDTOs ,session);
		}
		
		String page = "empList";
		
		map.put("page", page);
		
		return map;
		
	}
	
	@PostMapping(value="/hr/teamCheck.ajax")
	@ResponseBody
	public HashMap<String, Object> teamCheck(@RequestParam HashMap<String, String> params){
		logger.info("팀 체크 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		 int OriTeamCheck = hrservice.OriTeamCheck(params);
		 
		 logger.info("OriCheck : "+OriTeamCheck);
		 
		 String msg = "";
		 int MemChk = hrservice.teamMemChk(params);
		 logger.info("MemChk : "+MemChk);
		 
		 if(OriTeamCheck == 0) {
			 if(MemChk>0) {
				 msg = "팀에 소속된 직원이 있습니다.";
			 }else {
				 hrservice.teamCheckClear(params);
				 logger.info("비활성화 컨트롤러");		
			 }
 
		 }else{
			 hrservice.teamCheck(params);
			 logger.info("활성화 컨트롤러");	

		 }

		String page = "teamList";
		
		map.put("page", page);
		map.put("msg", msg);
		
		return map;
		
	}
	@PostMapping(value="/hr/posCheck.ajax")
	@ResponseBody
	public HashMap<String, Object> posCheck(@RequestParam HashMap<String, String> params){
		logger.info("직책 체크 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		 String msg = "";
		 int OriPosCheck = hrservice.OriPosCheck(params);
		 int MemChk = hrservice.posMemChk(params);
		 logger.info("OriCheck : "+OriPosCheck);
		 logger.info("MemChk : "+MemChk);
		
		 if(OriPosCheck == 0) {
			 if(MemChk>0) {
				 msg = "직책에 할당된 직원이 있습니다.";
			 }else {
				 hrservice.posCheckClear(params);
				 logger.info("비활성화 컨트롤러");		
			 } 
		 }else{
			 hrservice.posCheck(params);
			 logger.info("활성화 컨트롤러");	

		 }
	

		String page = "teamList";
		
		map.put("page", page);
		map.put("msg", msg);
		
		return map;
		
	}	
	@PostMapping(value="/hr/rankCheck.ajax")
	@ResponseBody
	public HashMap<String, Object> rankCheck(@RequestParam HashMap<String, String> params){
		logger.info("직급 체크 컨트롤러");
		logger.info("params : {}",params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String msg = "";
		 int OriRankCheck = hrservice.OriRankCheck(params);
		 int MemChk = hrservice.rankMemChk(params);
		 logger.info("MemChk : "+MemChk);
		 
		 logger.info("OriRankCheck : "+OriRankCheck);
		
		 if(OriRankCheck == 0) {
			 if(MemChk>0) {
				 msg = "직급에 할당된 직원이 있습니다.";
			 }else {
				 hrservice.rankCheckClear(params);
				 logger.info("비활성화 컨트롤러");	
			 }	 
		 }else{
			 hrservice.rankCheck(params);
			 logger.info("활성화 컨트롤러");	

		 }
		
		String page = "teamList";
		
		map.put("page", page);
		map.put("msg", msg);
		
		return map;
		
	}
	
	
	@PostMapping(value="/hr/searchList.ajax")
	@ResponseBody
	public HashMap<String, Object> searchList(@RequestParam int page, @RequestParam String detailContent, @RequestParam String sl1) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("detailContent", detailContent);
		params.put("sl1", sl1);
		
		return hrservice.searchList(params, page);
	}
	
	
	@PostMapping(value ="hr/teamOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> teamOverlay(@RequestParam String team_name){
		boolean teamOverlay = true;
		logger.info("팀 중복 체크 컨트롤러 : "+team_name);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		teamOverlay = hrservice.teamOverlay(team_name);
		map.put("teamOverlay", teamOverlay);
		
		return map;
		
	}

	@PostMapping(value ="hr/posAddOver.ajax")
	@ResponseBody
	public HashMap<String, Object> posAddOver(@RequestParam String pos_name){
		boolean posOverlay = true;
		logger.info("직책 중복 체크 컨트롤러 : "+pos_name);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		posOverlay = hrservice.posAddOver(pos_name);
		map.put("posOverlay", posOverlay);
		
		return map;	
	}
	
	@PostMapping(value ="hr/posUpOver.ajax")
	@ResponseBody
	public HashMap<String, Object> posUpOver(@RequestParam String pos_name, @RequestParam String pos_num){
		boolean posOverlay = true;
		logger.info("직책 중복 체크 컨트롤러 : "+pos_name, pos_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		posOverlay = hrservice.posUpOver(pos_name, pos_num);
		map.put("posOverlay", posOverlay);
		
		return map;	
	}
	
	@PostMapping(value ="hr/rankOver.ajax")
	@ResponseBody
	public HashMap<String, Object> rankOver(@RequestParam String rank_name, @RequestParam String rank_num){
		boolean rankOverlay = true;
		logger.info("직급 중복 체크 컨트롤러 : "+rank_name, rank_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		rankOverlay = hrservice.rankOverlay(rank_name, rank_num);
		map.put("rankOverlay", rankOverlay);
		
		return map;	
	}
	
	@PostMapping(value ="hr/rankAddOver.ajax")
	@ResponseBody
	public HashMap<String, Object> rankAddOver(@RequestParam String rank_name){
		boolean rankOverlay = true;
		logger.info("직급 중복 체크 컨트롤러 : "+rank_name);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		rankOverlay = hrservice.rankAddOver(rank_name);
		map.put("rankOverlay", rankOverlay);
		
		return map;	
	}
	

	

	public void setEmpSession(String id, LoginDTO loginDTOs, HttpSession session) {
		session.setAttribute("loginInfo", loginDTOs);
	}
	
	
	


}
