package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HRController {
	
	@Autowired HRService hrservice;
	Logger logger = LoggerFactory.getLogger(getClass());
		
	@PostMapping(value="/hr/list.ajax")
	@ResponseBody
	public HashMap<String, Object> hrlist() {
		logger.info("직원 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> hrlist = hrservice.hrlist();
		ArrayList<HRDTO> deplist = hrservice.deplist();
		ArrayList<HRDTO> ranklist = hrservice.ranklist();
		ArrayList<HRDTO> poslist = hrservice.poslist();
		logger.info("hrlist 사이즈: "+hrlist.size());
		logger.info("deplist 사이즈: "+deplist.size());
		logger.info("ranklist 사이즈: "+ranklist.size());
		logger.info("poslist 사이즈: "+poslist.size());
		map.put("list", hrlist);
		map.put("deplist", deplist);
		map.put("ranklist", ranklist);
		map.put("poslist", poslist);	
		
		return map;
	}
	
	@GetMapping(value="/hr/teamlist.do")
	@ResponseBody
	public HashMap<String, Object> teamlist(@RequestParam String val) {
		logger.info("팀 목록 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> teamlist = hrservice.teamlist(val);
		logger.info("teamlist 사이즈: "+teamlist.size());
		map.put("teamlist", teamlist);		
		
		return map;
	}
	
	

	
	@PostMapping(value="/hr/Teamlist.ajax")
	@ResponseBody
	public HashMap<String, Object> teamList(){
		logger.info("팀 리스트");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HRDTO> teamManage = hrservice.teamManage();
		logger.info("teamManage 사이즈: "+teamManage.size());
		map.put("list", teamManage);
		
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
	
	@RequestMapping(value="/hr/teamDetail")
	public String teamDetail(@RequestParam String team_name, RedirectAttributes rAttr ) {
		logger.info("detail 요청, team_name : "+team_name);
		HRDTO teamDTO = hrservice.teamDetail(team_name);
		
		
		rAttr.addFlashAttribute("teamDetail", teamDTO);
		
		String page = "redirect:/{page}.go";
		
		
		return page;
	}
	
	
	
	
	
	
	
	
	
	
	
//	@PostMapping(value="/hrPos/list.ajax")
//	@ResponseBody
//	public HashMap<String, Object> posList(){
//		logger.info("직책 리스트");
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		ArrayList<HRDTO> posList = hrservice.posList();
//		logger.info("posList사이즈: "+posList.size());
//		map.put("posList", posList);
//		
//		return map;
//		
//	}
	
	
	
	
	
	
	
//	@PostMapping(value="/hr/deplist.ajax")
//	@ResponseBody
//	public HashMap<String, Object> hradd() {
//		logger.info("부서 리스트 불러오기");
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		ArrayList<HRDTO> deplist = hrservice.deplist();
//		logger.info("deplist 사이즈 : "+deplist.size());
//		map.put("deplist", deplist);
//		
//		return map;
//		
//	}
	

}
