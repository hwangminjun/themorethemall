package com.tmtm.doc;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("doc")
public class DocDTO {
	private int form_num;
	private String doc_sort_num;
	private String doc_sort_name;
	private String form_title;
	private String form_Style;
	
	private String emp_num;
	private String emp_name;
	private String pos_name;
	private String team_name;
	private int rank_num;
	
	private String floor;
	private String section_num;
	private String section_state;
	
	private String store_name;
	private Date doc_date;
	
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date) {
		this.doc_date = doc_date;
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
	public String getDoc_sort_num() {
		return doc_sort_num;
	}
	public void setDoc_sort_num(String doc_sort_nm) {
		this.doc_sort_num = doc_sort_nm;
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


	
	
	
	
	
	
	
	
	
	
	
	
	
}
