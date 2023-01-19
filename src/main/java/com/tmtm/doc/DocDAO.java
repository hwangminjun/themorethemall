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

	ArrayList<DocDTO> lineList(String emp_num);

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

	boolean insertSchedule(DocScheduleDTO sch);

	void insertScheduleMem(int sch_num, String emp_num);

	int recListCount(String keyword, String doc_sort_num, String emp_num);

	ArrayList<DocDTO> recList(String keyword, String doc_sort_num, String emp_num, int offset);

	DocSignDTO getSignState(String doc_num, String emp_num);

	boolean doSign(int doc_num, String emp_num);

	void setDocComp(int doc_num);


	void isSingedSales(int doc_num);

	DocScheduleDTO getSch(int doc_num);

	int getNextSignEmpCnt(int doc_num);

	DocDTO getDocBrief(int doc_num);

	void isSingedEvent(int doc_num);

	boolean docReturn(int doc_num, String cause);

	ArrayList<String> getPreSignedEmp(int doc_num);



}
