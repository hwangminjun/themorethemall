package com.tmtm.fac;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Controller
public class FacController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final FacService service;
	public FacController(FacService service) {
		this.service = service;
	}
	
	@GetMapping(value="/fac/list.ajax") //=------
	public HashMap<String, Object> home() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date date = new Date();
		
		
		Calendar calendar = Calendar.getInstance();
		Date day = calendar.getTime();
		SimpleDateFormat state = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		state.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowState = state.format(date);
		ArrayList<FacDTO> overlap = service.overlap(nowState);
		logger.info("nowState : " + nowState);
		ArrayList<FacDTO> facList = service.facList(nowState);
		
		map.put("overlap", overlap);
		map.put("facList", facList);
		
		return map;
	}
	 
	@GetMapping(value = "/fac/deplist.ajax")//=====
	public HashMap<String, Object> part(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> depList = service.part();
		ArrayList<FacDTO> book_num = service.book();
		logger.info("partList {}" + depList);
		map.put("book_num",book_num);
		map.put("depList", depList);
		return map;
	}
	
	@GetMapping(value = "/fac/teamlist.ajax")//=====
	public HashMap<String, Object> team(@RequestParam int dep_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> teamList = service.team(dep_num);
		logger.info("partList {}" + teamList);
		map.put("teamList", teamList);
		return map;
	}
	
	@GetMapping(value = "/fac/emplist.ajax")//=====
	public HashMap<String, Object> team(@RequestParam String team_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> empList = service.emp(team_num);
		logger.info("empList {}" + empList);
		map.put("empList", empList);
		return map;
	}
	
	
	 @GetMapping(value = "/fac/register.ajax")
	 public HashMap<String, Object>facRegister 
	 (@RequestParam HashMap<String, Object> param, @RequestParam(value="members[]") ArrayList<String> members){
		 logger.info("param:{}"+param);
		 String page = "facList";
		 HashMap<String, Object> map = new HashMap<String, Object>(); 
		 int timeChk = service.timeCheck(param);
		 //String msg = "";
		 if(timeChk == 0) {
			 boolean row =service.regList(param,members);
			 page = "facDetail";
		 }else {
			 //msg = "예약된 시간입니다.";
			 //map.put("timeChk", timeChk);
		 }
		 logger.info("timeChk : " + timeChk);
		 
		 
		 map.put("timeChk", timeChk);
		 map.put("page", page); 
		 return map; 
		 }
	 
	@GetMapping(value = "/fac/bookList.ajax")
	public HashMap<String, Object> bookList(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> bookList = service.bookList();
		logger.info("bookList : " + bookList);
		map.put("bookList", bookList);
		return map;
	}
	
	@GetMapping(value = "/fac/detail.ajax")
	public HashMap<String, Object> detail(@RequestParam String emp_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> booker = service.detail(emp_num);
		map.put("booker", booker);
		return map;
	}
	
	@GetMapping(value = "/fac/myBookList.ajax")
	public HashMap<String, Object> regList(@RequestParam HashMap<String, Object> params){
		logger.info("받아왔어유~~~"+params);
		HashMap<String, Object>  map = new HashMap<String, Object>();
		ArrayList<FacDTO> myBookList = service.myBook(params);
		logger.info("myBookList" + myBookList);
		map.put("myBookList", myBookList);
		return map;
	}
	
	@GetMapping(value = "/fac/modalList.ajax")
	public HashMap<String, Object> madalList(@RequestParam int book_num){
		logger.info("모달에서 예약번호를 뿌릴거예유~~~~" + book_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> modalList = service.modalList(book_num);
		map.put("modalList", modalList);
		return map;
	}
	
	@GetMapping(value = "fac/update.ajax")
	public HashMap<String, Object> update(@RequestParam HashMap<String, Object> params, @RequestParam(value="members[]") ArrayList<String> members){
		logger.info("params : {}", params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int timeChk = service.timeCheck(params);
		logger.info("timeChk"+ timeChk);
		String page = "facList";
		String msg = "";
		if(timeChk == 0) {
			boolean upList = service.update(params,members);
			logger.info("upList : @@@@@@@" + upList);
			page = "facDetail";
			msg="예약수정이 완료되었습니다.";
			if(upList == false) {
				msg="해당 예약의 작성자가 아닙니다.";
			}
		}else {
			msg = "중복된 시간이 있습니다";
		}
		
			
	
		map.put("msg", msg);
		map.put("timeChk", timeChk);
		map.put("page", page);
		return map;
	}
	
	@GetMapping(value="/fac/delete.ajax")
	public HashMap<String, Object> delete(@RequestParam int book_num, @RequestParam int emp_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int delList = service.delete(book_num,emp_num);
		logger.info("delList ****************"+ delList);
		String msg = "";
	
		if(delList > 0) {
			msg = "삭제가 완료되었습니다.";
		}else {
			msg = "해당 예약의 작성자가 아닙니다.";
		}
		map.put("msg", msg);
		return map;
	}
	
	@GetMapping(value = "/fac/empNum.ajax")
	public HashMap<String, Object> emp(Model model){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> emp_num = service.emp_num();
		map.put("emp_num", emp_num);
		model.addAttribute("emp_num", model);
		return map;
	}
	
	///ddddddd
	@GetMapping(value = "fac/facnameList.ajax")
	public HashMap<String, Object> name(@RequestParam int fac_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<FacDTO> id = service.nameList(fac_num);
		map.put("id", id);
		return map;
	}
	
	
	
}
