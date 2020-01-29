package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;
import com.spring.store.Product_reviewVO;

public interface ProductReviewMapper {
//	int insertreview(Product_reviewVO reviewVO);
	int getReviewCount(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReviewList(HashMap<String, Object> map);
	int insertReview(Product_reviewVO reviewVO);
	ArrayList<MemberVO> getreviewMemberList(HashMap<String, Object> map);
	Product_reviewVO getReviewVO(int REVIEW_NUM);	
	int modifyReview(Product_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	String newReviewImg(int REVIEW_NUM);
	
	int deleteReview(int REVIEW_NUM);
}
