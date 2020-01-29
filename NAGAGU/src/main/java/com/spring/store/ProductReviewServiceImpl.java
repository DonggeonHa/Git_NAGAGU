package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductReviewMapper;
import com.spring.member.MemberVO;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getReviewCount(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int reviewCount;
		reviewCount = reviewMapper.getReviewCount(map);
		return reviewCount;
	}

	@Override
	public ArrayList<Product_reviewVO> getReviewList(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<Product_reviewVO> reviewList = null;
		reviewList = reviewMapper.getReviewList(map);
		return reviewList;
	}

	@Override
	public ArrayList<MemberVO> getreviewMemberList(HashMap<String, Object> map) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		ArrayList<MemberVO> reviewMemberList = null;
		reviewMemberList = reviewMapper.getreviewMemberList(map);
		return reviewMemberList;
	}
	
	@Override
	public int insertReview(Product_reviewVO reviewVO) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		int res;
		res = reviewMapper.insertReview(reviewVO);
		return res;
	}

	@Override
	public Product_reviewVO getReviewVO(int REVIEW_NUM) {
		ProductReviewMapper reviewMapper = sqlSession.getMapper(ProductReviewMapper.class);
		Product_reviewVO reviewVO = null;
		reviewVO = reviewMapper.getReviewVO(REVIEW_NUM);
		return reviewVO;
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



}
