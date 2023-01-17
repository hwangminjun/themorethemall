package com.tmtm.alarm;

import org.apache.ibatis.type.Alias;

@Alias("alarm")
public class AlarmDTO {
	
	public int alarm_sort_num;
	public String alarm_sort_name;
	public int alarm_num;
	public String alarm_content;
	public String send_date;
	public String sender;
	public String all_num;
	
	public String emp_num;
	public int read_check;
	
	public String emp_name;
	
	public int getAlarm_sort_num() {
		return alarm_sort_num;
	}
	public void setAlarm_sort_num(int alarm_sort_num) {
		this.alarm_sort_num = alarm_sort_num;
	}
	public String getAlarm_sort_name() {
		return alarm_sort_name;
	}
	public void setAlarm_sort_name(String alarm_sort_name) {
		this.alarm_sort_name = alarm_sort_name;
	}
	public int getAlarm_num() {
		return alarm_num;
	}
	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
	}
	public String getAlarm_content() {
		return alarm_content;
	}
	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getAll_num() {
		return all_num;
	}
	public void setAll_num(String all_num) {
		this.all_num = all_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public int getRead_check() {
		return read_check;
	}
	public void setRead_check(int read_check) {
		this.read_check = read_check;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	
	

}
