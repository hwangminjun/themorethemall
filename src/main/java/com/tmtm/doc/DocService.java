package com.tmtm.doc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmtm.hr.HRDTO;

@Service
public class DocService {
	@Autowired DocDAO docDAO;
	String sender_emp="";
	Logger logger=LoggerFactory.getLogger(getClass());
	public ArrayList<DocDTO> sort() {
		// TODO Auto-generated method stub
		return docDAO.sort();
	}

	public ArrayList<DocDTO> form(String docType) {
		// TODO Auto-generated method stub
		return docDAO.form(docType);
	}

	public String formContent(String formNum) {
		// TODO Auto-generated method stub
		return docDAO.formContent(formNum);
	}

	public ArrayList<DocDTO> lineList() {
		// TODO Auto-generated method stub
		return docDAO.lineList();
	}

	public ArrayList<String> teamList() {
		// TODO Auto-generated method stub
		return docDAO.teamList();
	}

	public ArrayList<String> floor() {
		// TODO Auto-generated method stub
		return docDAO.floorList();
	}

	public ArrayList<DocDTO> sectionList(String floor) {
		// TODO Auto-generated method stub
		return docDAO.sectionList(floor);
	}

	public ArrayList<DocDTO> storeList(String emp_num) {
		// TODO Auto-generated method stub
		return docDAO.storeList(emp_num);
	}

	public ArrayList<Date> dateList(String storeName) {
		// TODO Auto-generated method stub
		return docDAO.dateList(storeName);
	}

	public ArrayList<DocDTO> unsignedStore(String emp_num, String date) {
		// TODO Auto-generated method stub
		return docDAO.unsignedStore(emp_num, date);
	}

	public HashMap<String, Object> myDisDocList(String emp_num, String doc_state_num, int doc_sort, String content, int page) {
		int offset = (page-1)*10;
		int totalCount = docDAO.myDisDocListCnt(emp_num, doc_state_num, doc_sort, content);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<DocDTO> list = docDAO.myDisDocList(emp_num, doc_state_num, doc_sort, content, offset);

		result.put("total", totalPages);
		result.put("list", list);

		return result;
	}

	public HashMap<String, Object> getDocDetail(int doc_num) {
		DocDTO docDetails = docDAO.getDocDetail(doc_num);//결재 문서 상세
		ArrayList<DocDTO> docLines = docDAO.getDocLines(doc_num);//결재자
		ArrayList<DocDTO> docExLines = docDAO.getDocExLines(doc_num);//참조자
		//결재 종류에 따라 추가 조회
		String docSort = docDetails.getDoc_sort_num();
		HashMap<String, Object> doc = new HashMap<String, Object>();//한번에 묶어서 보낼 Map

		doc.put("docDetails", docDetails);
		doc.put("docLines", docLines);
		doc.put("docExLines", docExLines);
		if(docSort.equals("1")) {
			//이벤트 테이블 조회
			DocDTO docEvent = docDAO.getDocEvent(doc_num);
			doc.put("docBody", docEvent);
		}else if(docSort.equals("2")) {
			//일반 결재
		}else if(docSort.equals("3")) {
			//매출 결재
			ArrayList<DocDTO> docSales = docDAO.getDocSales(doc_num);
			doc.put("docBody", docSales);
		}else {//휴가, 반차, 출장
			DocDTO docExWork = docDAO.getDocEss(doc_num);
			doc.put("docBody", docExWork);
		}


		return doc;

	}

	public void updateDoc(int doc_num) {
		// TODO Auto-generated method stub
		docDAO.updateDoc(doc_num);
	}

	public int insertDoc(String doc_sort_num, String doc_sub, String emp_num, String doc_content,
			String form_num) {
		int doc_num=-1;
		DocDTO docs = new DocDTO();
		docs.setDoc_sort_num(doc_sort_num);
		docs.setDoc_sub(doc_sub);
		docs.setEmp_num(emp_num);
		docs.setDoc_content(doc_content);
		boolean isSuccess = docDAO.insertDoc(docs);
		if(isSuccess) {
			doc_num=docs.getDoc_num();
		}
		if(!form_num.equals("")) {
			docDAO.formUphit(form_num);
		}
		sender_emp=emp_num;//결재자를 전역변수로 저장(알람 전송자 표시용)
		
		return doc_num;
	}

	public void insertDocLine(int doc_num, String[] doclines) {
		// TODO Auto-generated method stub
		for(int i=0;i<doclines.length;i++) {
			String doc_emp = doclines[i];
			docDAO.insertDocLine(doc_num, doc_emp);
		}
		//다음 결재자를 찾아서 결재 순서를 true로 변경해주는 함수
		//결재 순서 true ==> 해당 문서 조회, 서명 및 반려 가능
		nextDocLine(doc_num);
	}

	public void insertExLine(int doc_num, String[] exlines) {
		// TODO Auto-generated method stub
		for(int i=0;i<exlines.length;i++) {
			String doc_emp = exlines[i];
			docDAO.insertDocExLine(doc_num, doc_emp);
		}
	}





	public void insertEventDoc(HashMap<String, String> evParam) {
		docDAO.insertEventDoc(evParam);
	}

	public void insertEssDoc(String emp_num, String start_time, String end_time, String date_type, String doc_num) {
		
		docDAO.insertEssDoc(emp_num,start_time, end_time, date_type, doc_num);
		//팀번호, 시작시간, 종료시간, 등록자, 일정 종류, 내용 / 참가자
	}
	
	//ESS 일정 추가(알림 x)
	/*public void insertEssSchedule(){
	 *		int sch_sort=0;
			if(date_type.equals("휴가")) {
				sch_sort=3;
			}else if(date_type.equals("반차")) {
				sch_sort=4;
			}else {//출장
				sch_sort=5;
			}
		
			DocScheduleDTO sch = new DocScheduleDTO();
			sch.setEmp_num(emp_num);
			sch.setSch_start(start_time);
			sch.setSch_end(end_time);
			sch.setSch_sort(sch_sort);
			sch.setSch_content(date_type);
			
			boolean isSuc = docDAO.insertSchedule(sch);
			int sch_num = sch.getSch_num();
			if(isSuc) {
				docDAO.insertScheduleMem(sch_num, emp_num);
			
			}
		}
	 * */

	public void insertSalesDoc(int doc_num, String store_num, String section_num, String minor_category_num,
			String emp_num, String doc_date, String sales_money) {
		// TODO Auto-generated method stub
		docDAO.insertSalesDoc(doc_num, store_num, section_num, minor_category_num, emp_num, doc_date, sales_money);
	}
	
	public void nextDocLine(int doc_num) {//다음 결재자를 찾아주고 결재 알림을 중 메서드를 실행 메서드
		String nextSignEmp = docDAO.getNextSign(doc_num);
		logger.info(nextSignEmp);
		boolean isSuc = docDAO.setNextSign(doc_num, nextSignEmp);
		if(isSuc) {
			signAlarm(4, sender_emp, doc_num, nextSignEmp);
			
		}
		sender_emp="";//전역변수 초기화
		
		
	}
	
	
	
	public void signAlarm(int alarm_sort_num, String sender, int doc_num, String emp_num) {
		//alarm_sort_num : 어떤 종류의 알림을 보내는지에 대한 정수
		//결재 순서 알림 =4
		//결재 상태변경  =5
		//sender : 보내는 사람(결재자 emp_num), doc_num : 문서 번호, emp_num : 받는 사람
		String alarm_content = "처리할 결재 문서가 추가되었습니다.";
		
		DocSendDTO send = new DocSendDTO();
		send.setAlarm_sort_num(alarm_sort_num);
		send.setAlarm_content(alarm_content);
		send.setSender(sender);
		send.setAll_num(doc_num);
		
		boolean isSend = docDAO.sendAlarm(send);
		if(isSend) {
			int alarm_num = send.getAlarm_num();
			docDAO.setSender(alarm_num, emp_num);
		}
		
		
		
	}
}

