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
	public ArrayList<DocFormDTO> docFormList(int offset) {
		// TODO Auto-generated method stub
		return docFormDAO.docFormList(offset);
	}
	public int docFormListCnt() {
		// TODO Auto-generated method stub
		return docFormDAO.docFormListCnt();
	}
	public ArrayList<String> docFormSort() {
		// TODO Auto-generated method stub
		return docFormDAO.docFormSort();
	}
	public ArrayList<DocFormDTO> sortSearchList(int sort, int offset) {
		// TODO Auto-generated method stub
		return docFormDAO.sortSearchList(sort, offset);
	}
	public ArrayList<DocFormDTO> keywordSearchList(String option, String keyword, int offset) {
		// TODO Auto-generated method stub
		return docFormDAO.keywordSearchList(option, keyword, offset);
	}
	public DocFormDTO detail(int index) {
		// TODO Auto-generated method stub
		return docFormDAO.detail(index);
	}
	public void update(int num, String title, String content) {
		// TODO Auto-generated method stub
		docFormDAO.update(num, title, content);
	}
	public int sortSearchListCnt(int sort) {
		// TODO Auto-generated method stub
		return docFormDAO.sortSearchListCnt(sort);
	}
	public int keywordSearchListCnt(String option, String keyword) {
		// TODO Auto-generated method stub
		return docFormDAO.keywordSearchListCnt(option, keyword);
	}

}
