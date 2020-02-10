package com.spring.order;

import java.util.Date;

public class ProductOrderVO {
	private int ORDER_NUM; /* 주문 목록 ID */
	private String ORDER_PRODUCT; /* 완제품 ID */
	private int ORDER_MEMBER; /* 회원 번호 */
	private int ORDER_PRICE; /*총가격*/
	private Date ORDER_DATE;  /* 주문일자 */
	private String ORDER_AMOUNT; /* 수량 */
	private String ORDER_PERSON; /* 수령인 */
	private String ORDER_MEMO; /* 메모 */
	private String ORDER_METHOD; /* 결제방법 */
	private int ORDER_STATE; /* 주문상태 */
	private String ORDER_ADDRESS; /* 주문상태 */
	private int ORDER_PHONE; /* 주문상태 */
	public String getORDER_ADDRESS() {
		return ORDER_ADDRESS;
	}
	public void setORDER_ADDRESS(String oRDER_ADDRESS) {
		ORDER_ADDRESS = oRDER_ADDRESS;
	}
	public int getORDER_PHONE() {
		return ORDER_PHONE;
	}
	public void setORDER_PHONE(int oRDER_PHONE) {
		ORDER_PHONE = oRDER_PHONE;
	}
	public int getORDER_NUM() {
		return ORDER_NUM;
	}
	public void setORDER_NUM(int oRDER_NUM) {
		ORDER_NUM = oRDER_NUM;
	}
	public String getORDER_PRODUCT() {
		return ORDER_PRODUCT;
	}
	public void setORDER_PRODUCT(String oRDER_PRODUCT) {
		ORDER_PRODUCT = oRDER_PRODUCT;
	}
	public int getORDER_MEMBER() {
		return ORDER_MEMBER;
	}
	public void setORDER_MEMBER(int oRDER_MEMBER) {
		ORDER_MEMBER = oRDER_MEMBER;
	}
	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
	public Date getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(Date oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public String getORDER_AMOUNT() {
		return ORDER_AMOUNT;
	}
	public void setORDER_AMOUNT(String oRDER_AMOUNT) {
		ORDER_AMOUNT = oRDER_AMOUNT;
	}
	public String getORDER_PERSON() {
		return ORDER_PERSON;
	}
	public void setORDER_PERSON(String oRDER_PERSON) {
		ORDER_PERSON = oRDER_PERSON;
	}
	public String getORDER_MEMO() {
		return ORDER_MEMO;
	}
	public void setORDER_MEMO(String oRDER_MEMO) {
		ORDER_MEMO = oRDER_MEMO;
	}
	public String getORDER_METHOD() {
		return ORDER_METHOD;
	}
	public void setORDER_METHOD(String oRDER_METHOD) {
		ORDER_METHOD = oRDER_METHOD;
	}
	public int getORDER_STATE() {
		return ORDER_STATE;
	}
	public void setORDER_STATE(int oRDER_STATE) {
		ORDER_STATE = oRDER_STATE;
	}
	
	
	
	
}
