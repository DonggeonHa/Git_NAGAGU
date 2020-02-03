package com.spring.community;

public class FollowVO {
	private int FOLLOW_NUM;  /* 팔로우 ID */
	private int FOLLOW_FROM;  /* 회원 번호 */
	private int FOLLOW_TO;
	public int getFOLLOW_NUM() {
		return FOLLOW_NUM;
	}
	public void setFOLLOW_NUM(int fOLLOW_NUM) {
		FOLLOW_NUM = fOLLOW_NUM;
	}
	public int getFOLLOW_FROM() {
		return FOLLOW_FROM;
	}
	public void setFOLLOW_FROM(int fOLLOW_FROM) {
		FOLLOW_FROM = fOLLOW_FROM;
	}
	public int getFOLLOW_TO() {
		return FOLLOW_TO;
	}
	public void setFOLLOW_TO(int fOLLOW_TO) {
		FOLLOW_TO = fOLLOW_TO;
	}  
}
