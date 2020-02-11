package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.store.ProductVO;

public interface ProductManagementMapper {
	ArrayList<Map<String, Object>> getproductReviewList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductList(HashMap<String, Object> map);
	int modifyStatus(HashMap<String, Object> map);
	int deleteProducts(HashMap<String, Object> map);
	ProductVO getProductVoOfWorkshop(HashMap<String, Object> map);

}
