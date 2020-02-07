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
	int insertQna(Product_qnaVO qnaVO);
	Product_qnaVO getQnaVO(Product_qnaVO qnaVO);
	int modifyQna(Product_qnaVO qnaVO);
	int findChildrenRE(int QNA_NUM);
	int deleteQna(int QNA_NUM);
}
