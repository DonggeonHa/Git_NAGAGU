package com.spring.academy;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;

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
	
	//경태 리뷰 댓글 가져오기
//	ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map);
//	ArrayList<Map<String, Object>> getLoginMemberReview(HashMap<String, Object> map);
	
//	public ArrayList<CommentVO> getComment(int num);
//	public int commentDelete(int comment_num);
//	public String getPass(int comment_num);
//	public CommentVO detail(int comment_num);
//	public int updateComment(CommentVO commentvo);
}
