package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

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
	
}
