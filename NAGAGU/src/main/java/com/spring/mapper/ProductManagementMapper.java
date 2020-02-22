package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.order.ProductOrderVO;
import com.spring.store.ProductVO;

public interface ProductManagementMapper {
	ArrayList<Map<String, Object>> getproductReviewList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getSelledproductList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getSelledInfo(HashMap<String, Object> map);	//판매된 상품 관리 페이지에서 상세보기

	String[] getOrder_amount(HashMap<String, Object> map);
	int modifyStatus(HashMap<String, Object> map);
	int modifySelledStatus(HashMap<String, Object> map);
	int deleteProducts(HashMap<String, Object> map);
	ProductVO getProductVoOfWorkshop(HashMap<String, Object> map);
	int checkQnaCount(HashMap<String, Object> map);
	int checkReviewCount(HashMap<String, Object> map);
	
	ProductVO getproductDetail(int PRODUCT_NUM);
	int updateProduct(ProductVO productVO);
	
	

}
