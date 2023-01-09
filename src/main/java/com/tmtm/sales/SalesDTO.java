package com.tmtm.sales;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("sales")
public class SalesDTO {

	private int doc_num;
	private String store_num;
	private String section_num;
	private int minor_category_num;
	private String emp_num;
	private Date doc_date;
	private int store_money;
	public int getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}
	public String getStore_num() {
		return store_num;
	}
	public void setStore_num(String store_num) {
		this.store_num = store_num;
	}
	public String getSection_num() {
		return section_num;
	}
	public void setSection_num(String section_num) {
		this.section_num = section_num;
	}
	public int getMinor_category_num() {
		return minor_category_num;
	}
	public void setMinor_category_num(int minor_category_num) {
		this.minor_category_num = minor_category_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date) {
		this.doc_date = doc_date;
	}
	public int getStore_money() {
		return store_money;
	}
	public void setStore_money(int store_money) {
		this.store_money = store_money;
	}
	
	
	
}