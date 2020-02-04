package com.spring.admin;

import java.sql.Date;

public class AdminMemberVO {
	private int ADMIN_NUM;
	private String ADMIN_ID;
	private String ADMIN_PASS;
	private String ADMIN_NAME;
	private String ADMIN_PHONE;
	private Date ADMIN_DATE;
	
	public int getADMIN_NUM() {
		return ADMIN_NUM;
	}
	public void setADMIN_NUM(int aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}
	public String getADMIN_ID() {
		return ADMIN_ID;
	}
	public void setADMIN_ID(String aDMIN_ID) {
		ADMIN_ID = aDMIN_ID;
	}
	public String getADMIN_PASS() {
		return ADMIN_PASS;
	}
	public void setADMIN_PASS(String aDMIN_PASS) {
		ADMIN_PASS = aDMIN_PASS;
	}
	public String getADMIN_NAME() {
		return ADMIN_NAME;
	}
	public void setADMIN_NAME(String aDMIN_NAME) {
		ADMIN_NAME = aDMIN_NAME;
	}
	public String getADMIN_PHONE() {
		return ADMIN_PHONE;
	}
	public void setADMIN_PHONE(String aDMIN_PHONE) {
		ADMIN_PHONE = aDMIN_PHONE;
	}
	public Date getADMIN_DATE() {
		return ADMIN_DATE;
	}
	public void setADMIN_DATE(Date aDMIN_DATE) {
		ADMIN_DATE = aDMIN_DATE;
	}
	
	
}
