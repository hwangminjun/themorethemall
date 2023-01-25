package com.tmtm.doc;

import org.apache.ibatis.type.Alias;

@Alias("doc")
public class DocDTO {
	private int form_num;
	private int doc_sort_num;
	private String doc_sort_name;
	private String form_title;
	private String form_Style;
	private int doc_state_num;
	private String doc_content;
	private String emp_num;
	private String emp_name;
	private String pos_name;
	private String pos_level;
	private String team_name;
	private int rank_num;
	private int team_num;
	
	private String floor;
	private String section_num;
	private String section_state;
	
	private String store_name;
	private String doc_date;
	
	private int minor_category_num;
	private String minor_category_name;
	private String store_num;
	
	private int doc_num;
	private String doc_sub;
	private String doc_reg;
	private String doc_pro;
	private String doc_cause;
	private String doc_state_name;
	private int sales_money;
	
	private boolean doc_line_ref;
	private boolean doc_line_chk;
	
	private String start_time;
	private String end_time;
	private String event_start;
	private String event_finish;
	
	private String date_type;
	
	
	public String getPos_level() {
		return pos_level;
	}
	public void setPos_level(String pos_level) {
		this.pos_level = pos_level;
	}
	public int getTeam_num() {
		return team_num;
	}
	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_finish() {
		return event_finish;
	}
	public void setEvent_finish(String event_finish) {
		this.event_finish = event_finish;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getDate_type() {
		return date_type;
	}
	public void setDate_type(String date_type) {
		this.date_type = date_type;
	}
	public String getMinor_category_name() {
		return minor_category_name;
	}
	public void setMinor_category_name(String minor_category_name) {
		this.minor_category_name = minor_category_name;
	}
	public int getSales_money() {
		return sales_money;
	}
	public void setSales_money(int sales_money) {
		this.sales_money = sales_money;
	}
	public int getDoc_state_num() {
		return doc_state_num;
	}
	public void setDoc_state_num(int doc_state_num) {
		this.doc_state_num = doc_state_num;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public String getDoc_cause() {
		return doc_cause;
	}
	public void setDoc_cause(String doc_cause) {
		this.doc_cause = doc_cause;
	}
	public boolean isDoc_line_ref() {
		return doc_line_ref;
	}
	public void setDoc_line_ref(boolean doc_line_ref) {
		this.doc_line_ref = doc_line_ref;
	}
	public boolean isDoc_line_chk() {
		return doc_line_chk;
	}
	public void setDoc_line_chk(boolean doc_line_chk) {
		this.doc_line_chk = doc_line_chk;
	}

	public String getDoc_pro() {
		return doc_pro;
	}
	public void setDoc_pro(String doc_pro) {
		this.doc_pro = doc_pro;
	}
	public String getDoc_state_name() {
		return doc_state_name;
	}
	public void setDoc_state_name(String doc_state_name) {
		this.doc_state_name = doc_state_name;
	}
	public int getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}
	public String getDoc_sub() {
		return doc_sub;
	}
	public void setDoc_sub(String doc_sub) {
		this.doc_sub = doc_sub;
	}
	public String getDoc_reg() {
		return doc_reg;
	}
	public void setDoc_reg(String doc_reg) {
		this.doc_reg = doc_reg;
	}
	public void setMinor_category_num(int minor_category_num) {
		this.minor_category_num = minor_category_num;
	}
	public int getMinor_category_num() {
		return minor_category_num;
	}
	public void setMinort_category_num(int minor_category_num) {
		this.minor_category_num = minor_category_num;
	}
	public String getStore_num() {
		return store_num;
	}
	public void setStore_num(String store_num) {
		this.store_num = store_num;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getSection_num() {
		return section_num;
	}
	public void setSection_num(String section_num) {
		this.section_num = section_num;
	}
	public String getSection_state() {
		return section_state;
	}
	public void setSection_state(String section_state) {
		this.section_state = section_state;
	}
	public int getRank_num() {
		return rank_num;
	}
	public void setRank_num(int rank_num) {
		this.rank_num = rank_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getForm_Style() {
		return form_Style;
	}
	public void setForm_Style(String form_Style) {
		this.form_Style = form_Style;
	}
	public int getDoc_sort_num() {
		return doc_sort_num;
	}
	public void setDoc_sort_num(int doc_sort_num) {
		this.doc_sort_num = doc_sort_num;
	}
	public int getForm_num() {
		return form_num;
	}
	public void setForm_num(int form_num) {
		this.form_num = form_num;
	}
	public String getDoc_sort_name() {
		return doc_sort_name;
	}
	public void setDoc_sort_name(String doc_sort_name) {
		this.doc_sort_name = doc_sort_name;
	}
	public String getForm_title() {
		return form_title;
	}
	public void setForm_title(String form_title) {
		this.form_title = form_title;
	}
	public String getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(String doc_date) {
		this.doc_date = doc_date;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
}
