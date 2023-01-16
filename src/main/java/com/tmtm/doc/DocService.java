package com.tmtm.doc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmtm.hr.HRDTO;

@Service
public class DocService {
@Autowired DocDAO docDAO;

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

	public ArrayList<String> docSort(String emp_num, String date) {
		// TODO Auto-generated method stub
		return docDAO.docSort();
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
		
		//addFlashAttribute는 하나의 데이터만 전송 가능==> Map으로 묶어서 한번에 보낸다.
		HashMap<String, Object> doc = new HashMap<String, Object>();
		doc.put("docDetails", docDetails);
		doc.put("docLines", docLines);
		doc.put("docExLines", docExLines);
		
		
		
		return doc;
		
	}

}
