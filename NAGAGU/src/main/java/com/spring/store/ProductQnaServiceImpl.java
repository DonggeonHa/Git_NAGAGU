package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductQnaMapper;
import com.spring.member.MemberVO;

@Service
public class ProductQnaServiceImpl implements ProductQnaService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getQnaCount(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int qnaCount;
		qnaCount = qnaMapper.getQnaCount(map);
		return qnaCount;
	}

	@Override
	public int getQna_RE_Count(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int qna_RE_Count;
		qna_RE_Count = qnaMapper.getQna_RE_Count(map);
		return qna_RE_Count;
	}

	@Override
	public ArrayList<Product_qnaVO> getQnaList(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<Product_qnaVO> qnaList = null;
		qnaList = qnaMapper.getQnaList(map);
		return qnaList;
	}

	@Override
	public ArrayList<Product_qnaVO> getQna_RE_List(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<Product_qnaVO> getQna_RE_List = null;
		getQna_RE_List = qnaMapper.getQna_RE_List(map);
		return getQna_RE_List;
	}

	@Override
	public ArrayList<MemberVO> getqnaMemberList(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<MemberVO> qnaMemberList = null;
		qnaMemberList = qnaMapper.getqnaMemberList(map);
		return qnaMemberList;
	}

	@Override
	public int insertQna(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int res = 0;
		res = qnaMapper.insertQna(qnaVO);
		
		return res;
	}

	@Override
	public int modifyQna(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int res;
		res = qnaMapper.modifyQna(qnaVO);
		return res;
	}

	@Override
	public int deleteQna(int QNA_NUM) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int res;
		res = qnaMapper.deleteQna(QNA_NUM);
		return res;
	}



}
