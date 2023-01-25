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

	public ArrayList<DocDTO> lineList(String emp_num) {
		// TODO Auto-generated method stub
		return docDAO.lineList(emp_num);
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

	public HashMap<String, Object> myDisDocList(String emp_num, String doc_state_num, int doc_sort, String content, int page, String option) {
		int offset = (page-1)*10;
		int totalCount = docDAO.myDisDocListCnt(emp_num, doc_state_num, doc_sort, content, option);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<DocDTO> list = docDAO.myDisDocList(emp_num, doc_state_num, doc_sort, content, offset, option);

		result.put("total", totalPages);
		result.put("list", list);

		return result;
	}

	public HashMap<String, Object> getDocDetail(int doc_num) {
		DocDTO docDetails = docDAO.getDocDetail(doc_num);//결재 문서 상세
		ArrayList<DocDTO> docLines = docDAO.getDocLines(doc_num);//결재자
		ArrayList<DocDTO> docExLines = docDAO.getDocExLines(doc_num);//참조자
		ArrayList<DocDTO> returnEmp = docDAO.getReturnEmp(doc_num,"반려");//반려
		ArrayList<String> signImgs = new ArrayList<String>();
		for(int i=0; i<docLines.size(); i++) {
			String signImg = docDAO.getSignImg(docLines.get(i).getEmp_num());
			signImgs.add(signImg);
		}
		
		//결재 종류에 따라 추가 조회
		int docSort = docDetails.getDoc_sort_num();
		HashMap<String, Object> doc = new HashMap<String, Object>();//한번에 묶어서 보낼 Map

		doc.put("docDetails", docDetails);
		doc.put("docLines", docLines);
		doc.put("docExLines", docExLines);
		doc.put("signImgs", signImgs);
		doc.put("returnEmp", returnEmp);
		if(docSort==1) {
			//이벤트 테이블 조회
			DocDTO docEvent = docDAO.getDocEvent(doc_num);
			doc.put("docBody", docEvent);
		}else if(docSort==2) {
			//일반 결재
		}else if(docSort==3) {
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

	public int insertDoc(int doc_sort_num, String doc_sub, String emp_num, String doc_content,
			String form_num, int team_num) {
		int doc_num=-1;
		DocDTO docs = new DocDTO();
		docs.setDoc_sort_num(doc_sort_num);
		docs.setDoc_sub(doc_sub);
		docs.setEmp_num(emp_num);
		docs.setDoc_content(doc_content);
		docs.setTeam_num(team_num);
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

	public boolean insertSalesDoc(int doc_num, String store_num, String section_num, String minor_category_num,
			String emp_num, String doc_date, String sales_money) {
		// TODO Auto-generated method stub
		return docDAO.insertSalesDoc(doc_num, store_num, section_num, minor_category_num, emp_num, doc_date, sales_money);
	}






	public HashMap<String, Object> recList(int page, String keyword, String doc_sort_num, String emp_num, int doc_state_num, int doc_category_num, String option) {
		int offset = (page-1)*10;
		int totalCount = docDAO.recListCount(keyword, doc_sort_num, emp_num, doc_category_num, doc_state_num, option);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		logger.info("총 페이지 수 : {}",totalPages);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<DocDTO> list = docDAO.recList(keyword, doc_sort_num, emp_num, doc_state_num, doc_category_num, offset, option);

		result.put("total", totalPages);
		result.put("list", list);

		return result;
	}

	public DocSignDTO getSignState(String doc_num, String emp_num) {
		// TODO Auto-generated method stub
		return docDAO.getSignState(doc_num, emp_num);
	}

	public void doSign(int doc_num, String emp_num) {
		boolean isSuc = docDAO.doSign(doc_num, emp_num);
		sender_emp = emp_num;
		if(isSuc) {
			nextDocLine(doc_num);
			//doc_log에 처리
		}
	}





	public void nextDocLine(int doc_num) {//다음 결재자를 찾아주고 결재 알림을 중 메서드를 실행 메서드
		String nextSignEmp = docDAO.getNextSign(doc_num);
		int nextSignEmpNum = docDAO.getNextSignEmpCnt(doc_num);//다음 결재자의 수, 없을경우 0 반환
		logger.info(nextSignEmp);
		if(nextSignEmpNum==0) {//다음 결재자가 없다 ==>

			docDAO.setDocComp(doc_num);
			DocDTO doc = new DocDTO();
			doc=docDAO.getDocBrief(doc_num);//결재 문서의 기안자, 문서 상태, 결재 종류를 가져온다.
			int doc_sort_num = doc.getDoc_sort_num();
			String emp_num = doc.getEmp_num();
			
			if(doc_sort_num==1) {
				docDAO.isSingedEvent(doc_num);

			}else if(doc_sort_num==3) {
				docDAO.isSingedSales(doc_num);
				//이 결재의 매출 정보(점포번호, 매출액) 가져와서
				ArrayList<DocDTO> saleDTO = docDAO.getSaleBrief(doc_num);
				for(int i=0; i<saleDTO.size(); i++) {
					
				String store_num = saleDTO.get(i).getStore_num();
				String doc_date = saleDTO.get(i).getDoc_date();
				double sales = saleDTO.get(i).getSales_money();
				double specialStd = docDAO.getSpecialStd();//현재의 특이사항 기준
				double entireAvg = docDAO.getEntireAvg(store_num);//매장의 전체 평균 매출액
				double sale_inc = Math.round((((sales/entireAvg)*100)-100)*100)/100;//둘 째자리까지 표현
				if(Math.abs(sale_inc)>specialStd) {
					  //특이사항 기록
					  docDAO.insertSpecial(store_num, doc_date, specialStd, sale_inc);
				  }
				}
				//비교 후
				//특이사항에 부합되면 기록
			}
			//ESS면 일정 추가
			else if(doc_sort_num>3) {
				DocScheduleDTO sch = new DocScheduleDTO();
				sch = docDAO.getSch(doc_num);
				emp_num = sch.getEmp_num();
				String date_type ="";
				if(doc_sort_num==4) {
					date_type="휴가";
				}else if(doc_sort_num==5) {
					date_type="반차";

				}else {
					date_type="출장";
				}
				sch.setSch_content(date_type);
				sch.setSch_sort(doc_sort_num);
				boolean isSucc = docDAO.insertSchedule(sch);
				int sch_num = sch.getSch_num();
				if(isSucc) {

					docDAO.insertScheduleMem(sch_num, emp_num);
				}
			}
			//결재 완료 알림 뿌리기
			signAlarm(5, sender_emp, doc_num, emp_num);
			
			
		}else {//조회된 것이 있다면 다음 결재자에게 보여지고 알람을 준다.
			boolean isSuc = docDAO.setNextSign(doc_num, nextSignEmp);
			if(isSuc) {
				signAlarm(4, sender_emp, doc_num, nextSignEmp);
			}
		}
	}
	public void signAlarm(int alarm_sort_num, String sender, int doc_num, String emp_num) {
		//alarm_sort_num : 어떤 종류의 알림을 보내는지에 대한 정수
		//결재 순서 알림 =4
		//결재 상태변경  =5
		//sender : 보내는 사람(결재자 emp_num), doc_num : 문서 번호, emp_num : 받는 사람
		String alarm_content = "";
		if(alarm_sort_num==4) {
			alarm_content = "처리할 결재 문서가 추가되었습니다.";
			
		}else if(alarm_sort_num==5) {
			alarm_content = "결재 문서가 승인되었습니다.";
			
		}else {
			alarm_content = "결재 문서가 반려되었습니다.";
			alarm_sort_num=5;//결재 상태 변경으로 초기화
		}
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

	public void docReturn(int doc_num, String sender, String emp_num, String cause) {
		//반려처리 하고
		boolean isSuc = docDAO.docReturn(doc_num, cause);
		//사인 여부 변경
		boolean isSucc = docDAO.doSign(doc_num, sender);
		
		//이전 결재자와 기안자 찾아서
		if(isSuc && isSucc) {
			String writer = emp_num;
			ArrayList<String> receiver = docDAO.getPreSignedEmp(doc_num);//이전 결재자들의 사번을 조회
			receiver.add(writer);//결재문서 기안자 추가
			for(int i=0; i<receiver.size(); i++) {
				signAlarm(3, sender, doc_num, receiver.get(i));
			}
		}
		
		//반려처리 알림 주면 끝
		
		//로그 기록
		docDAO.insertLog(doc_num, sender, "반려");
	}

	public HashMap<String, Object> compDocs(String option, String keyword, int doc_sort_num, int doc_state_num,
			int page) {
		
		int offset = (page-1)*10;
		int totalCount = docDAO.compDocsCnt(option, keyword, doc_sort_num, doc_state_num);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<DocDTO> list = docDAO.compDocs(option, keyword, doc_sort_num, doc_state_num,offset);

		result.put("total", totalPages);
		result.put("list", list);

		return result;
		
	}

	public HashMap<String, Object> docExRec(String emp_num, String option, String keyword, int doc_sort_num, int doc_state_num,
			int page) {
		int offset = (page-1)*10;
		int totalCount = docDAO.docExRecCnt(emp_num, option, keyword, doc_sort_num, doc_state_num);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<DocDTO> list = docDAO.docExRec(emp_num, option, keyword, doc_sort_num, doc_state_num, offset);

		result.put("total", totalPages);
		result.put("list", list);

		return result;
	}

	public HashMap<String, Object> docTeam(int team_num, String keyword, int doc_sort_num, int doc_state_num,
			int page, String option) {
		int offset = (page-1)*10;
		int totalCount = docDAO.docTeamCnt(team_num, keyword, doc_sort_num, doc_state_num, option);
		int totalPages = totalCount%10>0?(totalCount/10)+1:(totalCount/10);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<DocDTO> list = docDAO.docTeam(team_num, keyword, doc_sort_num, doc_state_num, offset, option);

		result.put("total", totalPages);
		result.put("list", list);

		return result;
	}

	public String getSignImg(String emp_num) {
		// TODO Auto-generated method stub
		return docDAO.getSignImg(emp_num);
	}

}
