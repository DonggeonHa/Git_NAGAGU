package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;

public interface ProductReviewService {
	MemberVO getLoginMemberbyNUM(MemberVO memberVO);
	
	int getReviewCount(HashMap<String, Object> map);
	int getReview_RE_Count(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReview_MemberList(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReviewList(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReviewList123(HashMap<String, Object> map);
	ArrayList<Product_reviewVO> getReview_RE_List(HashMap<String, Object> map);
	ArrayList<MemberVO> getreviewMemberList(HashMap<String, Object> map);
	ArrayList<MemberVO> getreview_RE_MemberList(HashMap<String, Object> map);
	
	
	
	int insertReview(Product_reviewVO reviewVO);
	int getGradePeopleCount(int REVIEW_PRODUCT);	//review insert 후 product 테이블의 grade update위해
	Product_reviewVO getReviewVO(int REVIEW_NUM);
	int modifyReview(Product_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	String newReviewImg(int REVIEW_NUM);
	
	int findChildrenRE(int REVIEW_NUM);
	int deleteReview(int REVIEW_NUM);
	
	int modifyReview_RE(Product_reviewVO reviewVO);	
	
	//경태 리뷰 댓글 가져오기
	ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getLoginMemberReview(HashMap<String, Object> map);
	
//	public ArrayList<CommentVO> getComment(int num);
//	public int commentDelete(int comment_num);
//	public String getPass(int comment_num);
//	public CommentVO detail(int comment_num);
//	public int updateComment(CommentVO commentvo);
}
