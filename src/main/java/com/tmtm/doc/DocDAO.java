package com.tmtm.doc;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocDAO {

	ArrayList<DocDTO> sort();

	ArrayList<DocDTO> form(String docType);

	String formContent(String formNum);

	ArrayList<DocDTO> lineList();

	ArrayList<String> teamList();

	ArrayList<String> floorList();

	ArrayList<DocDTO> sectionList(String floor);

	ArrayList<DocDTO> storeList(String emp_num);

	ArrayList<Date> dateList(String storeName);

	ArrayList<DocDTO> unsignedStore(String emp_num, String date);

	ArrayList<String> docSort();

	ArrayList<DocDTO> myDisDocList(String emp_num, String doc_state_num, int doc_sort, String content, int offset);

	int myDisDocListCnt(String emp_num, String doc_state_num, int doc_sort, String content);

	DocDTO getDocDetail(int doc_num);

	ArrayList<DocDTO> getDocLines(int doc_num);

	ArrayList<DocDTO> getDocExLines(int doc_num);

}
