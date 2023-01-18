package com.tmtm.doc;

import org.apache.ibatis.type.Alias;

@Alias("docSign")
public class DocSignDTO {
private int doc_num;
private String emp_num;
private boolean doc_line_ref;
private boolean doc_line_chk;
private boolean doc_sign;
public int getDoc_num() {
	return doc_num;
}
public void setDoc_num(int doc_num) {
	this.doc_num = doc_num;
}
public String getEmp_num() {
	return emp_num;
}
public void setEmp_num(String emp_num) {
	this.emp_num = emp_num;
}
public boolean isDoc_line_ref() {
	return doc_line_ref;
}
public void setDoc_line_ref(boolean doc_line_ref) {
	this.doc_line_ref = doc_line_ref;
}
public boolean isDoc_line_chk() {
	return doc_line_chk;
}
public void setDoc_line_chk(boolean doc_line_chk) {
	this.doc_line_chk = doc_line_chk;
}
public boolean isDoc_sign() {
	return doc_sign;
}
public void setDoc_sign(boolean doc_sign) {
	this.doc_sign = doc_sign;
}
}
