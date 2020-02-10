package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;
import com.spring.store.Product_qnaVO;

public interface ProductQnaMapper {
	int getQnaCount(HashMap<String, Object> map);
	int getQna_RE_Count(HashMap<String, Object> map);
	ArrayList<Product_qnaVO> getQnaList(HashMap<String, Object> map);
	ArrayList<Product_qnaVO> getQna_RE_List(HashMap<String, Object> map);
	ArrayList<MemberVO> getqnaMemberList(HashMap<String, Object> map);
	
	int insertQna(Product_qnaVO qnaVO);		//qna insert
	int PlusQnaStatus(Product_qnaVO qnaVO);	//qna 답변 insert시 원글의 status 수정해줘야함
	Product_qnaVO getQnaVO(Product_qnaVO qnaVO);
	int modifyQna(Product_qnaVO qnaVO);
	int findChildrenRE(Product_qnaVO qnaVO);
	int deleteQna(Product_qnaVO qnaVO);
	int getqnaReCount(Product_qnaVO vo);
	int MinusQnaStatus(Product_qnaVO vo);	//qna 답변 delete시 원글의 status 수정해줘야함
}
