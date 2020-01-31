package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;

public interface ProductReviewService {
	MemberVO getLoginMemberbyNUM(MemberVO memberVO);
	
	int getReviewCount(HashMap<String, Object> map);
	int getReview_RE_Count(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReviewList(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReview_RE_List(HashMap<String, Object> map);
	ArrayList<MemberVO> getreviewMemberList(HashMap<String, Object> map);
	ArrayList<MemberVO> getreview_RE_MemberList(HashMap<String, Object> map);
	
	
	
	int insertReview(Product_reviewVO reviewVO);
	
	Product_reviewVO getReviewVO(int REVIEW_NUM);
	int modifyReview(Product_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	String newReviewImg(int REVIEW_NUM);
	
	int deleteReview(int REVIEW_NUM);
//	public ArrayList<CommentVO> getComment(int num);
//	public int commentDelete(int comment_num);
//	public String getPass(int comment_num);
//	public CommentVO detail(int comment_num);
//	public int updateComment(CommentVO commentvo);
}
