package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;

public interface ProductQnaService {
	int getQnaCount(HashMap<String, Object> map);
	int getQna_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQnaList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQna_RE_List(HashMap<String, Object> map);
	
	int insertQna(Product_qnaVO qnaVO);
	Product_qnaVO getQnaVO(Product_qnaVO qnaVO);
	int modifyQna(Product_qnaVO qnaVO);
	int findChildrenRE(Product_qnaVO qnaVO);
	int deleteQna(Product_qnaVO qnaVO);
}
