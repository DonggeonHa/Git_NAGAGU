package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.store.ProductVO;
import com.spring.workshop.WorkshopVO;

public interface ProductMapper {
	WorkshopVO selectWorkshop(ProductVO vo);
	int insertProduct(ProductVO vo); 
	int getproductcount(HashMap<String, Object> map);
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map);
	ProductVO getproductVO(int PRODUCT_NUM);
	int updateReadCount(int PRODUCT_NUM);
	int updateGrade(ProductVO vo);
	ArrayList<ProductVO> getMemberLikeProduct(HashMap<String, Object> map);
}
