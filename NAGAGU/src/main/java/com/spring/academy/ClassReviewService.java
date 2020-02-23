package com.spring.academy;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;
import com.spring.store.Product_reviewVO;

public interface ClassReviewService {
	MemberVO getLoginMemberbyNUM(MemberVO memberVO);
	
	int getReviewCount(HashMap<String, Object> map);
	int getReview_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReviewList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReview_RE_List(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getLoginMemberReview(HashMap<String, Object> map);
	
	int insertReview(Class_reviewVO reviewVO);
	int getGradePeopleCount(int REVIEW_PRODUCT);	//review insert 후 product 테이블의 grade update위해
	Class_reviewVO getReviewVO(int REVIEW_NUM);
	int modifyReview(Class_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	int findChildrenRE(int REVIEW_NUM);
	int deleteReview(int REVIEW_NUM);
	
	int modifyReviewReply(Class_reviewVO reviewVO);	
	
	HashMap<String, Object> getReviewInfo(Class_reviewVO reviewVO);	//공방 관리자페이지
}
