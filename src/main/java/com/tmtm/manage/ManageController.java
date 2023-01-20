package com.tmtm.manage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tmtm.main.LoginController;
import com.tmtm.main.LoginDTO;
import com.tmtm.main.LoginService;

@Controller
public class ManageController {
	
	@Autowired LoginService loginService;
	@Autowired ManageService mngservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="/manage/list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(@RequestParam int page) {
		logger.info("page : "+page);
		
		return mngservice.list(page);
	}
	
	@PostMapping(value = "/manage/authCheck.ajax")
	@ResponseBody
	public HashMap<String, Object> authCheck(@RequestParam String val){
		logger.info("직원별 권한 확인 컨트롤러");
		logger.info("val : "+val);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ManageDTO> authlist = mngservice.authlist();
		ArrayList<ManageDTO> emp_authlist = mngservice.authCheck(val);
		
		map.put("authlist", authlist);
		map.put("emp_authlist", emp_authlist);
		
		return map;
	}
	
	@PostMapping(value = "/manage/authDel.ajax")
	@ResponseBody
	public HashMap<String, Object> authDel(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("권한 삭제 컨트롤러");
		logger.info("params : {}",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mngservice.authDel(params);
		logger.info("수정된 권한 수 : "+row);
		
		String id = params.get("emp_num");
		logger.info("id :"+id);
		
		setAuthSession(params.get("emp_num"), session);
		

		
		return map;
	}
	
	@PostMapping(value = "/manage/authAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> authAdd(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("권한 추가 컨트롤러");
		logger.info("params : {}",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mngservice.authAdd(params);
		logger.info("수정된 권한 수 : "+row);
		
		setAuthSession(params.get("emp_num"), session);
		
		
		return map;
	}
	
	@PostMapping(value="/manage/corTeam.ajax")
	@ResponseBody
	public HashMap<String, Object> corTeam(@RequestParam String emp_num){
		logger.info("emp_num : "+ emp_num);
		logger.info("지닌 권한 확인 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ManageDTO> corTeam = mngservice.corTeam(emp_num);
		ArrayList<ManageDTO> corList = mngservice.corList();
		
		map.put("corTeam", corTeam);
		map.put("corList", corList);
		
		return map;
	}
	
	@PostMapping(value = "/manage/teamDel.ajax")
	@ResponseBody
	public HashMap<String, Object> teamDel(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("협업팀 삭제 컨트롤러");
		logger.info("params : {}",params);		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mngservice.teamDel(params);
		logger.info("수정된 협업 수 : "+row);
		
		
		setTeamSession(params.get("emp_num"), session);
		
		return map;
	}
	
	@PostMapping(value = "/manage/teamAdd.ajax")
	@ResponseBody
	public HashMap<String, Object> teamAdd(@RequestParam HashMap<String, String> params, HttpSession session){
		logger.info("협업팀 추가 컨트롤러");
		logger.info("params : {}",params);		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = mngservice.teamAdd(params);
		logger.info("수정된 협업 수 : "+row);
		
		setTeamSession(params.get("emp_num"), session);		
		
		return map;
	}
	
	@PostMapping(value="/manage/searchList.ajax")
	@ResponseBody
	public HashMap<String, Object> searchList(@RequestParam int page, @RequestParam String detailContent, @RequestParam String sl1) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("detailContent", detailContent);
		params.put("sl1", sl1);
		
		return mngservice.searchList(params, page);
	}
	
	public void setAuthSession(String id, HttpSession session) {
		ArrayList<Integer> authList = loginService.getAuth(id);
		logger.info("권한 사이즈"+authList.size());
		
		session.setAttribute("authority", authList);
		
		logger.info("세션 확인 :" +session.getAttribute("authority"));
	}
	
	public void setTeamSession(String id, HttpSession session) {
		ArrayList<LoginDTO> coorList = loginService.getCoor(id);
		logger.info("협업 사이즈"+coorList.size());
		
		session.setAttribute("coorList", coorList);
		
		logger.info("협업 세션 확인 :" +session.getAttribute("authority"));
		
		
	}

}
