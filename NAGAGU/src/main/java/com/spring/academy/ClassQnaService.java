package com.spring.academy;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;


public interface ClassQnaService {
	int getQnaCount(HashMap<String, Object> map);
	int getQna_RE_Count(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQnaList(HashMap<String, Object> map);
	ArrayList<HashMap<String, Object>> getQna_RE_List(HashMap<String, Object> map);
	
	int insertQna(Class_qnaVO qnaVO);
	Class_qnaVO getQnaVO(Class_qnaVO qnaVO);
	int modifyQna(Class_qnaVO qnaVO);
	int findChildrenRE(Class_qnaVO qnaVO);
	int deleteQna(Class_qnaVO qnaVO);
	
}
