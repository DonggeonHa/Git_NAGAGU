package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;

public interface ProductReviewService {
	MemberVO getLoginMemberbyNUM(MemberVO memberVO);
	
	int getReviewCount(HashMap<String, Object> map);
	int getReview_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReviewList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getReview_RE_List(HashMap<String, Object> map);
	
	int insertReview(Product_reviewVO reviewVO);
	int getGradePeopleCount(int REVIEW_PRODUCT);	//review insert 후 product 테이블의 grade update위해
	Product_reviewVO getReviewVO(int REVIEW_NUM);
	int modifyReview(Product_reviewVO reviewVO);
	String getREVIEW_FILE(int REVIEW_NUM);
	int deleteReviewImg(Map<String, Object> map);
	int findChildrenRE(int REVIEW_NUM);
	int deleteReview(int REVIEW_NUM);
	
	int modifyReviewReply(Product_reviewVO reviewVO);	
	
	//경태 리뷰 댓글 가져오기
	ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getLoginMemberReview(HashMap<String, Object> map);
	
	HashMap<String, Object> getReviewInfo(Product_reviewVO reviewVO);	//공방 관리자페이지
//	public ArrayList<CommentVO> getComment(int num);
//	public int commentDelete(int comment_num);
//	public String getPass(int comment_num);
//	public CommentVO detail(int comment_num);
//	public int updateComment(CommentVO commentvo);
}
