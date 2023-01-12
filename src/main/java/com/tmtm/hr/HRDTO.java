package com.tmtm.hr;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("hr")
public class HRDTO {
	// employee
	public String emp_num;
	public String emp_pw;
	public String emp_name;
	public  Date birth;
	public String email;
	public String phone;
	public int team_num;
	public int pos_num;
	public int rank_num;
	public String academy;
	public int state_num;
	public String superior;
	public Date join_date;
	
	//rank
	public String rank_name;
	public int rank_level;
	
	//position
	public String pos_name;
	public int pos_level;
	
	// team
	public String team_name;
	
	
	// departure
	public int dep_num;
	public String dep_name;
	public boolean act;
	
	public String state;
	
	
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_pw() {
		return emp_pw;
	}
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getTeam_num() {
		return team_num;
	}
	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}
	public int getPos_num() {
		return pos_num;
	}
	public void setPos_num(int pos_num) {
		this.pos_num = pos_num;
	}
	public int getRank_num() {
		return rank_num;
	}
	public void setRank_num(int rank_num) {
		this.rank_num = rank_num;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public int getState_num() {
		return state_num;
	}
	public void setState_num(int state_num) {
		this.state_num = state_num;
	}
	public String getSuperior() {
		return superior;
	}
	public void setSuperior(String superior) {
		this.superior = superior;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public int getRank_level() {
		return rank_level;
	}
	public void setRank_level(int rank_level) {
		this.rank_level = rank_level;
	}
	public int getPos_level() {
		return pos_level;
	}
	public void setPos_level(int pos_level) {
		this.pos_level = pos_level;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	

}
