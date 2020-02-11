package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.store.ProductVO;
import com.spring.workshop.WorkShopMemberVO;

public interface ProductMapper {
	WorkShopMemberVO selectWorkshop(ProductVO vo);
	ArrayList<ProductVO> getAllWorkshopProduct(int WORKSHOP_NUM);
	int insertProduct(ProductVO vo); 
	int getproductcount(HashMap<String, Object> map);
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map);
	ProductVO getproductVO(int PRODUCT_NUM);
	int updateReadCount(int PRODUCT_NUM);
	int updateGrade(ProductVO vo);
	HashMap<String, Object> insertProductLike(HashMap<String, Object> map);
	int updateProductLike(HashMap<String, Object> map);
	int getProductLike(HashMap<String, Object> map);	//ProductDetail-좋아요 list뿌리기
	ArrayList<ProductVO> getMemberLikeProduct(HashMap<String, Object> map);
}
