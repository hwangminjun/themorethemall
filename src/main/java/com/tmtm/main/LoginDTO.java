package com.tmtm.main;

import java.sql.Date;

public class LoginDTO {
	//emp
	private String emp_num;
	private String emp_pw;
	private String emp_name;
	private Date birth;
	private String email;
	private String phone;
	private int team_num;
	private int pos_num;
	private int rank_num;
	private String academy;
	private boolean state_num;
	private String superior;
	private Date joinDate;
	
	
	//team
	private String team_name;
	private String rank_name;
	private String pos_name;
	private String dep_name;
	
	


	private String new_filename;
	private String auth_name;
	private int auth_num;

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

	public boolean isState_num() {
		return state_num;
	}

	public void setState_num(boolean state_num) {
		this.state_num = state_num;
	}

	public String getSuperior() {
		return superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getRank_name() {
		return rank_name;
	}

	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}

	public String getPos_name() {
		return pos_name;
	}

	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public String getAuth_name() {
		return auth_name;
	}

	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}
	
	public String getNew_filename() {
		return new_filename;
	}

	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}

	public int getAuth_num() {
		return auth_num;
	}

	public void setAuth_num(int auth_num) {
		this.auth_num = auth_num;
	}
	}
