package com.tmtm.doc;

import org.apache.ibatis.type.Alias;

@Alias("docsend")
public class DocSendDTO {
	private int alarm_num;
	private int alarm_sort_num;
	private String alarm_content;
	private String send_date;
	private String sender;
	private int all_num;
	private String emp_num;//받는 사람

	public int getAlarm_num() {
		return alarm_num;
	}

	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
	}

	public int getAlarm_sort_num() {
		return alarm_sort_num;
	}

	public void setAlarm_sort_num(int alarm_sort_num) {
		this.alarm_sort_num = alarm_sort_num;
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

	public int getAll_num() {
		return all_num;
	}

	public void setAll_num(int all_num) {
		this.all_num = all_num;
	}

	public String getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	
	
}
