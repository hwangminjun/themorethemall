package com.tmtm.sales;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("sales")
public class SalesDTO {

	// doc_sales 테이블
	private int doc_num;
	private String store_num;
	private String section_num;
	private int minor_category_num;
	private String emp_num;
	private Date doc_date;
	private int store_money;
	
	// store 테이블
	private String store_pw;
	private String store_name;
	private int exist_check;
	
	// special_log 테이블
	private int special_pk;
	
	// event_log 테이블
	private String doc_sub;
	private Date event_start; 
	private Date event_finish; 
	
	public String getDoc_sub() {
		return doc_sub;
	}
	public void setDoc_sub(String doc_sub) {
		this.doc_sub = doc_sub;
	}
	public Date getEvent_start() {
		return event_start;
	}
	public void setEvent_start(Date event_start) {
		this.event_start = event_start;
	}
	public Date getEvent_finish() {
		return event_finish;
	}
	public void setEvent_finish(Date event_finish) {
		this.event_finish = event_finish;
	}
	public int getSpecial_pk() {
		return special_pk;
	}
	public void setSpecial_pk(int special_pk) {
		this.special_pk = special_pk;
	}
	private String store_id;
	private Date write_date;
	private int standard;
	private String sale_inc;
	
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getStandard() {
		return standard;
	}
	public void setStandard(int standard) {
		this.standard = standard;
	}
	public String getSale_inc() {
		return sale_inc;
	}
	public void setSale_inc(String sale_inc) {
		this.sale_inc = sale_inc;
	}
	public String getStore_pw() {
		return store_pw;
	}
	public void setStore_pw(String store_pw) {
		this.store_pw = store_pw;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getExist_check() {
		return exist_check;
	}
	public void setExist_check(int exist_check) {
		this.exist_check = exist_check;
	}
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
