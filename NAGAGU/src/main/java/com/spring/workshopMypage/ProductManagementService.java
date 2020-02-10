package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public interface ProductManagementService {
	//review
	ArrayList<Map<String, Object>> getproductReviewList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getReviewSearchList(HashMap<String, Object> map);
	//qna
	ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getQnaSearchList(HashMap<String, Object> map);
	//productlist
	ArrayList<Map<String, Object>> getproductList(HashMap<String, Object> map);

}
