package com.tmtm.msg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("msg")
public class MessageDTO {
	
	public int message_num;
	public int team_num;
	public String emp_num;
	public String message_subject;
	public String message_content;
	public int act;
	public Date message_date;
	
	
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public int getTeam_num() {
		return team_num;
	}
	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getMessage_subject() {
		return message_subject;
	}
	public void setMessage_subject(String message_subject) {
		this.message_subject = message_subject;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public int getAct() {
		return act;
	}
	public void setAct(int act) {
		this.act = act;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	
	

}
