package com.tmtm.floor;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("store")
public class StoreDTO {
	
	public String section_num;
	public String section_state;
	public int floor;
	public String emp_num;
	
	public String store_num;
	public String store_name;
	public int minor_category_num;
	public int exist_check;
	
	public int major_category_num;
	public String minor_category_name;
	
	public String major_category_name;
	
	public String emp_name;
	
	public int pact_num;
	public Date lease_start;
	public Date lease_end;
	public String lease_money;

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

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
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

	public int getMinor_category_num() {
		return minor_category_num;
	}

	public void setMinor_category_num(int minor_category_num) {
		this.minor_category_num = minor_category_num;
	}

	public int getExist_check() {
		return exist_check;
	}

	public void setExist_check(int exist_check) {
		this.exist_check = exist_check;
	}

	public int getMajor_category_num() {
		return major_category_num;
	}

	public void setMajor_category_num(int major_category_num) {
		this.major_category_num = major_category_num;
	}

	public String getMinor_category_name() {
		return minor_category_name;
	}

	public void setMinor_category_name(String minor_category_name) {
		this.minor_category_name = minor_category_name;
	}

	public String getMajor_category_name() {
		return major_category_name;
	}

	public void setMajor_category_name(String major_category_name) {
		this.major_category_name = major_category_name;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public int getPact_num() {
		return pact_num;
	}

	public void setPact_num(int pact_num) {
		this.pact_num = pact_num;
	}

	public Date getLease_start() {
		return lease_start;
	}

	public void setLease_start(Date lease_start) {
		this.lease_start = lease_start;
	}

	public Date getLease_end() {
		return lease_end;
	}

	public void setLease_end(Date lease_end) {
		this.lease_end = lease_end;
	}

	public String getLease_money() {
		return lease_money;
	}

	public void setLease_money(String lease_money) {
		this.lease_money = lease_money;
	}


	
	
	

}
