package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;

public interface ProductQnaService {
	int getQnaCount(HashMap<String, Object> map);
	ArrayList<Product_qnaVO> getQnaList(HashMap<String, Object> map);
	ArrayList<MemberVO> getqnaMemberList(HashMap<String, Object> map);
	int insertQna(Product_qnaVO qnaVO);
}
