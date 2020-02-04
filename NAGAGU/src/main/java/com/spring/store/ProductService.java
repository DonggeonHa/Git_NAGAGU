package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.community.PicsVO;
import com.spring.workshop.WorkshopVO;

public interface ProductService {

	//productform
	WorkshopVO selectWorkshop(ProductVO vo); 
	boolean insertProduct(ProductVO vo); 
	//ProductList
	int getproductcount(HashMap<String, Object> map);
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map);
	
	//ProductDetail
	ProductVO getproductVO(int PRODUCT_NUM);
	int updateReadCount(int PRODUCT_NUM);
	int updateGrade(ProductVO vo);	//리뷰 등록시 grade update
	
	//경태
	ArrayList<ProductVO> getMemberLikeProduct(HashMap<String, Object> map);//좋아요 사진 리스트
}
