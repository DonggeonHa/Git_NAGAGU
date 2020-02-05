package com.spring.mypage;

public class BasketVO {
	private int BASKET_NUM ; /* 장바구니 ID */
	private int BASKET_MEMBER ; /* 회원 번호 */
	private String BASKET_PRODUCT ; /* 완제품 ID */
	private String BASKET_COLOR ;
	private String BASKET_SIZE	;
	private String BASKET_OPTION ; 
	private int BASKET_AMOUNT ;/* 수량 */
	public int getBASKET_NUM() {
		return BASKET_NUM;
	}
	public void setBASKET_NUM(int bASKET_NUM) {
		BASKET_NUM = bASKET_NUM;
	}
	public int getBASKET_MEMBER() {
		return BASKET_MEMBER;
	}
	public void setBASKET_MEMBER(int bASKET_MEMBER) {
		BASKET_MEMBER = bASKET_MEMBER;
	}
	public String getBASKET_PRODUCT() {
		return BASKET_PRODUCT;
	}
	public void setBASKET_PRODUCT(String bASKET_PRODUCT) {
		BASKET_PRODUCT = bASKET_PRODUCT;
	}
	public String getBASKET_COLOR() {
		return BASKET_COLOR;
	}
	public void setBASKET_COLOR(String bASKET_COLOR) {
		BASKET_COLOR = bASKET_COLOR;
	}
	public String getBASKET_SIZE() {
		return BASKET_SIZE;
	}
	public void setBASKET_SIZE(String bASKET_SIZE) {
		BASKET_SIZE = bASKET_SIZE;
	}
	public String getBASKET_OPTION() {
		return BASKET_OPTION;
	}
	public void setBASKET_OPTION(String bASKET_OPTION) {
		BASKET_OPTION = bASKET_OPTION;
	}
	public int getBASKET_AMOUNT() {
		return BASKET_AMOUNT;
	}
	public void setBASKET_AMOUNT(int bASKET_AMOUNT) {
		BASKET_AMOUNT = bASKET_AMOUNT;
	}
	
}
