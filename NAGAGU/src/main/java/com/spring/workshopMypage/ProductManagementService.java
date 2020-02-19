package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;
import com.spring.store.ProductVO;


public interface ProductManagementService {
	ArrayList<Map<String, Object>> getproductReviewList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getproductList(HashMap<String, Object> map);
	int modifyStatus(HashMap<String, Object> map);
	int deleteProducts(HashMap<String, Object> map);
	ProductVO getProductVoOfWorkshop(HashMap<String, Object> map);
	int checkQnaCount(HashMap<String, Object> map);
	int checkReviewCount(HashMap<String, Object> map);
	
	//상품 수정
	ProductVO getproductDetail(int PRODUCT_NUM);
	int updateProduct(ProductVO productVO);
}
