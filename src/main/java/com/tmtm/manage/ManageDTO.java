package com.tmtm.manage;

import org.apache.ibatis.type.Alias;

@Alias("mng")
public class ManageDTO {
	
	public String emp_num;
	public String emp_name;
	public String team_name;
	public String dep_name;
	public String pos_name;
	public String rank_name;
	
	public int auth_num;
	public String auth_name;
	
	public int team_num;
	public int dep_num;
	public int act;
	
	public int coo_team;
	
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
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	public String getRank_name() {
		return rank_name;
	}
	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}
	public int getAuth_num() {
		return auth_num;
	}
	public void setAuth_num(int auth_num) {
		this.auth_num = auth_num;
	}
	public String getAuth_name() {
		return auth_name;
	}
	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}
	public int getTeam_num() {
		return team_num;
	}
	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}
	public int getDep_num() {
		return dep_num;
	}
	public void setDep_num(int dep_num) {
		this.dep_num = dep_num;
	}
	public int getAct() {
		return act;
	}
	public void setAct(int act) {
		this.act = act;
	}
	public int getCoo_team() {
		return coo_team;
	}
	public void setCoo_team(int coo_team) {
		this.coo_team = coo_team;
	}
	
	

	
	
	
}
