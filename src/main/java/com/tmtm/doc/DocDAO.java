package com.tmtm.doc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

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

	ArrayList<DocDTO> myDisDocList(String emp_num, String doc_state_num, int doc_sort, String content, int offset);

	int myDisDocListCnt(String emp_num, String doc_state_num, int doc_sort, String content);

	DocDTO getDocDetail(int doc_num);

	ArrayList<DocDTO> getDocLines(int doc_num);

	ArrayList<DocDTO> getDocExLines(int doc_num);

	ArrayList<DocDTO> getDocSales(int doc_num);

	void updateDoc(int doc_num);

	DocDTO getDocEvent(int doc_num);

	DocDTO getDocEss(int doc_num);

	boolean insertDoc(DocDTO docs);

	void insertDocLine(int doc_num, String emp);

	String getNextSign(int doc_num);

	void formUphit(String form_num);

	boolean setNextSign(int doc_num, String nextSignEmp);

	void insertDocExLine(int doc_num, String doc_emp);

	void insertEventDoc(HashMap<String, String> evParam);

	void insertEssDoc(String emp_num, String start_time, String end_time, String date_type, String doc_num);

	void insertSalesDoc(int doc_num, String store_num, String section_num, String minor_category_num, String emp_num,
			String doc_date, String sales_money);

	boolean sendAlarm(DocSendDTO send);

	void setSender(int alarm_num, String emp_num);


}
