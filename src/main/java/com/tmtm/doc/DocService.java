package com.tmtm.doc;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
