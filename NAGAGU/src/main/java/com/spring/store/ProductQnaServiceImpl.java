package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductQnaMapper;
import com.spring.mapper.ProductReviewMapper;
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
	public ArrayList<HashMap<String, Object>> getQnaList(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<HashMap<String, Object>> qnaList = null;
		qnaList = qnaMapper.getQnaList(map);
		return qnaList;
	}

	@Override
	public ArrayList<HashMap<String, Object>> getQna_RE_List(HashMap<String, Object> map) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		ArrayList<HashMap<String, Object>> getQna_RE_List = null;
		getQna_RE_List = qnaMapper.getQna_RE_List(map);
		return getQna_RE_List;
	}


	@Override
	public int insertQna(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int res, plusQnares = 0;
		res = qnaMapper.insertQna(qnaVO);
		System.out.println(qnaVO.getQNA_STATUS());
		//답글일 경우 원글의 상태 변경해줘야함
		if(qnaVO.getQNA_STATUS()==-1) {
			System.out.println("insert하는 답글의 qna_re : "+qnaVO.getQNA_RE()+" => 원글의 QNA_NUM과 같다.");
			plusQnares = qnaMapper.PlusQnaStatus(qnaVO);
		}	
		return res;
	}

	@Override
	public Product_qnaVO getQnaVO(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		Product_qnaVO vo = null;
		vo = qnaMapper.getQnaVO(qnaVO);
		return vo;
	}

	@Override
	public HashMap<String, Object> getQnaInfo(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		HashMap<String, Object> map = null;
		map = qnaMapper.getQnaInfo(qnaVO);
		return map;
	}

	@Override
	public int modifyQna(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int res;
		res = qnaMapper.modifyQna(qnaVO);
		return res;
	}

	@Override
	public int findChildrenRE(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int count;
		count = qnaMapper.findChildrenRE(qnaVO);
		return count;
	}
	
	@Override
	public int deleteQna(Product_qnaVO qnaVO) {
		ProductQnaMapper qnaMapper = sqlSession.getMapper(ProductQnaMapper.class);
		int res, minusQnares = 0;
		Product_qnaVO vo = qnaMapper.getQnaVO(qnaVO);
		
		res = qnaMapper.deleteQna(qnaVO);
		
		//답글 삭제할 경우, 다른 답변이 더 달려있는지 확인 후 없을 때 원글의 STATUS 변경해줘야함
		if(vo.getQNA_STATUS()==-1) {
			int qnaReCount;
			qnaReCount = qnaMapper.getqnaReCount(vo);
			System.out.println("qnaReCount="+qnaReCount);
			if(qnaReCount == 0) {
				//다른 답글 존재하지 않으므로 상태 변경 필요하다
				minusQnares = qnaMapper.MinusQnaStatus(vo);
			}
			
		
		}			
		return res;
	}

	



}
