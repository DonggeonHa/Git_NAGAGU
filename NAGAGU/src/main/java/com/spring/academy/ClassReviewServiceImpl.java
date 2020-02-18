package com.spring.academy;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ClassReviewMapper;
import com.spring.member.MemberVO;
import com.spring.academy.Class_reviewVO;

@Service
public class ClassReviewServiceImpl implements ClassReviewService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO getLoginMemberbyNUM(MemberVO memberVO) {
		MemberVO LoginMemberVO = null;
		try {
			ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
			LoginMemberVO = reviewMapper.getLoginMemberbyNUM(memberVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return LoginMemberVO;
	}

	@Override
	public int getReviewCount(HashMap<String, Object> map) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int reviewCount;
		reviewCount = reviewMapper.getReviewCount(map);
		return reviewCount;
	}
	
	@Override
	public int getReview_RE_Count(HashMap<String, Object> map) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int review_RE_Count;
		review_RE_Count = reviewMapper.getReview_RE_Count(map);
		return review_RE_Count;
	}

	@Override
	public ArrayList<HashMap<String, Object>> getReviewList(HashMap<String, Object> map) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		ArrayList<HashMap<String, Object>>  reviewList = null;
		reviewList = reviewMapper.getReviewList(map);
		return reviewList;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> getReview_RE_List(HashMap<String, Object> map) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		ArrayList<HashMap<String, Object>> review_RE_List = null;
		review_RE_List = reviewMapper.getReview_RE_List(map);
		return review_RE_List;
	}
	
	@Override
	public int insertReview(Class_reviewVO reviewVO) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int res;
		System.out.println(reviewVO.getREVIEW_NUM());
		System.out.println(reviewVO.getREVIEW_MEMBER());
		System.out.println(reviewVO.getREVIEW_CLASS());
		System.out.println(reviewVO.getREVIEW_DATE());
		System.out.println(reviewVO.getREVIEW_FILE());
		System.out.println(reviewVO.getREVIEW_CONTENT());
		System.out.println(reviewVO.getREVIEW_GRADE());
		System.out.println(reviewVO.getREVIEW_RE());
		res = reviewMapper.insertReview(reviewVO);
		System.out.println(res);
		return res;
	}

	@Override
	public int getGradePeopleCount(int REVIEW_PRODUCT) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int gradepeoplecount;
		gradepeoplecount = reviewMapper.getGradePeopleCount(REVIEW_PRODUCT);
		return gradepeoplecount;
	}

	@Override
	public Class_reviewVO getReviewVO(int REVIEW_NUM) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		Class_reviewVO reviewVO = null;
		reviewVO = reviewMapper.getReviewVO(REVIEW_NUM);
		return reviewVO;
	}

	@Override
	public int findChildrenRE(int REVIEW_NUM) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int count;
		count = reviewMapper.findChildrenRE(REVIEW_NUM);
		return count;
	}
	
	@Override
	public int deleteReview(int REVIEW_NUM) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int res;
		res = reviewMapper.deleteReview(REVIEW_NUM);
		return res;
	}

	@Override
	public int modifyReview(Class_reviewVO reviewVO) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int res;
		res = reviewMapper.modifyReview(reviewVO);
		return res;
	}

	@Override
	public String getREVIEW_FILE(int REVIEW_NUM) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		String REVIEW_FILE = null;
		REVIEW_FILE = reviewMapper.getREVIEW_FILE(REVIEW_NUM);
		return REVIEW_FILE;
	}
	@Override
	public int deleteReviewImg(Map<String, Object> map) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int res;
		res = reviewMapper.deleteReviewImg(map);
		return res;
	}

	
	@Override
	public int modifyReviewReply(Class_reviewVO reviewVO) {
		ClassReviewMapper reviewMapper = sqlSession.getMapper(ClassReviewMapper.class);
		int res;
		res = reviewMapper.modifyReviewReply(reviewVO);
		return res;
	}
	






}
