package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface ProductManagementMapper {
	ArrayList<Map<String, Object>> getproductReviewList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductQnaList1(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getReviewSearchList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getQnaSearchList(HashMap<String, Object> map);


}