package com.tmtm.main;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("login")
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
	private String state_num;
	private String superior;
	private Date joinDate;
	
	
	//name
	private String team_name;
	private String rank_name;
	private String pos_name;
	private String dep_name;
	
	

	//file
	private String new_filename;
	private int file_sort_num;
	private String auth_name;
	private int auth_num;
	
	//career
	private int career_num;
	private Date work_start;
	private Date work_end;
	private String company;
	private String rank;
	private String content;
	
	
	//store
	private String store_num;
	private String store_name;
	private String section_num;
	private String store_pass;
	private int minor_category_num;
	private boolean exist_check;
	private String minor_category_name;
	private int major_category_num;
	private String major_category_name;
	
	public int getCareer_num() {
		return career_num;
	}
	public void setCareer_num(int career_num) {
		this.career_num = career_num;
	}
	public Date getWork_start() {
		return work_start;
	}
	public void setWork_start(Date work_start) {
		this.work_start = work_start;
	}
	public Date getWork_end() {
		return work_end;
	}
	public void setWork_end(Date work_end) {
		this.work_end = work_end;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public String getState_num() {
		return state_num;
	}
	public void setState_num(String state_num) {
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
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}
	public int getFile_sort_num() {
		return file_sort_num;
	}
	public void setFile_sort_num(int file_sort_num) {
		this.file_sort_num = file_sort_num;
	}
	public String getAuth_name() {
		return auth_name;
	}
	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}
	public int getAuth_num() {
		return auth_num;
	}
	public void setAuth_num(int auth_num) {
		this.auth_num = auth_num;
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
	public String getSection_num() {
		return section_num;
	}
	public void setSection_num(String section_num) {
		this.section_num = section_num;
	}
	public String getStore_pass() {
		return store_pass;
	}
	public void setStore_pass(String store_pass) {
		this.store_pass = store_pass;
	}
	public int getMinor_category_num() {
		return minor_category_num;
	}
	public void setMinor_category_num(int minor_category_num) {
		this.minor_category_num = minor_category_num;
	}
	public boolean isExist_check() {
		return exist_check;
	}
	public void setExist_check(boolean exist_check) {
		this.exist_check = exist_check;
	}
	public String getMinor_category_name() {
		return minor_category_name;
	}
	public void setMinor_category_name(String minor_category_name) {
		this.minor_category_name = minor_category_name;
	}
	public int getMajor_category_num() {
		return major_category_num;
	}
	public void setMajor_category_num(int major_category_num) {
		this.major_category_num = major_category_num;
	}
	public String getMajor_category_name() {
		return major_category_name;
	}
	public void setMajor_category_name(String major_category_name) {
		this.major_category_name = major_category_name;
	}
	
	
}
