package com.tmtm.doc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DocController {
int det_doc_num=0;
String salesDateIn="";
String salesEmp="";
	@Autowired DocService docService;
	Logger logger = LoggerFactory.getLogger(getClass());

	@ResponseBody
	@GetMapping(value = "/doc/docSort.ajax")
	public HashMap<String, Object> callSort(){

		ArrayList<DocDTO> sort = docService.sort();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		return map;
	}

	@ResponseBody
	@GetMapping(value = "/doc/docFormList.ajax")
	public HashMap<String, Object> callForm(@RequestParam String docType){

		ArrayList<DocDTO> form = docService.form(docType);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("form", form);
		return map;
	}


	@ResponseBody
	@GetMapping(value = "/doc/callFormContent.ajax")
	public HashMap<String, Object> formContent(@RequestParam String formNum){

		String content = docService.formContent(formNum);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content", content);
		return map;
	}



	@ResponseBody
	@GetMapping(value = "/doc/line.ajax")
	public HashMap<String, Object> lineList(@RequestParam String emp_num){

		ArrayList<String> teamList = docService.teamList();
		ArrayList<DocDTO> lineList = docService.lineList(emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("emplist", lineList);
		map.put("teamlist", teamList);
		return map;
	}


	@ResponseBody
	@GetMapping(value = "/doc/floor.ajax")
	public HashMap<String, Object> floorList(){

		ArrayList<String> floorList = docService.floor();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", floorList);
		return map;
	}


	@ResponseBody
	@PostMapping(value = "/doc/section.ajax")
	public HashMap<String, Object> sectionList(@RequestParam(required = false) String floor){
		ArrayList<DocDTO> sectionList = docService.sectionList(floor);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", sectionList);
		return map;
	}

	
	@ResponseBody
	@GetMapping(value = "/doc/manageStore.ajax")
	public HashMap<String, Object> store(@RequestParam String emp_num){
		ArrayList<DocDTO> sectionList = docService.storeList(emp_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("store", sectionList);
		return map;
	}

	
	
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping(value = "/doc/availableDate.ajax") public HashMap<String, Object>
	 * getDisDates(@RequestParam String date){
	 * 
	 * 
	 * ArrayList<> dateList = docService.dateList(date); //해당 날짜에 작성된 가게 목록 조회
	 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("list",
	 * dateList); return map; }
	 */
	
	
	  @ResponseBody
	  @GetMapping(value = "/doc/unsignedStore.ajax")
	  public HashMap<String, Object> getUnsignedStore(@RequestParam String emp_num, @RequestParam String date){
		  ArrayList<DocDTO> unStoreList = docService.unsignedStore(emp_num, date);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("list", unStoreList);
	  
		  return map; 
	  }
	 
	
	  
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/myDisDocList.ajax")
	  public HashMap<String, Object> myDisDocList(@RequestParam String emp_num, @RequestParam String doc_state_num, @RequestParam int doc_sort
			  , @RequestParam String keyword, @RequestParam int page, @RequestParam String option){
		  
		  return docService.myDisDocList(emp_num, doc_state_num, doc_sort, keyword, page, option); 
	  }

	  @ResponseBody
	  @GetMapping(value = "/doc/docDetailGo.ajax")
	  public HashMap<String, Object> docDetailGo(@RequestParam int doc_num){
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("doc_num", doc_num);
		  det_doc_num=doc_num;
		  return map; 
	  }
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/docDetail.ajax")
	  public HashMap<String, Object> docDetail(RedirectAttributes rAttr, HttpSession session) {
		  
		  HashMap<String, Object> doc = docService.getDocDetail(det_doc_num);
		  //session.setAttribute("doc", doc);
		  //logger.info("session DOC : {}",session.getAttribute("doc"));
		  HashMap<String, Object> map=new HashMap<String, Object>();
		  map.put("doc", doc);
		  return map;
	  }
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/recoverDoc.ajax")
	  public HashMap<String, Object> recoverDoc(@RequestParam int doc_num){
		  
		  docService.updateDoc(doc_num);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  
	  @ResponseBody
	  @PostMapping(value = "/doc/insertDoc.ajax")
	  public HashMap<String, Object> insertEventDoc(@RequestParam int doc_sort_num, @RequestParam String doc_sub, @RequestParam String emp_num,
			  @RequestParam String doc_content, @RequestParam String form_num,  @RequestParam int team_num){
		  
		  int doc_num = docService.insertDoc(doc_sort_num, doc_sub, emp_num, doc_content, form_num, team_num);
		  det_doc_num=doc_num;
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("doc_num", doc_num);
		  return map; 
	  }

	  @ResponseBody
	  @GetMapping(value = "/doc/insertDocLine.ajax")
	  public HashMap<String, Object> insertDocLine(@RequestParam int doc_num, @RequestParam String[] doclines, @RequestParam(required = false) String[] exlines){
		  
		  docService.insertDocLine(doc_num, doclines);
		  
		  if(exlines!=null) {
			  docService.insertExLine(doc_num, exlines);
			    
		  }
		  
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  @ResponseBody
	  @GetMapping(value = "/doc/insertEventDoc.ajax")
	  public HashMap<String, Object> insertEventDoc(@RequestParam HashMap<String, String> evParam){
		  
		  logger.info(""+evParam+"/"+det_doc_num);
		  String doc_num = Integer.toString(det_doc_num);
		  evParam.put("doc_num", doc_num);
		  docService.insertEventDoc(evParam);
		  
		  
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/insertEssDoc.ajax")
	  public HashMap<String, Object> insertEssDoc(@RequestParam String start_time, @RequestParam String end_time, @RequestParam String date_type, @RequestParam String emp_num){

		  String doc_num = Integer.toString(det_doc_num);
		  docService.insertEssDoc(emp_num, start_time, end_time, date_type, doc_num);
		  
		  
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  
	  
	  @ResponseBody 
	  @GetMapping(value="/doc/setSalesDoc.ajax")
	  public HashMap<String, Object> setSalesDoc(@RequestParam String salesDate, @RequestParam String emp_num) {//미리 전역변수에 변수 저장
		  salesDateIn=salesDate;
		  salesEmp=emp_num;
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  
	  
	  
	  @ResponseBody 
	  @GetMapping(value="/doc/insertSalesDoc.ajax")
	  public HashMap<String, Object> insertSalesDoc(@RequestParam HashMap<String,String> dataSales) {
		  logger.info("dataSales : {}", dataSales.size());
		  String doc_date = salesDateIn;
		  String emp_num=salesEmp;
		  int doc_num=det_doc_num;
		  for(int i=1; i<=(dataSales.size()/4); i++) {
			  String section_num = dataSales.get("param["+i+"].section_num");
			  String minor_category_num = dataSales.get("param["+i+"].minor_category_num");
			  String store_num = dataSales.get("param["+i+"].store_num");
			  String sales_money = dataSales.get("param["+i+"].sales_money");
			  
			  logger.info(section_num+"/"+minor_category_num+"/"+store_num+"/"+sales_money+"/"+doc_date+"/"+emp_num);
			  
			  boolean isSuc = docService.insertSalesDoc(doc_num, store_num, section_num, minor_category_num, emp_num, doc_date, sales_money);
			
		  }
		  logger.info("dataSales : {}", dataSales);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  @ResponseBody 
	  @GetMapping(value="/doc/docRecList.ajax")
	  public HashMap<String, Object> docRecList(@RequestParam int page, @RequestParam String keyword, @RequestParam String doc_sort_num,
			  @RequestParam String emp_num, @RequestParam int doc_state_num, @RequestParam int doc_category_num, @RequestParam String option) {
		  
		  /*
		   * doc_state_num : 문서의 상태
		   * doc_category_num : 서명 체크 여부(0 ==> 서명하지 않은 문서, 1 ==> 서명 했던 문서)
		   * 
		   * */
		  HashMap<String, Object> map = docService.recList(page, keyword, doc_sort_num, emp_num, doc_state_num, doc_category_num, option);
		  return map; 
	  }

	  
	  @ResponseBody 
	  @GetMapping(value="/doc/getSignState.ajax")
	  public HashMap<String, Object> getSignState(@RequestParam String doc_num,@RequestParam String emp_num) {
		  DocSignDTO signState = docService.getSignState(doc_num, emp_num);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("signState", signState);
		  return map; 
	  }
	  
	  @ResponseBody 
	  @PostMapping(value="/doc/doSign.ajax")
	  public HashMap<String, Object> doSign(@RequestParam int doc_num,@RequestParam String emp_num) {
		  docService.doSign(doc_num, emp_num);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  

	  @ResponseBody 
	  @PostMapping(value="/doc/docReturn.ajax")
	  public HashMap<String, Object> docReturm(@RequestParam int doc_num, @RequestParam String emp_num, @RequestParam String sender, @RequestParam String cause) {
		  //여기서 emp_num은 결재문서 기안자의 사번을 가져온다.
		  //sender는 현재 접속한 사번, ==> 반려한 사람.
		  docService.docReturn(doc_num, sender, emp_num, cause);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  return map; 
	  }
	  
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/compDocs.ajax")
	  public HashMap<String, Object> compDocs(@RequestParam String option, @RequestParam String keyword, @RequestParam int doc_sort_num
			  , @RequestParam int doc_state_num, @RequestParam int page){
		  
		  return docService.compDocs(option, keyword, doc_sort_num, doc_state_num, page); 
	  }
	  
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/docExRec.ajax")
	  public HashMap<String, Object> docExRec(@RequestParam String emp_num, @RequestParam String option, @RequestParam String keyword, @RequestParam int doc_sort_num
			  , @RequestParam int doc_state_num, @RequestParam int page){
		  
		  return docService.docExRec(emp_num, option, keyword, doc_sort_num, doc_state_num, page); 
	  }
	  
	  @ResponseBody
	  @GetMapping(value = "/doc/docTeam.ajax")
	  public HashMap<String, Object> docTeam(@RequestParam int team_num, @RequestParam String keyword, @RequestParam int doc_sort_num
			  , @RequestParam int doc_state_num, @RequestParam int page, @RequestParam String option){
		  return docService.docTeam(team_num, keyword, doc_sort_num, doc_state_num, page, option); 
	  }
	  @ResponseBody
	  @GetMapping(value = "/doc/getSignImg.ajax")
	  public HashMap<String, Object> getSignImg(@RequestParam String emp_num){
		  String SignImg = docService.getSignImg(emp_num);
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("signImg", SignImg);
		  return map; 
	  }
}
