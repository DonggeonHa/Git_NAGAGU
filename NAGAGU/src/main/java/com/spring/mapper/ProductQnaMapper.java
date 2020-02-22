package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;


import com.spring.store.Product_qnaVO;

public interface ProductQnaMapper {
	int getQnaCount(HashMap<String, Object> map);
	int getQna_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQnaList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQna_RE_List(HashMap<String, Object> map);
	
	int insertQna(Product_qnaVO qnaVO);		//qna insert
	int PlusQnaStatus(Product_qnaVO qnaVO);	//qna 답변 insert시 원글의 status 수정해줘야함
	Product_qnaVO getQnaVO(Product_qnaVO qnaVO);
	int modifyQna(Product_qnaVO qnaVO);
	int findChildrenRE(Product_qnaVO qnaVO);
	int deleteQna(Product_qnaVO qnaVO);
	int getqnaReCount(Product_qnaVO vo);
	int MinusQnaStatus(Product_qnaVO vo);	//qna 답변 delete시 원글의 status 수정해줘야함
	
	HashMap<String, Object> getQnaInfo(Product_qnaVO qnaVO);	//공방 관리자페이지
	Product_qnaVO getQnaReplyInfo(Product_qnaVO qnaVO);
}
