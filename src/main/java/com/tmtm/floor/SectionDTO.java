package com.tmtm.floor;

import org.apache.ibatis.type.Alias;

@Alias("section")
public class SectionDTO {
	
	public String section_num;
	public String section_state;
	public int floor;
	public String emp_num;
	public String emp_name;
	public int team_num;
	public String team_name;
	
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
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getTeam_num() {
		return team_num;
	}
	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	
	
	

}
