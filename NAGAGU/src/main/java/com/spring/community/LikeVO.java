package com.spring.community;

public class LikeVO {
	private int LIKE_NUM;
	private int LIKE_MEMBER;  /* 회원 번호 */
	private int LIKE_PICS; /* 사진 ID */
	public int getLIKE_NUM() {
		return LIKE_NUM;
	}
	public void setLIKE_NUM(int lIKE_NUM) {
		LIKE_NUM = lIKE_NUM;
	}
	public int getLIKE_MEMBER() {
		return LIKE_MEMBER;
	}
	public void setLIKE_MEMBER(int lIKE_MEMBER) {
		LIKE_MEMBER = lIKE_MEMBER;
	}
	public int getLIKE_PICS() {
		return LIKE_PICS;
	}
	public void setLIKE_PICS(int lIKE_PICS) {
		LIKE_PICS = lIKE_PICS;
	}
	
	
}
