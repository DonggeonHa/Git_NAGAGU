package com.spring.note;

import java.util.Date;

public class NoteVO {
	private int NOTE_NUM;
	private String NOTE_SENDER_MAIL;
	private String NOTE_SENDER_NICK;
	private String NOTE_RECEIVER_MAIL;
	private String NOTE_RECEIVER_NICK;
	private String NOTE_TITLE;
	private String NOTE_CONTENT;
	private int NOTE_BOXED;
	private int NOTE_READCOUNT;
	private Date NOTE_DATE;
	private String NOTE_BOXER_MAIL;
	
	public int getNOTE_NUM() {
		return NOTE_NUM;
	}
	public void setNOTE_NUM(int nOTE_NUM) {
		NOTE_NUM = nOTE_NUM;
	}
	public String getNOTE_SENDER_MAIL() {
		return NOTE_SENDER_MAIL;
	}
	public void setNOTE_SENDER_MAIL(String nOTE_SENDER_MAIL) {
		NOTE_SENDER_MAIL = nOTE_SENDER_MAIL;
	}
	public String getNOTE_SENDER_NICK() {
		return NOTE_SENDER_NICK;
	}
	public void setNOTE_SENDER_NICK(String nOTE_SENDER_NICK) {
		NOTE_SENDER_NICK = nOTE_SENDER_NICK;
	}
	public String getNOTE_RECEIVER_MAIL() {
		return NOTE_RECEIVER_MAIL;
	}
	public void setNOTE_RECEIVER_MAIL(String nOTE_RECEIVER_MAIL) {
		NOTE_RECEIVER_MAIL = nOTE_RECEIVER_MAIL;
	}
	public String getNOTE_RECEIVER_NICK() {
		return NOTE_RECEIVER_NICK;
	}
	public void setNOTE_RECEIVER_NICK(String nOTE_RECEIVER_NICK) {
		NOTE_RECEIVER_NICK = nOTE_RECEIVER_NICK;
	}
	public String getNOTE_TITLE() {
		return NOTE_TITLE;
	}
	public void setNOTE_TITLE(String nOTE_TITLE) {
		NOTE_TITLE = nOTE_TITLE;
	}
	public String getNOTE_CONTENT() {
		return NOTE_CONTENT;
	}
	public void setNOTE_CONTENT(String nOTE_CONTENT) {
		NOTE_CONTENT = nOTE_CONTENT;
	}
	public int getNOTE_BOXED() {
		return NOTE_BOXED;
	}
	public void setNOTE_BOXED(int nOTE_BOXED) {
		NOTE_BOXED = nOTE_BOXED;
	}
	public int getNOTE_READCOUNT() {
		return NOTE_READCOUNT;
	}
	public void setNOTE_READCOUNT(int nOTE_READCOUNT) {
		NOTE_READCOUNT = nOTE_READCOUNT;
	}
	public Date getNOTE_DATE() {
		return NOTE_DATE;
	}
	public void setNOTE_DATE(Date nOTE_DATE) {
		NOTE_DATE = nOTE_DATE;
	}
	public String getNOTE_BOXER_MAIL() {
		return NOTE_BOXER_MAIL;
	}
	public void setNOTE_BOXER_MAIL(String nOTE_BOXER_MAIL) {
		NOTE_BOXER_MAIL = nOTE_BOXER_MAIL;
	}
}
