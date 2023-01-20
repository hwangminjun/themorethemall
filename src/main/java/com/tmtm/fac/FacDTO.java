package com.tmtm.fac;

import org.apache.ibatis.type.Alias;

@Alias("fac")
public class FacDTO {
	private String color;
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	private int fac_num;
	private String fac_name;
	private String emp_num;
	private int fac_state;
	private String fac_state_name;
	private String emp_name;
	private int book_num;
	
	private String book_start;

	private String book_end;
	
	private boolean act;
	private int file_sort_num;
	private int file_sort_name;
	private String all_num;
	private String ori_filename;
	private String new_filename;
	private int team_num;
	
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	private String team_name;
	private int dep_num;
	private String dep_name;
	public int getFac_num() {
		return fac_num;
	}
	public void setFac_num(int fac_num) {
		this.fac_num = fac_num;
	}
	public String getFac_name() {
		return fac_name;
	}
	public void setFac_name(String fac_name) {
		this.fac_name = fac_name;
	}
	
	public int getFac_state() {
		return fac_state;
	}
	public void setFac_state(int fac_state) {
		this.fac_state = fac_state;
	}
	public String getFac_state_name() {
		return fac_state_name;
	}
	public void setFac_state_name(String fac_state_name) {
		this.fac_state_name = fac_state_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	
	public String getBook_start() {
		return book_start;
	}
	public void setBook_start(String book_start) {
		this.book_start = book_start;
	}
	public String getBook_end() {
		return book_end;
	}
	public void setBook_end(String book_end) {
		this.book_end = book_end;
	}
	public boolean isAct() {
		return act;
	}
	public void setAct(boolean act) {
		this.act = act;
	}
	public int getFile_sort_num() {
		return file_sort_num;
	}
	public void setFile_sort_num(int file_sort_num) {
		this.file_sort_num = file_sort_num;
	}
	public int getFile_sort_name() {
		return file_sort_name;
	}
	public void setFile_sort_name(int file_sort_name) {
		this.file_sort_name = file_sort_name;
	}
	public String getAll_num() {
		return all_num;
	}
	public void setAll_num(String all_num) {
		this.all_num = all_num;
	}
	public String getOri_filename() {
		return ori_filename;
	}
	public void setOri_filename(String ori_filename) {
		this.ori_filename = ori_filename;
	}
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
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
	public int getDep_num() {
		return dep_num;
	}
	public void setDep_num(int dep_num) {
		this.dep_num = dep_num;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	
	
	
}
