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
	public ArrayList<Product_qnaVO> getQnaList(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<Product_qnaVO> qnaList = null;

		System.out.println("qnastartrow="+map.get("qnastartrow"));
		System.out.println("qnaendrow="+map.get("qnaendrow"));
		qnaList = qnaMapper.getQnaList(map);
		System.out.println("----------impl-----------");
		System.out.println(qnaList.size());
	//	System.out.println(qnaList.get(0).getQNA_CONTENT());
		System.out.println("----------impl-----------");
		return qnaList;
	}

	@Override
	public ArrayList<MemberVO> getqnaMemberList(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<MemberVO> qnaMemberList = null;
		qnaMemberList = qnaMapper.getqnaMemberList(map);
		return qnaMemberList;
	}


	}
