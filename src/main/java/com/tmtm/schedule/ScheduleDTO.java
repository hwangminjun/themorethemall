package com.tmtm.schedule;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("schedule")
public class ScheduleDTO {
	//일정 테이블
	private int sch_num;
	private int team_num;
private LocalDateTime sch_start;
private LocalDateTime sch_end;
	private String emp_num;
	private int sch_sort;
	private boolean act;
	private String sch_content;
	private String color;
	
	//이름
	private String emp_name;
	private String team_name;
	private String sch_sort_name;
	
	//알림
	private int alarm_num;
	private int alarm_sort_num;
	private String alarm_content;
	private LocalDateTime send_date;
	private String sender;
	private String all_num;
	
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
	public LocalDateTime getSend_date() {
		return send_date;
	}
	public void setSend_date(LocalDateTime send_date) {
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getSch_num() {
		return sch_num;
	}
	public void setSch_num(int sch_num) {
		this.sch_num = sch_num;
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
	public int getSch_sort() {
		return sch_sort;
	}
	public void setSch_sort(int sch_sort) {
		this.sch_sort = sch_sort;
	}
	public boolean isAct() {
		return act;
	}
	public void setAct(boolean act) {
		this.act = act;
	}
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getSch_sort_name() {
		return sch_sort_name;
	}
	public void setSch_sort_name(String sch_sort_name) {
		this.sch_sort_name = sch_sort_name;
	}
	public LocalDateTime getSch_start() {
		return sch_start;
	}
	public void setSch_start(LocalDateTime sch_start) {
		this.sch_start = sch_start;
	}
	public LocalDateTime getSch_end() {
		return sch_end;
	}
	public void setSch_end(LocalDateTime sch_end) {
		this.sch_end = sch_end;
	}
	
	
}
