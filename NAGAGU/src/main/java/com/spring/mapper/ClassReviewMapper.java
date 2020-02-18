package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;
import com.spring.academy.Class_reviewVO;

public interface ClassReviewMapper {
	MemberVO getLoginMemberbyNUM(MemberVO memberVO);
	
	int getReviewCount(HashMap<String, Object> map);
	int getReview_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReviewList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReview_RE_List(HashMap<String, Object> map);

	
	int insertReview(Class_reviewVO reviewVO);
	int getGradePeopleCount(int REVIEW_CLASS);
	Class_reviewVO getReviewVO(int REVIEW_NUM);	
	int modifyReview(Class_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	//삭제
	int findChildrenRE(int REVIEW_NUM);
	int deleteReview(int REVIEW_NUM);
	
	
	int modifyReviewReply(Class_reviewVO reviewVO);
}
