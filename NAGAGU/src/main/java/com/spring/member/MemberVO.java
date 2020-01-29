package com.spring.member;

import java.sql.Date;

public class MemberVO {
	private int MEMBER_NUM;
	private String MEMBER_EMAIL;
	private String MEMBER_PASS;
	private String MEMBER_NAME;
	private String MEMBER_NICK;
	private String MEMBER_PHONE;
	private Date MEMBER_DATE;
	private String MEMBER_PICTURE;
	private String MEMBER_LIKE_PRODUCT;
	private int MEMBER_STATUS;
	
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}
	public String getMEMBER_PASS() {
		return MEMBER_PASS;
	}
	public void setMEMBER_PASS(String mEMBER_PASS) {
		MEMBER_PASS = mEMBER_PASS;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_NICK() {
		return MEMBER_NICK;
	}
	public void setMEMBER_NICK(String mEMBER_NICK) {
		MEMBER_NICK = mEMBER_NICK;
	}
	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}
	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}
	public Date getMEMBER_DATE() {
		return MEMBER_DATE;
	}
	public void setMEMBER_DATE(Date mEMBER_DATE) {
		MEMBER_DATE = mEMBER_DATE;
	}
	public String getMEMBER_PICTURE() {
		return MEMBER_PICTURE;
	}
	public void setMEMBER_PICTURE(String mEMBER_PICTURE) {
		MEMBER_PICTURE = mEMBER_PICTURE;
	}
	public String getMEMBER_LIKE_PRODUCT() {
		return MEMBER_LIKE_PRODUCT;
	}
	public void setMEMBER_LIKE_PRODUCT(String mEMBER_LIKE_PRODUCT) {
		MEMBER_LIKE_PRODUCT = mEMBER_LIKE_PRODUCT;
	}
	public int getMEMBER_STATUS() {
		return MEMBER_STATUS;
	}
	public void setMEMBER_STATUS(int mEMBER_STATUS) {
		MEMBER_STATUS = mEMBER_STATUS;
	}
	
	
	
	
}
