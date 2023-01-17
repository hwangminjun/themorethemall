package com.tmtm.doc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

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

}
