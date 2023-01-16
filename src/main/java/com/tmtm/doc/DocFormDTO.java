package com.tmtm.doc;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("docForm")
public class DocFormDTO {
	private int doc_num;
	private String doc_sub;
	private String doc_reg;
	private int form_num;
	private int doc_sort_num;
	private String emp_num;
	private int form_cnt;
	private String form_style;
	private String form_title;
	private Date write_time;
	
	//이름 가져올 용도
	private String emp_name;
	private String doc_sort_name;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	public int getForm_num() {
		return form_num;
	}
	public void setForm_num(int form_num) {
		this.form_num = form_num;
	}
	public int getDoc_sort_num() {
		return doc_sort_num;
	}
	public void setDoc_sort_num(int doc_sort_num) {
		this.doc_sort_num = doc_sort_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public int getForm_cnt() {
		return form_cnt;
	}
	public void setForm_cnt(int form_cnt) {
		this.form_cnt = form_cnt;
	}
	public String getForm_style() {
		return form_style;
	}
	public void setForm_style(String form_style) {
		this.form_style = form_style;
	}
	public String getForm_title() {
		return form_title;
	}
	public void setForm_title(String form_title) {
		this.form_title = form_title;
	}
	public Date getWrite_time() {
		return write_time;
	}
	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDoc_sort_name() {
		return doc_sort_name;
	}
	public void setDoc_sort_name(String doc_sort_name) {
		this.doc_sort_name = doc_sort_name;
	}
}
