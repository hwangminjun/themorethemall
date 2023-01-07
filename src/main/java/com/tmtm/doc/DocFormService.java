package com.tmtm.doc;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocFormService {
	@Autowired DocFormDAO docFormDAO;
	public int docFormWrite(String title, String content, String writer, int sort) {
		// TODO Auto-generated method stub
		return docFormDAO.docFormWrite(title, content, writer, sort);
	}
	public ArrayList<DocFormDTO> docFormList() {
		// TODO Auto-generated method stub
		return docFormDAO.docFormList();
	}
	public ArrayList<String> docFormSort() {
		// TODO Auto-generated method stub
		return docFormDAO.docFormSort();
	}
	public ArrayList<DocFormDTO> sortSearchList(int sort) {
		// TODO Auto-generated method stub
		return docFormDAO.sortSearchList(sort);
	}
	public ArrayList<DocFormDTO> keywordSearchList(String option, String keyword) {
		// TODO Auto-generated method stub
		return docFormDAO.keywordSearchList(option, keyword);
	}
	public DocFormDTO detail(int index) {
		// TODO Auto-generated method stub
		return docFormDAO.detail(index);
	}

}
