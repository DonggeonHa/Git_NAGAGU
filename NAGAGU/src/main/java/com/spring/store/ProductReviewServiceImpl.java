package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PicsCommentMapper;
import com.spring.mapper.ProductReviewMapper;
import com.spring.member.MemberVO;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO getLoginMemberbyNUM(MemberVO memberVO) {
		MemberVO LoginMemberVO = null;
		try {
			ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
			LoginMemberVO = reviewMapper.getLoginMemberbyNUM(memberVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return LoginMemberVO;
	}

	@Override
	public int getReviewCount(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int reviewCount;
		reviewCount = reviewMapper.getReviewCount(map);
		return reviewCount;
	}
	
	@Override
	public int getReview_RE_Count(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int review_RE_Count;
		review_RE_Count = reviewMapper.getReview_RE_Count(map);
		return review_RE_Count;
	}

	@Override
	public ArrayList<Product_reviewVO> getReview_MemberList(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<Product_reviewVO> reviewList = null;
		reviewList = reviewMapper.getReviewList(map);
		return reviewList;
	}
	@Override
	public ArrayList<Product_reviewVO> getReviewList(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<Product_reviewVO> reviewList = null;
		reviewList = reviewMapper.getReviewList(map);
		return reviewList;
	}
	@Override
	public ArrayList<Product_reviewVO> getReviewList123(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<Product_reviewVO> reviewList = null;
		reviewList = reviewMapper.getReviewList123(map);
		return reviewList;
	}

	@Override
	public ArrayList<Product_reviewVO> getReview_RE_List(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<Product_reviewVO> review_RE_List = null;
		review_RE_List = reviewMapper.getReview_RE_List(map);
		return review_RE_List;
	}
	
	@Override
	public ArrayList<Product_reviewVO> getReview_RE_List123(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<Product_reviewVO> review_RE_List = null;
		review_RE_List = reviewMapper.getReview_RE_List123(map);
		return review_RE_List;
	}
	
	@Override
	public ArrayList<MemberVO> getreviewMemberList(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<MemberVO> reviewMemberList = null;
		reviewMemberList = reviewMapper.getreviewMemberList(map);
		return reviewMemberList;
	}
	
	@Override
	public ArrayList<MemberVO> getreview_RE_MemberList(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<MemberVO> review_RE_MemberList = null;
		review_RE_MemberList = reviewMapper.getreview_RE_MemberList(map);
		return review_RE_MemberList;
	}

	@Override
	public int insertReview(Product_reviewVO reviewVO) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int res;
		res = reviewMapper.insertReview(reviewVO);
		return res;
	}

	@Override
	public int getGradePeopleCount(int REVIEW_PRODUCT) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int gradepeoplecount;
		gradepeoplecount = reviewMapper.getGradePeopleCount(REVIEW_PRODUCT);
		return gradepeoplecount;
	}

	@Override
	public Product_reviewVO getReviewVO(int REVIEW_NUM) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		Product_reviewVO reviewVO = null;
		reviewVO = reviewMapper.getReviewVO(REVIEW_NUM);
		return reviewVO;
	}

	@Override
	public int findChildrenRE(int REVIEW_NUM) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int count;
		count = reviewMapper.findChildrenRE(REVIEW_NUM);
		return count;
	}
	
	@Override
	public int deleteReview(int REVIEW_NUM) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int res;
		res = reviewMapper.deleteReview(REVIEW_NUM);
		return res;
	}

	@Override
	public int modifyReview(Product_reviewVO reviewVO) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int res;
		res = reviewMapper.modifyReview(reviewVO);
		return res;
	}

	@Override
	public String getREVIEW_FILE(int REVIEW_NUM) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		String REVIEW_FILE = null;
		REVIEW_FILE = reviewMapper.getREVIEW_FILE(REVIEW_NUM);
		return REVIEW_FILE;
	}
	@Override
	public int deleteReviewImg(Map<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int res;
		res = reviewMapper.deleteReviewImg(map);
		return res;
	}

	@Override
	public String newReviewImg(int REVIEW_NUM) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		String newReviewImg = null;
		newReviewImg = reviewMapper.newReviewImg(REVIEW_NUM);
		return newReviewImg;
	}

	
	@Override
	public int modifyReview_RE(Product_reviewVO reviewVO) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int res;
		res = reviewMapper.modifyReview_RE(reviewVO);
		return res;
	}
	
	//경태<리뷰 댓글 가져오기>
	@Override
	public ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> commentList =null;
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		commentList= reviewMapper.getLoginMemberReply(map);
		System.out.println("getLoginMemberReply Impl결과="+commentList);
		return commentList;
	}
	//경태<리뷰 가져오기>
	@Override
	public ArrayList<Map<String, Object>> getLoginMemberReview(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> reviewList =null;
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		reviewList= reviewMapper.getLoginMemberReview(map);
		System.out.println("getLoginMemberReview Impl결과="+reviewList);
		return reviewList;
	}





}
