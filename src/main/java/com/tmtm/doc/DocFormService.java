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
	public ArrayList<DocFormDTO> docFormList(String sort, String keyword, int offset, String option) {
		// TODO Auto-generated method stub
		return docFormDAO.docFormList(sort, keyword, offset, option);
	}
	public int docFormListCnt(String sort, String keyword, String option) {
		// TODO Auto-generated method stub
		return docFormDAO.docFormListCnt(sort, keyword, option);
	}
	
	public void update(int det_doc_num, String sort, String title, String content) {
		// TODO Auto-generated method stub
		docFormDAO.update(det_doc_num, sort, title, content);
	}
	public DocFormDTO getDocFormDetail(int det_doc_num) {
		// TODO Auto-generated method stub
		return docFormDAO.getDocFormDetail(det_doc_num);
	}
	public void delete(int det_doc_num) {
		// TODO Auto-generated method stub
		docFormDAO.delete(det_doc_num);
	}

}
