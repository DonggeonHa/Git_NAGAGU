package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.academy.Class_qnaVO;

public interface ClassQnaMapper {
	int getQnaCount(HashMap<String, Object> map);
	int getQna_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQnaList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQna_RE_List(HashMap<String, Object> map);
	
	int insertQna(Class_qnaVO qnaVO);		//qna insert
	int PlusQnaStatus(Class_qnaVO qnaVO);	//qna 답변 insert시 원글의 status 수정해줘야함
	Class_qnaVO getQnaVO(Class_qnaVO qnaVO);
	int modifyQna(Class_qnaVO qnaVO);
	int findChildrenRE(Class_qnaVO qnaVO);
	int deleteQna(Class_qnaVO qnaVO);
	int getqnaReCount(Class_qnaVO vo);
	int MinusQnaStatus(Class_qnaVO vo);	//qna 답변 delete시 원글의 status 수정해줘야함

}
