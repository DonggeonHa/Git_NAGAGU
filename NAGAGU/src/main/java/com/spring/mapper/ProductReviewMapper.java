package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;
import com.spring.store.Product_reviewVO;

public interface ProductReviewMapper {
	MemberVO getLoginMemberbyNUM(MemberVO memberVO);
	
	int getReviewCount(HashMap<String, Object> map);
	int getReview_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReviewList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReview_RE_List(HashMap<String, Object> map);

	
	int insertReview(Product_reviewVO reviewVO);
	int getGradePeopleCount(int REVIEW_PRODUCT);
	Product_reviewVO getReviewVO(int REVIEW_NUM);	
	int modifyReview(Product_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	//삭제
	int findChildrenRE(int REVIEW_NUM);
	int deleteReview(int REVIEW_NUM);
	
	
	int modifyReviewReply(Product_reviewVO reviewVO);
	//경태 리뷰 댓글가져오기
	public ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map);
	public ArrayList<Map<String, Object>> getLoginMemberReview(HashMap<String, Object> map);
	
}
