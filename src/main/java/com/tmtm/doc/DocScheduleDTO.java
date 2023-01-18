package com.tmtm.doc;

import org.apache.ibatis.type.Alias;

@Alias("docSchedule")
public class DocScheduleDTO {
	private int sch_num;
	private int team_num;
	private String sch_start;
	private String sch_end;
	private String emp_num;
	private int sch_sort;
	private String sch_content;
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
	public String getSch_start() {
		return sch_start;
	}
	public void setSch_start(String sch_start) {
		this.sch_start = sch_start;
	}
	public String getSch_end() {
		return sch_end;
	}
	public void setSch_end(String sch_end) {
		this.sch_end = sch_end;
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
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	
	
	
}
