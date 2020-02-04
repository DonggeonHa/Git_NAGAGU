package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.workshop.WorkshopVO;

public interface ProductService {

	//productform
	WorkshopVO selectWorkshop(ProductVO vo);
	ArrayList<ProductVO> getAllWorkshopProduct(int WORKSHOP_NUM);
	boolean insertProduct(ProductVO vo); 
	//ProductList
	int getproductcount(HashMap<String, Object> map);
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map);
	
	//ProductDetail-상품VO 가져오기
	ProductVO getproductVO(int PRODUCT_NUM);	//ProductDetail-상품VO 가져오기
	int updateReadCount(int PRODUCT_NUM);	//ProductDetail-조회수 1 증가
	int updateGrade(ProductVO vo);	//리뷰 등록시 grade update
	HashMap<String, Object> insertProductLike(HashMap<String, Object> map);	//ProductDetail-좋아요
	int getProductLike(HashMap<String, Object> map);	//ProductDetail-좋아요 list뿌리기
	
	//경태
	ArrayList<ProductVO> getMemberLikeProduct(HashMap<String, Object> map);//좋아요 사진 리스트
}
